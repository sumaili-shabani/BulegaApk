<?php

namespace App\Http\Controllers\Connexion;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Traits\GlobalMethod;

use Auth;
use DB;
use Hash;

class ConnexionController extends Controller
{
    //
    use GlobalMethod;

    function checkLogin(Request $request)
    {
        $user_data = array(
             'email'    => $request->email,
             'password' => $request->password,
             'active'   => 1
        );

         return Auth::attempt($user_data) ?
         response()->json(['wrong' =>false])
         :
         response()->json(['wrong' =>true]);
             
    }

    function createCount(Request $request)
    {
        $testCount = $this->showCountTableWhere("users", "email", $request->email);
        if ($testCount <= 0) {
            // code...
            $data = DB::insert('insert into users (name, email,password,remember_token,id_role,sexe,avatar, telephone, adresse, idTer,idChef,idGroup) values (:name, :email,:password,:remember_token,:id_role,:sexe,:avatar,:telephone,:adresse, :idTer,:idChef,:idGroup)', [
                ':name'             =>  $request->name, 
                ':email'            =>  $request->email,
                ':telephone'        =>  $request->telephone,
                ':adresse'          =>  $request->adresse,
                ':password'         =>  Hash::make($request->password),
                ':remember_token'   =>  Hash::make(rand(0,10)),
                ':id_role'          =>  2,
                ':sexe'             =>  $request->sexe,
                ':idTer'            =>  $request->idTer,
                ':idChef'           =>  $request->idChef,
                ':idGroup'          =>  $request->idGroup,
                ':avatar'           =>  "avatar.png"
            ]);

            return response()->json([
                'data'      =>  "Création compte avec succès! Prère d'attendre la validation de l'administrateur de compte pour acceder dans votre panel",
                'success'   =>  $data
            ]);
        }
        else{

            return response()->json([
                'data'      =>  "Cette adresse mail existe déjà!",
                'success'   =>  false,
            ]);
        }
        
             
    }


    function logout()
    {
         Auth::logout();
         return redirect('/login_lega');
    }
}
