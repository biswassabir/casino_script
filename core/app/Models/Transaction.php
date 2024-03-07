<?php

namespace App\Models;

use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model {

    use Searchable;

    protected $guarded = [];
    public function user() {
        return $this->belongsTo(User::class);
    }

}
