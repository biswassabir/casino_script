<?php

namespace App\Traits;

use App\Constants\Status;
use Illuminate\Database\Eloquent\Casts\Attribute;

trait GlobalStatus {

    public static function changeStatus($id, $column = 'Status') {
        $modelName = get_class();
        $query = $modelName::findOrFail($id);
        if ($query->status == Status::ENABLE) {
            $query->status = Status::DISABLE;
        } else {
            $query->status = Status::ENABLE;
        }
        $message = $column . ' changed successfully';

        $query->save();
        $notify[] = ['success', $message];
        return back()->withNotify($notify);
    }

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
            $html = '<span><span class="badge badge--warning">' . trans('Disabled') . '</span></span>';
        }
        return $html;
    }

    public function scopeActive($query) {
        return $query->where('status', Status::ENABLE);
    }

    public function scopeInactive($query) {
        return $query->where('status', Status::DISABLE);
    }
}
