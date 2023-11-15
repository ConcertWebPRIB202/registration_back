<?php
namespace App\Http\Controllers\Registration;

use App\Http\Controllers\Controller;
use Illuminate\Validation\Rules\Password;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Storage;

use App\Models\User;
use App\Models\User_account;
use App\Models\Document_storage;

class RegistrationController extends Controller
{
    public function create(Request $request)
    {
        
        $user = new User;
        $user_account = new User_account;
        $document = new Document_storage;
        print_r($request->all());
        Storage::disk('user_local')->put($request->photo->hashName(), 'Contents');

        $request->validate([
            'login'=>'unique:user_account,login',
            'password' => [Password::min(8)->mixedCase()->numbers()->uncompromised()],
            'repeat_password' => 'same:password',
            'phone' => 'size:12',
            'email' => ['email','unique:user_account,email'],
            'photo' => ['image']
        ]);


        $user_account->login=$request->input('login');
        $user_account->password=Crypt::encryptString($request->password);
        $user_account->email=$request->email;
        $user_account->save();
        $user_account_by_login=$user_account::where('login',$request->login)->first();

        $local_doc_path=$request->photo->store('','user_local');
        $document->doc_path=$local_doc_path;
        $document->save();
        $document_by_name=$document::where('doc_path', $local_doc_path)->first();

        $user->phone=$request->phone;
        $user->city=$request->city;
        $user->gender_id=$request->gender_id;
        $user->document_id=$document_by_name->id;
        $user->account_id=$user_account_by_login->id;
        $user->save();
    }
}