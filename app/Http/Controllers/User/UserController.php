<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\{User};

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Carbon\Carbon;

use Illuminate\Support\Facades\Mail;
use App\Mail\ContactMail;


use App\Traits\GlobalMethod;
use DB;
use URL;
use Auth;

use SimpleSoftwareIO\QrCode\Facades\QrCode;

class UserController extends Controller
{
    //
    use GlobalMethod;

    public function index(Request $request)
    {
        //
       
        $data = DB::table('users')
        ->join('roles','users.id_role','=','roles.id')
        ->join('territoires','territoires.id','=','users.idTer')
        ->join('chefferis','chefferis.id','=','users.idChef')
        ->join('groupements','groupements.id','=','users.idGroup')
        ->select('users.id as user_id','users.avatar','users.name','users.email','users.id_role','roles.nom as role_name','users.sexe','users.telephone','users.adresse','users.active',

            'users.idTer','users.idChef', 'users.idGroup',

            //identification
            "territoires.nomTerritoire", "chefferis.nomTer", "groupements.nomGroup", 

            //fiche suite 
            'users.fonction',    
            'users.etatcivil',   
            'users.nbrEnfant',   
            'users.nomPere', 
            'users.nomMere', 
            'users.Pays',    
            'users.Province',    
            'users.ville',   
            'users.commune', 
            'users.quartier',    
            'users.avenue',  
            'users.etude',   
            'users.faculte', 
            'users.domaine', 
            'users.activite',    
            'users.entreprise',

             


        );
        

        if (!is_null($request->get('query'))) {
            # code...
            $query = $this->Gquery($request);

            $data->where('users.name', 'like', '%'.$query.'%')
            ->orWhere('users.email', 'like', '%'.$query.'%')
            ->orderBy("users.id", "asc");

            return $this->apiData($data->paginate(4));
           

        }
        $data->orderBy("users.id", "desc");
        return $this->apiData($data->paginate(4));
       
        
    }

    public function AllUserfetch(Request $request)
    {
        //
       
        $data = DB::table('users')
        ->join('roles','users.id_role','=','roles.id')
        ->select('users.id as user_id','users.avatar','users.name','users.email','users.id_role','roles.nom as role_name','users.sexe','users.telephone','users.adresse','users.active',

            'users.territoire','users.chefferie', 'users.groupement',
        );
        

        if (!is_null($request->get('query'))) {
            # code...
            $query = $this->Gquery($request);

            $data->where('users.name', 'like', '%'.$query.'%')
            ->orWhere('users.email', 'like', '%'.$query.'%')
            ->orderBy("users.id", "asc");

            return $this->apiData($data->paginate(6));
           

        }
        $data->orderBy("users.id", "desc");
        return $this->apiData($data->paginate(6));
       
        
    }

    

    function fetch_user_ceo()
    {
        $data = DB::table('users')
        ->join('roles','users.id_role','=','roles.id')
        ->select('users.id as user_id','users.id as id','users.avatar','users.name','users.email','users.id_role','roles.nom as role_name','users.sexe','users.telephone','users.adresse','users.territoire','users.chefferie', 'users.groupement')
        ->where('id_role', 2)
        ->get();
        return response()->json([
            'data'  =>  $data
        ]);
        

        
    }

    function fetch_user_all()
    {
        $data = DB::table('users')
        ->join('roles','users.id_role','=','roles.id')
        ->select('users.id as user_id','users.id as id','users.avatar','users.name','users.email','users.id_role','roles.nom as role_name','users.sexe','users.telephone','users.adresse')
        // ->whereNotNull("users.telephone")
        ->get();
        return response()->json([
            'data'  =>  $data
        ]);
        

        
    }


