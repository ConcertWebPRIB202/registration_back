<?php
namespace App\Http\Controllers\Registration;
use App\Http\Controllers\Registration\RegistrationController;
use Illuminate\Support\Facades\Route;


Route::get('/user', [RegistrationController::class,'index']);