<?php

namespace App\Models\Backend;

use Illuminate\Database\Eloquent\Model;

class Localisation extends Model
{
    //
    protected $fillable = [
        'user_id', 'name','adress', 'city','state', 'hours','latitude', 'longitude'
    ];

    
}
