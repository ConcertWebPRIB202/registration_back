<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class User_account extends Model
{
    protected $table='user_account';
    public $timestamps = false;
    protected $fillable=[
        'login',
        'password',
        'email',
    ];
}