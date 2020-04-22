<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Club extends Model
{
    protected $guarded = [];

    public function members()
    {
        return $this->hasMany('App\Member');
    }
}
