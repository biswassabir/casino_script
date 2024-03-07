<?php

namespace App\Models;

use App\Constants\Status;
use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable {
    use HasApiTokens, Searchable;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'ver_code',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'address'           => 'object',
        'kyc_data'          => 'object',
        'ver_code_send_at'  => 'datetime',
    ];

    protected $data = [
        'data' => 1,
    ];

    public function loginLogs() {
        return $this->hasMany(UserLogin::class);
    }

    public function transactions() {
        return $this->hasMany(Transaction::class)->orderBy('id', 'desc');
    }

    public function deposits() {
        return $this->hasMany(Deposit::class)->where('status', '!=', Status::PAYMENT_INITIATE);
    }

    public function withdrawals() {
        return $this->hasMany(Withdrawal::class)->where('status', '!=', Status::PAYMENT_INITIATE);
    }

    public function referrer() {
        return $this->belongsTo(User::class, 'ref_by');
    }

    public function referrals() {
        return $this->hasMany(User::class, 'ref_by');
    }

    public function allReferrals() {
        return $this->referrals()->with('referrer');
    }

    public function fullname(): Attribute {
        return new Attribute(
            get:fn() => $this->firstname . ' ' . $this->lastname,
        );
    }

    // SCOPES
    public function scopeActive() {
        return $this->where('status', Status::USER_ACTIVE);
    }

    public function scopeBanned() {
        return $this->where('status', Status::USER_BAN);
    }

    public function scopeEmailUnverified() {
        return $this->where('ev', Status::NO);
    }

    public function scopeMobileUnverified() {
        return $this->where('sv', Status::NO);
    }

    public function scopeKycUnverified() {
        return $this->where('kv', Status::KYC_UNVERIFIED);
    }

    public function scopeKycPending() {
        return $this->where('kv', Status::KYC_PENDING);
    }

    public function scopeEmailVerified() {
        return $this->where('ev', Status::VERIFIED);
    }

    public function scopeMobileVerified() {
        return $this->where('sv', Status::VERIFIED);
    }

    public function scopeWithBalance() {
        return $this->where('balance', '>', 0);
    }

}
