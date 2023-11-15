<?php
namespace App\Http\Controllers\Registration;
use App\Http\Controllers\Registration\RegistrationController;
use Illuminate\Support\Facades\Route;


Route::post('/user', [RegistrationController::class,'create']);
Route::get('/token', function () {
    return csrf_token(); 
});
Route::get('/spath', function () {
    return storage_path('app');
});