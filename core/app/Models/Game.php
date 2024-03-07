<?php

namespace App\Models;

use App\Constants\Status;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Game extends Model {
    use HasFactory;

    protected $guarded = ['id'];

    protected $casts = [
        'level'        => 'object',
        'probable_win' => 'object',
    ];

    public function statusBadge(): Attribute {
        return new Attribute(
            get:fn() => $this->badgeData(),
        );
    }

    public function badgeData() {
        $html = '';

        if ($this->status == Status::ENABLE) {
            $html = '<span class="badge badge--success">' . trans('Enabled') . '</span>';
        } else {
            $html = '<span class="badge badge--danger">' . trans('Disabled') . '</span>';
        }

        return $html;
    }

    public function scopeActive() {
        return $this->where('status', Status::ENABLE);
    }

}
