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
             'telephone'    => $request->telephone,
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

    function createCount2(Request $request)
    {
        $pwd = Hash::make($request->password);
        $testCount = $this->showCountTableWhere("users", "email", $request->email);
        $testCount2 = $this->showCountTableWhere("users", "telephone", $request->telephone);
        if ($testCount2 <= 0) {
            // code...
            if ($testCount <= 0) {
            // code...
                $data = DB::insert('insert into users (name, email,password,remember_token,id_role,sexe,avatar, telephone, adresse, idTer,idChef,idGroup, 

                    fonction,etatcivil,nbrEnfant,nomPere,nomMere,Pays,Province,ville,
                    commune,quartier,avenue,etude,faculte,domaine,activite,entreprise) 

                    values (:name, :email,:password,:remember_token,:id_role,:sexe,:avatar,:telephone,:adresse, :idTer,:idChef,:idGroup,

                    :fonction,:etatcivil,:nbrEnfant,:nomPere,:nomMere,:Pays,:Province,:ville,
                    :commune,:quartier,:avenue,:etude,:faculte,:domaine,:activite,:entreprise

                    )', [
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
                    ':avatar'           =>  "avatar.png",

                    // autres
                    'fonction'          =>  $request->fonction,    
                    'etatcivil'         =>  $request->etatcivil,   
                    'nbrEnfant'         =>  $request->nbrEnfant,   
                    'nomPere'           =>  $request->nomPere, 
                    'nomMere'           =>  $request->nomMere, 
                    'Pays'              =>  $request->Pays,    
                    'Province'          =>  $request->Province,    
                    'ville'             =>  $request->ville,   
                    'commune'           =>  $request->idGroup, 
                    'quartier'          =>  $request->quartier,    
                    'avenue'            =>  $request->avenue,  
                    'etude'             =>  $request->etude,   
                    'faculte'           =>  $request->faculte, 
                    'domaine'           =>  $request->domaine, 
                    'activite'          =>  $request->activite,    
                    'entreprise'        =>  $request->entreprise




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
        } else {
            // code...
            return response()->json([
                'data'      =>  "Ce numéro de téléphone existe déjà!",
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
