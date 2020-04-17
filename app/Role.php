<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $guarded = [];

    public function member()
    {
        return $this->belongsTo('App\Member');
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
