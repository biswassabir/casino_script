<?php

namespace App\Models;
use App\Constants\Status;
use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class Deposit extends Model {

    use Searchable;
    protected $casts = [
        'detail' => 'object',
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function gateway() {
        return $this->belongsTo(Gateway::class, 'method_code', 'code');
    }

    public function statusBadge(): Attribute {
        return new Attribute(
            get:fn() => $this->badgeData(),
        );
    }

    public function badgeData() {
        $html = '';

        if ($this->status == Status::PAYMENT_PENDING) {
            $html = '<span class="badge badge--warning">' . trans('Pending') . '</span>';
        } elseif ($this->status == Status::PAYMENT_SUCCESS && $this->method_code >= 1000) {
            $html = '<span><span class="badge badge--success">' . trans('Approved') . '</span><br>' . diffForHumans($this->updated_at) . '</span>';
        } elseif ($this->status == Status::PAYMENT_SUCCESS && $this->method_code < 1000) {
            $html = '<span class="badge badge--success">' . trans('Succeed') . '</span>';
        } elseif ($this->status == Status::PAYMENT_REJECT) {
            $html = '<span><span class="badge badge--danger">' . trans('Rejected') . '</span><br>' . diffForHumans($this->updated_at) . '</span>';
        } else {
            $html = '<span><span class="badge badge--dark">' . trans('Initiated') . '</span></span>';
        }

        return $html;
    }

    // scope
    public function scopeGatewayCurrency() {
        return GatewayCurrency::where('method_code', $this->method_code)->where('currency', $this->method_currency)->first();
    }

    public function scopeBaseCurrency() {
        return @$this->gateway->crypto == Status::ENABLE ? 'USD' : $this->method_currency;
    }

    public function scopePending() {
        return $this->where('method_code', '>=', 1000)->where('status', Status::PAYMENT_PENDING);
    }

    public function scopeRejected() {
        return $this->where('method_code', '>=', 1000)->where('status', Status::PAYMENT_REJECT);
    }

    public function scopeApproved() {
        return $this->where('method_code', '>=', 1000)->where('status', Status::PAYMENT_SUCCESS);
    }

    public function scopeSuccessful() {
        return $this->where('status', Status::PAYMENT_SUCCESS);
    }

    public function scopeInitiated() {
        return $this->where('status', Status::PAYMENT_INITIATE);
    }

}
