<?php
namespace App\Http\Controllers\Registration;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\User_account;
use App\Models\Gender_type;
use App\Models\Document_storage;

class RegistrationController extends Controller
{
    public function index(){
        return Gender_type::all();
    }
}