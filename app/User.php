<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','telephone','adresse','sexe','avatar','id_role','active',
        'territoire','chefferie', 'groupement','idTer','idChef', 'idGroup',

        'fonction',    
        'etatcivil',   
        'nbrEnfant',   
        'nomPere', 
        'nomMere', 
        'Pays',    
        'Province',    
        'ville',   
        'commune', 
        'quartier',    
        'avenue',  
        'etude',   
        'faculte', 
        'domaine', 
        'activite',    
        'entreprise',

       
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function messages()
    {
        return $this->hasMany(Message::class);
    }
}