    function checkEtat_Compte($id, $etat)
    {
        if ($id !='' && $etat !='') {
            // code...
            if ($etat == 1) {
                // desactivation
                User::where('id',$id)->update([
                    'active'         =>  0
                ]);
                return $this->msgJson('Le compte utilisateur a été desactivée avec succès!');

            } else {
                // activation
                User::where('id',$id)->update([
                    'active'         =>  1
                ]);
                return $this->msgJson('Le compte utilisateur a été activée avec succès!');
            }
            
        }
    }

    



   
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        if ($request->id !='') 
        {
            # code...
            // update 
            $data = User::where("id", $request->id)->update([
                'name'              =>  $request->name, 
                'email'             =>  $request->email,
                'telephone'         =>  $request->telephone,
                'adresse'           =>  $request->adresse,
                'sexe'              =>  $request->sexe,

                'idTer'             =>  $request->idTer,
                'idChef'            =>  $request->idChef,
                'idGroup'           =>  $request->idGroup,


                
            ]);

            return response()->json([
                'data'  =>  "Modification information avec succès!!!"
            ]);

            // $this->msgJson("Modification information avec succès!!!");

        }
        else
        {
            // insertion 
            $data = User::create([
                'name'              =>  $request->name, 
                'email'             =>  $request->email,
                'sexe'              =>  $request->sexe,
                'telephone'         =>  $request->telephone,
                'adresse'           =>  $request->adresse,
                'password'          =>  Hash::make(123456),
                'remember_token'    =>  Hash::make(rand(0,10)),
                'id_role'           =>  2,

                'idTer'             =>  $request->idTer,
                'idChef'            =>  $request->idChef,
                'idGroup'           =>  $request->idGroup,
            ]);

            

            // return response()->json([
            //     'data'  =>  $data
            // ]);

            return $this->msgJson("Insertion avec succès!!!");
           
           

        }
    }


    public function AutreInfoUpdated(Request $request)
    {
        //
        if ($request->id !='') 
        {
            # code...
            // update 
            $data = User::where("id", $request->id)->update([
                'fonction'       =>  $request->fonction,    
                'etatcivil'      =>  $request->etatcivil,   
                'nbrEnfant'      =>  $request->nbrEnfant,   
                'nomPere'        =>  $request->nomPere, 
                'nomMere'        =>  $request->nomMere, 
                'Pays'           =>  $request->Pays,    
                'Province'       =>  $request->Province,    
                'ville'          =>  $request->ville,   
                'commune'        =>  $request->idGroup, 
                'quartier'       =>  $request->quartier,    
                'avenue'         =>  $request->avenue,  
                'etude'          =>  $request->etude,   
                'faculte'        =>  $request->faculte, 
                'domaine'        =>  $request->domaine, 
                'activite'       =>  $request->activite,    
                'entreprise'     =>  $request->entreprise,
                
            ]);

            return response()->json([
                'data'  =>  "Modification information avec succès!!!"
            ]);

          
        }
        
       
    }



    function insert_user(Request $request)
    {
        try{

            $data =  DB::table('users')->insert(
            [
                    'name'              => 'John',
                    'email'             => 'john@example.com', 
                    'sexe'              => 'M',
                    'password'          => "123456",
                    'remember_token'    => "123456",
                    'id_role'           =>  2

                ]
            );

            return $this->msgJson("Insertion avec succès!!!");

        }
        catch(PDOException $e)
        {
            return $this->msgJson($e->getMessage());
        }


    }



    function ChangePassword(Request $request)
    {

        $data = User::where('id', $request->id)->update([
            'password'          =>  Hash::make($request->password),
            'remember_token'    =>  Hash::make(rand(0,10)),
            'id_role'           =>  $request->id_role
        ]);

        return $this->msgJson("Modification réussue avec succès!!!");

    }


    function ChangeMyPasswordSecure(Request $request)
    {
       
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password]))
        {
           // return $this->msgJson("Success!!!");
            $data_updated = User::where('id', $request->id)->update([
                'password'          =>  Hash::make($request->password_nouveau),
                'remember_token'    =>  Hash::make(rand(0,10))
            ]);

            return $this->msgJson("Mot de passse changer  avec succès!!!");
        }
        else{
            return $this->msgJson("Informations incorectes!!!");
        }

       

    }

    function ChangeRole(Request $request)
    {

        $data = User::where('id', $request->id)->update([
           'id_role'           =>  $request->id_role
        ]);
        return $this->msgJson("User updated");

    }





    function convertHtmlTug($id)
    {
        $output = '
        <!doctype html>
        <html lang="en">
          <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

            <title>Hello, world!</title>
          </head>
          <body>
            <h1>Hello, world!</h1>

            
            
          </body>
        </html>
        ';

        return $output;

    }


    function printBill(Request $request)
    {
        if ($request->get('id_user')) 
       {
            $id_user = $request->get('id_user');
            $pdf = \App::make('dompdf.wrapper');
            $pdf->loadHTML($this->convertHtmlTug($id_user));
            return $pdf->stream();
       }
    }

    function editPhoto(Request $request)
    {
      if (!is_null($request->image)) 
      {
        $formData = json_decode($_POST['data']);
         $imageName = time().'.'.$request->image->getClientOriginalExtension();

         // $request->image->move(storage_path('app/public/images/'), $imageName);
          $request->image->move(public_path('/images'), $imageName);

        User::where('id',$formData->agentId)->update(['avatar' => $imageName]);
        return $this->msgJson('Fichier ajouté avec succès');

      }
       
    }



    public function showUser($id)
    {
        //
        $data = DB::table('users')
        ->join('roles','users.id_role','=','roles.id')
        ->join('territoires','territoires.id','=','users.idTer')
        ->join('chefferis','chefferis.id','=','users.idChef')
        ->join('groupements','groupements.id','=','users.idGroup')
        ->select('users.id as user_id','users.avatar','users.name','users.email','users.id_role','roles.nom as role_name','users.sexe','users.telephone','users.adresse','users.active',

            'users.idTer','users.idChef', 'users.idGroup',

            //identification 
            "territoires.nomTerritoire", "chefferis.nomTer", "groupements.nomGroup", 

            //fiche suite 
            'users.fonction',    
            'users.etatcivil',   
            'users.nbrEnfant',   
            'users.nomPere', 
            'users.nomMere', 
            'users.Pays',    
            'users.Province',    
            'users.ville',   
            'users.commune', 
            'users.quartier',    
            'users.avenue',  
            'users.etude',   
            'users.faculte', 
            'users.domaine', 
            'users.activite',    
            'users.entreprise',

             


        )
        ->where("users.id", $id)
        ->get();
        return response()->json(['data'  =>  $data]);
    }

    

    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $data = DB::table('users')
        ->join('roles','users.id_role','=','roles.id')
        ->join('territoires','territoires.id','=','users.idTer')
        ->join('chefferis','chefferis.id','=','users.idChef')
        ->join('groupements','groupements.id','=','users.idGroup')
        ->select('users.id as user_id','users.avatar','users.name','users.email','users.id_role','roles.nom as role_name','users.sexe','users.telephone','users.adresse','users.active',

            'users.idTer','users.idChef', 'users.idGroup',

            //identification
            "territoires.nomTerritoire", "chefferis.nomTer", "groupements.nomGroup", 

            //fiche suite 
             


        )
        ->where("users.id", $id)
        ->get();
        return response()->json(['data'  =>  $data]);
    }

   

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $data = User::where("id", $id)->delete();
        return response()->json(['data'  =>  "Suppression avec succès!!!"]);
    }


    //les autres scripts

    public function validatePasswordRequest(Request $request)
    {
        $user = DB::table('users')->where('email', '=', $request->email)
        ->count();
        //Check if the user exists
        if ($user < 1) {
            // return redirect()->back()->withErrors(['email' => trans('User does not exist')]);
            return response()->json([
                'data'      =>  "User does not exist"
            ]);
        }

        //Create Password Reset Token
        DB::table('password_resets')->insert([
            'email' => $request->email,
            'token' => str_random(60),
            'created_at' => Carbon::now()
        ]);
        //Get the token just created above
        $tokenData = DB::table('password_resets')
            ->where('email', $request->email)->first();

        if ($this->sendResetEmail($request->email, $tokenData->token)) {
            // return redirect()->back()->with('status', trans('A reset link has been sent to your email address.'));

            //Generate, the password reset link. The token generated is embedded in the link
            // $link = config('base_url') . 'password/reset/' . $tokenData->token . '?email=' . urlencode($request->email);

            $link = 'reset/' . $tokenData->token . '/' . urlencode($request->email);
            $my_link = url($link);

            $user = DB::table('users')->where('email', $request->email)->select('name', 'email')->get();
            foreach ($user as $row) {
                // code...
                $name = $row->name;
                $email = $row->email;
                $lien = $my_link;
                $message = "Votre lien de réunitialisation de votre mot de passe. prière de cliquer sur le lien";

                $this->send_mail($name,$email,$message, $lien);
            }
            

            return $this->msgJson("Un lien de réinitialisation a été envoyé à votre adresse e-mail.");
        } else {
            // return redirect()->back()->withErrors(['error' => trans("Une erreur réseau s'est produite. Veuillez réessayer.")]);
            return $this->msgJson("Une erreur réseau s'est produite. Veuillez réessayer.");
        }
    }


    private function sendResetEmail($email, $token)
    {
        //Retrieve the user from the database
        $user = DB::table('users')->where('email', $email)->select('name', 'email')->first();
        //Generate, the password reset link. The token generated is embedded in the link
        $link = URL::to("/password/reset/" . $token . "?email=" . urlencode($user->email)."");

        try {
            //Here send the link with CURL with an external email API 
            return true;

        } catch (\Exception $e) {
            return false;
        }

    }

    function send_mail($name,$email,$message, $lien)
    {

        $data = array(
            'name'      =>  $name,
            'email'     =>  $email,
            'message'   =>  $message,
            'lien'      =>  $lien
        );

        //here we send mail to web-tutorial@programmer.net
        Mail::to('application@code.info')->send(new ContactMail($data));

        // return json_encode(["data" => "Merci de nous avoir contacté !"]);
        
    }

    public function reset_password($token, $email)
    {
        $data = array(
            'token'     =>  $token,
            'email'     =>  $email,

        );
         return view('frontend.reset', $data);
    }



   

    
    public function resetPassword(Request $request)
    {
        

        $password = $request->password;
        // Validate the token
        $tokenData = DB::table('password_resets')
        ->where('token', $request->token)->first();
        // Redirect the user back to the password reset request form if the token is invalid
        if (!$tokenData) return $this->msgJson("Impossible de faire l'opération!!!.");

        $user = User::where('email', $tokenData->email)->first();
        // Redirect the user back if the email is invalid
        if (!$user) return $this->msgJson("Adresse email non trouvé!!!.");
        //Hash and update the new password
        $user->password = \Hash::make($password);
        $user->update(); //or $user->save();

        if ($user) {
            # code...
            return response()->json([
                'data'      => "votre compte a été Reinitialisé avec succès!!!",
                'success'   =>  true
            ]);
            //login the user immediately they change password successfully
            Auth::login($user);

            //Delete the token
            DB::table('password_resets')->where('email', $user->email)
            ->delete();
        }
        else{

            return response()->json([
                'data'      => "Impossible de faire l'opération!!!",
                'success'   =>  true
            ]);
        }

    }

    /*
    *cartes
    *=============
    *fin
    */

    function getRequeteToPrint($id)
    {
        $data = DB::table('users')
        ->join('roles','users.id_role','=','roles.id')
        ->join('territoires','territoires.id','=','users.idTer')
        ->join('chefferis','chefferis.id','=','users.idChef')
        ->join('groupements','groupements.id','=','users.idGroup')
        ->select('users.id as user_id','users.avatar','users.name','users.email','users.id_role','roles.nom as role_name','users.sexe','users.telephone','users.adresse','users.active',

            'users.idTer','users.idChef', 'users.idGroup',

            //identification 
            "territoires.nomTerritoire", "chefferis.nomTer", "groupements.nomGroup", 

            //fiche suite 
            'users.fonction',    
            'users.etatcivil',   
            'users.nbrEnfant',   
            'users.nomPere', 
            'users.nomMere', 
            'users.Pays',    
            'users.Province',    
            'users.ville',   
            'users.commune', 
            'users.quartier',    
            'users.avenue',  
            'users.etude',   
            'users.faculte', 
            'users.domaine', 
            'users.activite',    
            'users.entreprise',

             


        )
        ->where("users.id", $id)
        ->get();

        return $data;
    }

    function pdf_fiche_identification(Request $request)
    {

        if ($request->get('id')) 
        {
            $id = $request->get('id');
            $html = $this->getInfoAgentTug($id);
            $pdf = \App::make('dompdf.wrapper');

            // echo($html);


            $pdf->loadHTML($html);
            $pdf->loadHTML($html)->setPaper('a4', 'landscape');
            return $pdf->stream();
            
        }
        else{

        }
        
        
    }

    function pdf_card_identification(Request $request)
    {

        if ($request->get('id')) 
        {
            $id = $request->get('id');
            $html = $this->getPDFCardAgentTug($id);
            $pdf = \App::make('dompdf.wrapper');

            // echo($html);


            $pdf->loadHTML($html);
            $pdf->loadHTML($html)->setPaper('a6', 'landscape');
            return $pdf->stream();
            
        }
        else{

        }
        
        
    }

    function getInfoAgentTug($id)
    {
        $nomUser = $this->getNomAgent($id);

        $data = $this->getRequeteToPrint($id);

        $output = '';

        $text1 = "REPUBLIQUE DEMOCRATIQUE DU CONGO
                    FICHE D'IDENTITE DE MEMBRE
                    COMMUNAUTE LEGA";
        $text2 = "DETAIL DE LA FICHE DE ".strtoupper($nomUser);

        $entete =$this->entetePrintPDF($text1, $text2);

        $output.='
        <div style="border:1px solid black;padding:0px;">
            '.$entete.'
           <br/><br/>
            <table align="center" cellpadding="7" cellspacing="0" border="1" width="98%">
              <tr style="font-weight:bold; background:#ccc;" >
                <td colspan="1">Identité complète</td>
                <td colspan="1">Les cordonnées</td>
                <td colspan="1">Territoire</td>
                <td colspan="1">Chefferie</td>
                <td>Groupement </td>
                <td>Sexe</td>
               
               
              </tr>';

                $count=1;

                foreach ($data as $row) {
                    // code...

                    $output .='
                        <tr>
                            <td colspan="1">
                            '.strtoupper($row->name).'
                            </td>
                            <td colspan="1">
                                <ul>
                                    <li>N° de Téléphone: '.$row->telephone.'</li>
                                    <li>Email: '.$row->email.'</li>
                                    <li>Adresse domicile actuelle: '.$row->adresse.'</li>
                                </ul>
                            </td>
                            <td colspan="1">'.$row->nomTerritoire.'</td>
                            <td colspan="1">'.$row->nomTer.'</td>
                            <td>'.$row->nomGroup.' </td>
                            <td>'.$row->sexe.'</td>
                        </tr> 
                    ';

                    $output .='
                        <tr>
                            <td colspan="4" style="font-weight:bold;">Etat civil </td>
                            <td colspan="2">'.$row->etatcivil.'</td>
                        </tr> 

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Si vous êtes  marié, divorcé ou veuf(Ve) combien d’enfants avez-vous ?</td>
                            <td colspan="2">'.$row->nbrEnfant.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Nom du père </td>
                            <td colspan="2">'.$row->nomPere.'</td>
                        </tr>

                         <tr>
                            <td colspan="4" style="font-weight:bold;">Nom de la mère</td>
                            <td colspan="2">'.$row->nomMere.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Pays </td>
                            <td colspan="2">'.$row->Pays.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Province</td>
                            <td colspan="2">'.$row->Province.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Ville ou village</td>
                            <td colspan="2">'.$row->ville.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Commune</td>
                            <td colspan="2">'.$row->commune.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Quartier</td>
                            <td colspan="2">'.$row->quartier.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Avenue</td>
                            <td colspan="2">'.$row->avenue.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Niveau d’Etudes </td>
                            <td colspan="2">'.$row->etude.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Si vous avez fait les  études   secondaires ou universitaires,  dans quelle section ou faculté les avez-vous  réalisés ?</td>
                            <td colspan="2">'.$row->faculte.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Si vous avez fait les  études  de master ou de doctorant,  dans quelle domaine de recherche vous étiez vous spécialiser ?</td>
                            <td colspan="2">'.$row->domaine.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Activité exercée</td>
                            <td colspan="2">'.$row->activite.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Dans quelle entreprise exercez-vous actuellement ? </td>
                            <td colspan="2">'.$row->entreprise.'</td>
                        </tr>

                        <tr>
                            <td colspan="4" style="font-weight:bold;">Quelle fonction assurez-vous au sein de votre entreprise </td>
                            <td colspan="2">'.$row->fonction.'</td>
                        </tr>

                       

                    ';
                }


       

        

        $output.='</table>';

        $output .='
        <p>
        <br />
        </p>
            <p style="position:relative;left:500px;">

              Fait à Goma le '.date('Y-m-d').'
            </p>
        <br /><br /></div>
        ';
       
        return $output; 

    }




    function getPDFCardAgentTug($id)
    {
        $nomUser = $this->getNomAgent($id);

        $data = $this->getRequeteToPrint($id);

        $output = '';

        $text1 = "CARTE D'IDENTIFICATION DE MEMBRE";
        $text2 = "DETAIL DE LA FICHE DE ".strtoupper($nomUser);

        $entete =$this->entetePrintPDF($text1, $text2);

        $qrcode = $this->generateQrcode($id);

        
        if ($data->Count() > 0) {
            // code...

            $logordc = $this->displayImg('images', 'rdc.png');
            $logoSite =$this->displayImg('images', $this->getLogoSite());

            foreach ($data as $row) {
                // code...
                $avatar = $this->displayImg('images', $row->avatar);
                $output .=' 

                <html>
                    <head>
                        <title>rpt_Carte</title>
                        <meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8"/>
                        <style type="text/css">
                            .csE75D3AE5 {color:#000000;background-color:transparent;border-left:#000000 1px solid;border-top:#000000 1px solid;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .csC3BBD80E {color:#000000;background-color:transparent;border-left:#000000 1px solid;border-top-style: none;border-right-style: none;border-bottom:#000000 1px solid;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .csD2198692 {color:#000000;background-color:transparent;border-left:#000000 1px solid;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .csE33A3B23 {color:#000000;background-color:transparent;border-left-style: none;border-top:#000000 1px solid;border-right:#000000 1px solid;border-bottom-style: none;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .cs140EE778 {color:#000000;background-color:transparent;border-left-style: none;border-top:#000000 1px solid;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .csA4A4F90C {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right:#000000 1px solid;border-bottom:#000000 1px solid;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .cs914D1A68 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right:#000000 1px solid;border-bottom-style: none;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .cs7384E3C7 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom:#000000 1px solid;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .cs40F84085 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Microsoft Sans Serif; font-size:11px; font-weight:normal; font-style:normal; padding-left:2px;}
                            .csB505BBB {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Microsoft Sans Serif; font-size:9px; font-weight:bold; font-style:normal; padding-left:2px;}
                            .cs5B076041 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Microsoft Sans Serif; font-size:9px; font-weight:normal; font-style:normal; padding-left:2px;}
                            .cs70CD0380 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:11px; font-weight:normal; font-style:normal; padding-left:2px;}
                            .cs612ED82F {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:12px; font-weight:bold; font-style:normal; padding-left:2px;}
                            .cs101A94F7 {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:13px; font-weight:normal; font-style:normal; }
                            .cs51F75ECA {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:19px; font-weight:bold; font-style:normal; padding-left:2px;}
                            .cs9E353F1A {color:#000000;background-color:transparent;border-left-style: none;border-top-style: none;border-right-style: none;border-bottom-style: none;font-family:Times New Roman; font-size:21px; font-weight:bold; font-style:normal; text-decoration: underline;padding-left:2px;}
                            .csF7D3565D {height:0px;width:0px;overflow:hidden;font-size:0px;line-height:0px;}
                        </style>
                    </head>
                    <body leftMargin=10 topMargin=10 rightMargin=10 bottomMargin=10 style="background-color:#FFFFFF; width:100%;">
                    <table cellpadding="0" cellspacing="0" border="0" style="border-width:0px;empty-cells:show;width:450px;height:425px;position:relative;">
                        <tr style="vertical-align:top;">
                            <td style="width:10px;height:12px;"></td>
                            <td style="width:7px;"></td>
                            <td style="width:2px;"></td>
                            <td style="width:11px;"></td>
                            <td style="width:27px;"></td>
                            <td style="width:14px;"></td>
                            <td style="width:11px;"></td>
                            <td style="width:48px;"></td>
                            <td style="width:96px;"></td>
                            <td style="width:2px;"></td>
                            <td style="width:60px;"></td>
                            <td style="width:40px;"></td>
                            <td style="width:3px;"></td>
                            <td style="width:4px;"></td>
                            <td style="width:3px;"></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:10px;"></td>
                            <td class="csE75D3AE5" colspan="2" style="width:8px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:11px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:27px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" colspan="3" style="width:73px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" colspan="2" style="width:98px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:60px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:40px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:3px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csE33A3B23" colspan="2" style="width:6px;height:9px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:54px;"></td>
                            <td class="csD2198692" colspan="2" style="width:8px;height:54px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:11px;height:54px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="4" style="width:100px;height:54px;text-align:left;vertical-align:top;"><div style="overflow:hidden;width:100px;height:54px;">
                               <img alt="" src="'.$logoSite.'" style="width:100px;height:54px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="rpt_Carte_files/3730683715.png",sizingMethod="scale");" /><div style="display:none"><![endif]--></div>
                            </td>

                            <td class="cs101A94F7" colspan="2" style="width:98px;height:54px;text-align:center;"><div class="csF7D3565D"></div><![endif]-->
                               '.$qrcode.'
                            </td>
                            <td class="cs101A94F7" colspan="2" style="width:100px;height:54px;text-align:left;vertical-align:top;"><div style="overflow:hidden;width:100px;height:54px;">
                               <img alt="" src="'.$logordc.'" style="width:100px;height:54px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="rpt_Carte_files/3730683715.png",sizingMethod="scale");" /><div style="display:none"><![endif]--></div>
                            </td>
                            <td class="cs101A94F7" style="width:3px;height:54px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" colspan="2" style="width:6px;height:54px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:24px;"></td>
                            <td class="csD2198692" colspan="2" style="width:8px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:11px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs51F75ECA" colspan="8" style="width:296px;height:24px;line-height:22px;text-align:center;vertical-align:top;"><nobr>'.$text1.'</nobr></td>
                            <td class="cs101A94F7" style="width:3px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" colspan="2" style="width:6px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top; text-align:center"">
                            <td style="height:24px;"></td>
                            <td class="csD2198692" colspan="2" style="width:8px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:11px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:27px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs612ED82F" colspan="6" style="width:229px;height:24px;line-height:13px;text-align:center;vertical-align:top;"><nobr>RDC&nbsp;(R&#233;public&nbsp;d&#233;mocratique&nbsp;du&nbsp;Congo)</nobr></td>
                            <td class="cs101A94F7" style="width:40px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:3px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" colspan="2" style="width:6px;height:24px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:19px;"></td>
                            <td class="csD2198692" colspan="2" style="width:8px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:11px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:27px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:73px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="2" style="width:98px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:60px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:40px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:3px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" colspan="2" style="width:6px;height:19px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>

                        <tr style="vertical-align:top; text-align:center"">
                            <td style="height:62px;"></td>
                            <td class="csD2198692" colspan="2" style="width:8px;height:62px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs70CD0380" colspan="10" style="width:310px;height:62px;line-height:12px;text-align:center;vertical-align:top;"><nobr>La&nbsp;pr&#233;sente&nbsp;carte&nbsp;permet&nbsp;de&nbsp;la&nbsp;validation&nbsp;de&nbsp;l\'identification&nbsp;du(de&nbsp;la)</nobr><br/><nobr>detenant(e)</nobr>
                                
                                <div style="text-align:center">
                                    <p style="text-align:center;font-weight:bold;">Laissez passer</p>
                                    <p style="color:red; text-align:center">

                                        Les autorités tant civiles que militaires et celles de la police 
                                        nationale sont priées d\'aporter leur secours au porteur de la présente en 
                                        cas de nécessité.
                                    </p>
                                     <br><br><br>
                                </div>
                               
                            </td>
                            <td class="cs914D1A68" colspan="2" style="width:6px;height:62px;"><div class="csF7D3565D"></div><![endif]--></td>

                        </tr>


                        <tr style="vertical-align:top;">
                            <td style="height:1px;"></td>
                            <td class="csC3BBD80E" colspan="2" style="width:8px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:11px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:27px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" colspan="3" style="width:73px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" colspan="2" style="width:98px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:60px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:40px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:3px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csA4A4F90C" colspan="2" style="width:6px;height:0px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:21px;"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:9px;"></td>
                            <td class="csE75D3AE5" style="width:6px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" colspan="3" style="width:40px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:14px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:11px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:48px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" style="width:96px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs140EE778" colspan="5" style="width:109px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csE33A3B23" style="width:2px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:26px;"></td>
                            <td class="csD2198692" style="width:6px;height:26px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs9E353F1A" colspan="6" style="width:111px;height:26px;line-height:24px;text-align:left;vertical-align:top;"><nobr>Identit&#233;</nobr></td>
                            <td class="cs101A94F7" style="width:96px;height:26px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="5" style="width:109px;height:26px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:26px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:1px;"></td>
                            <td class="csD2198692" style="width:6px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:14px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:11px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:48px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:96px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="5" style="width:109px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:12px;"></td>
                            <td class="csD2198692" style="width:6px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="3" style="width:38px;height:12px;line-height:10px;text-align:left;vertical-align:top;"><nobr>Nom complet&nbsp;:</nobr></td>
                            <td class="cs40F84085" colspan="4" rowspan="2" style="width:167px;height:15px;line-height:12px;text-align:left;vertical-align:top;"><nobr>'.$row->name.'</nobr></td>

                            

                            <td class="cs101A94F7" colspan="5" rowspan="11" style="width:109px;height:88px;text-align:left;vertical-align:top;"><div style="overflow:hidden;width:109px;height:88px;">

                               <img alt="" src="'.$avatar.'" style="width:109px;height:88px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="rpt_Carte_files/2618451608.png",sizingMethod="scale");" /><div style="display:none"><![endif]--><img alt="" src="rpt_Carte_files/2618451608.png" style="width:109px;height:88px;" /><!--[if lt IE 7]></div><![endif]--></div>
                            </td>
                            <td class="cs914D1A68" style="width:2px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:3px;"></td>
                            <td class="csD2198692" style="width:6px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:13px;"></td>
                            <td class="csD2198692" style="width:6px;height:13px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="4" style="width:52px;height:13px;line-height:10px;text-align:left;vertical-align:top;"><nobr>Contacts&nbsp;:</nobr></td>
                            <td class="cs40F84085" colspan="3" rowspan="2" style="width:153px;height:16px;line-height:12px;text-align:left;vertical-align:top;"><nobr>'.$row->telephone.'&nbsp;-&nbsp;'.$row->email.'</nobr></td>
                            <td class="cs914D1A68" style="width:2px;height:13px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:3px;"></td>
                            <td class="csD2198692" style="width:6px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:14px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:12px;"></td>
                            <td class="csD2198692" style="width:6px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="4" style="width:52px;height:12px;line-height:10px;text-align:left;vertical-align:top;"><nobr>Etat&nbsp;Civil&nbsp;:</nobr></td>
                            <td class="cs40F84085" colspan="3" rowspan="2" style="width:153px;height:15px;line-height:12px;text-align:left;vertical-align:top;"><nobr>'.$row->etatcivil.';</nobr></td>
                            <td class="cs914D1A68" style="width:2px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:3px;"></td>
                            <td class="csD2198692" style="width:6px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:14px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:12px;"></td>
                            <td class="csD2198692" style="width:6px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="5" style="width:63px;height:12px;line-height:10px;text-align:left;vertical-align:top;"><nobr>Profession&nbsp;:</nobr></td>
                            <td class="cs40F84085" colspan="2" rowspan="2" style="width:142px;height:15px;line-height:12px;text-align:left;vertical-align:top;"><nobr>'.$row->activite.'</nobr></td>
                            <td class="cs914D1A68" style="width:2px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:3px;"></td>
                            <td class="csD2198692" style="width:6px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:14px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:11px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:13px;"></td>
                            <td class="csD2198692" style="width:6px;height:13px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="5" style="width:63px;height:13px;line-height:10px;text-align:left;vertical-align:top;"><nobr>N&#176;&nbsp;Matricule&nbsp;:</nobr></td>
                            <td class="cs40F84085" colspan="2" rowspan="2" style="width:142px;height:16px;line-height:12px;text-align:left;vertical-align:top;"><nobr>'.$id.'-'.rand().'</nobr></td>
                            <td class="cs914D1A68" style="width:2px;height:13px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:3px;"></td>
                            <td class="csD2198692" style="width:6px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:14px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:11px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:3px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:11px;"></td>
                            <td class="csD2198692" style="width:6px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="4" rowspan="2" style="width:52px;height:12px;line-height:10px;text-align:left;vertical-align:top;"><nobr>Adresse&nbsp;:</nobr></td>
                            <td class="cs5B076041" colspan="3" rowspan="3" style="width:153px;height:23px;line-height:10px;text-align:left;vertical-align:top;"><nobr> 
                            '.$row->Province.'&nbsp;-&nbsp;
                            '.$row->ville.'&nbsp;-&nbsp;
                            '.$row->commune.'
                            &nbsp;-</nobr><br/><nobr>
                            '.$row->quartier.'
                            &nbsp;-&nbsp;Lusaka</nobr></td>
                            <td class="cs914D1A68" style="width:2px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:1px;"></td>
                            <td class="csD2198692" style="width:6px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="5" style="width:109px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:1px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:11px;"></td>
                            <td class="csD2198692" style="width:6px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" style="width:14px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="5" style="width:109px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:12px;"></td>
                            <td class="csD2198692" style="width:6px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="3" style="width:38px;height:12px;line-height:10px;text-align:left;vertical-align:top;"><nobr> Parents&nbsp;:</nobr></td>
                            <td class="cs5B076041" colspan="4" rowspan="2" style="width:167px;height:23px;line-height:10px;text-align:left;vertical-align:top;">
                            <nobr> 
                                '.$row->nomPere.'&nbsp;
                                et &nbsp;
                                '.$row->nomMere.' </nobr><br/>
                            </td>
                            <td class="cs101A94F7" colspan="5" style="width:109px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:11px;"></td>
                            <td class="csD2198692" style="width:6px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="3" style="width:40px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs101A94F7" colspan="5" style="width:109px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs914D1A68" style="width:2px;height:11px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:12px;"></td>
                            <td class="csD2198692" style="width:6px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csB505BBB" colspan="12" style="width:316px;height:12px;line-height:10px;text-align:left;vertical-align:top;"><nobr>Origine&nbsp;:&nbsp;Chefferie&nbsp;ou&nbsp;Secteur&nbsp;ou&nbsp;Commune/&nbsp;Territoire&nbsp;ou&nbsp;Ville/Province</nobr></td>
                            <td class="cs914D1A68" style="width:2px;height:12px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:18px;"></td>
                            <td class="csD2198692" style="width:6px;height:18px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs40F84085" colspan="12" style="width:316px;height:18px;line-height:12px;text-align:left;vertical-align:top;"><nobr>'.$row->nomTer.'&nbsp;&nbsp;&nbsp;-&nbsp;'.$row->nomGroup.'&nbsp;-&nbsp;'.$row->nomTerritoire.'</nobr></td>
                            <td class="cs914D1A68" style="width:2px;height:18px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="height:9px;"></td>
                            <td class="csC3BBD80E" style="width:6px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" colspan="3" style="width:40px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:14px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:11px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:48px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" style="width:96px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="cs7384E3C7" colspan="5" style="width:109px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                            <td class="csA4A4F90C" style="width:2px;height:8px;"><div class="csF7D3565D"></div><![endif]--></td>
                        </tr>
                    </table>
                    </body>
                    </html>


                ';
            }

        } else {
            // code...
        }
        
        
        
       
        return $output; 

    }


   

     /*
    *cartes
    *=============
    *fin
    */







    





}
