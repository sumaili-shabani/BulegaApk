<?php

namespace App\Models\Backend;

use Illuminate\Database\Eloquent\Model;

class Reunion extends Model
{
    //
    protected $fillable = [
        'user_id','nom','slug','start_date','end_date','hours',
    ];
}
