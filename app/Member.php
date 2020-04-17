<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    protected $guarded = [];

    public function club()
    {
        return $this->belongsTo('App\Club');
    }
}
