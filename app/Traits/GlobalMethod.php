<?php 
namespace App\Traits;
use App\{User};
use DB;

use SimpleSoftwareIO\QrCode\Facades\QrCode;

trait GlobalMethod{

	//global query
    function Gquery($request)
    {
      return str_replace(" ", "%", $request->get('query'));
      // return $request->get('query');
    }

    function f_date($date)
    {
      $date = new Date($date);
      return substr($date->format('d/m/Y'), 0,10);
    }

    function CreatedAt($date)
    {
       $created_at = nl2br(substr(date(DATE_RFC822, strtotime($date)), 0, 23));
       return $created_at; 
    }

    function apiData($data)
    {
      return response($data, 200);
    }


    function msgJson($message)
    {
        return response()->json(['data' => $message]);
    }

    function msgError($message)
    {
      return response()->json(['error'  => $message]);
    }


    function generateOpt($n)
  	{
  	    $generator="1234567890AZERTYUIOPQSDFGHJKLMWXCVBN";
  	    $result="";
  	    for ($i=0; $i <$n ; $i++)
  	    {
  	      $result.=substr($generator, (rand()%(strlen($generator))),1);
  	    }
  	    return $result;
  	}

    /*
    ========================
    // mes scripts ajouts
    *=======================
    *
    *
    */
    // nombre de notification
    function showCountNotification($column, $value, $table)
    {
        $demandes = DB::table($table)->where([
            [$column, '=', $value],
        ])->get();

        $count = $demandes->count();
        return $count;

    }
    function showCountNotificationWhere($column, $value, $table,$column2, $value2)
    {
        $demandes = DB::table($table)->where([
            [$column, '=', $value],
            [$column2, '=', $value2],
        ])->get();

        $count = $demandes->count();
        return $count;

    }
    // voir les nombre sur les tables 
    function showCountTableWhere($table,$column, $valeur)
    {
      $data = DB::table($table)->where($column,'=', $valeur)->count();
      return $data;
    }

    function showCountTableWhereTestInsert($table,$column, $valeur,$column2, $valeur2)
    {
      $data = DB::table($table)->where([
        [$column,'=', $valeur],
        [$column2,'=', $valeur2]
      ])->count();
      return $data;
    }

    //difentent de column null
     function showCountTableWhereNull($table,$column, $valeur,$column2, $valeur2)
    {
      $data = DB::table($table)->where([
        [$column,'=', $valeur],
        [$column2,'!=', $valeur2]
      ])->count();
      return $data;
    }

    function showCountTableWhere2($table,$column, $valeur,$column2, $valeur2)
    {
      $data = DB::table($table)->where([
        [$column,'=', $valeur],
        [$column2,'=', $valeur2]
      ])->count();
      return $data;
    }

    // voir les nombre sur les tables 
    function showCountTable($table)
    {
      $data = DB::table($table)->count();
      return $data;
    }

    // utulisateur en action connecté 
    function UsersActionConnected($id_user)
    {
        $contributions = DB::table("users")
        ->join('roles','users.id_role','=','roles.id')
        
        ->select('users.id','users.name','users.email','users.id_role','roles.role_name as role', 'users.created_at')
        ->where('users.id', '=', $id_user)->get();
        $data = [];
        foreach ($contributions as $row) {
            # code...
            array_push($data, array(
                'name'          =>  $row->name,
                'privilege'     =>  $row->role,
            ));

        }
        return $data;
    }

    function mesEmprunt($id_user, $table)
    {
        $credits = DB::table($table)->where('id_user', '=', $id_user)->get();
        $data = [];
        foreach ($credits as $row) {
            # code...
            array_push($data, array(
                'jour'          =>  $row->datejour,
                'montant'       =>  $row->montant,
                'created_at'    =>  $row->created_at,
                'connected'     =>  $this->UsersActionConnected($row->connected)
                
            ));

        }
        return $data;
    }

    // voir la somme de contributions ou de remboursement par utilisateur
    function showSumMontantUser($table,$column, $valeur, $money)
    {
        $somme = DB::table($table)->where($column, '=', $valeur)->sum($table.'.'.$money);
        return $somme;
    }

    function showSumMontantTable($table, $money)
    {
        $somme = DB::table($table)->sum($table.'.'.$money);
        return $somme;
    }

    function showNumberDataTableUser($table, $column, $valeur)
    {
       $tests = DB::table($table)->where([
            [$column,     '=', $valeur]

        ])->get();
        $count = $tests->count();

        return  $count;
    }

    function showNumberDataTable($table)
    {
       $tests = DB::table($table)->get();
       $count = $tests->count();

      return  $count;
    }

    function showCount($id, $table)
    {
        $demandes = DB::table($table)->where([
            ['id', '=', $id],
            ['etat', '=', 1]
        ])->get();

        $count = $demandes->count();
        return $count;

    }

    function getAdminInfo($id)
    {
      $user=User::where('id',$id)->select('email','name','id_role')->first();
      if (!is_null($user)) {
        return $user;
      }
    }

    function getLogoSite()
    {
        $data = DB::table('sites')
        ->select('id', 'nom', 'description', 'email','adresse','tel1','tel2','tel3','token', 'about','mission','objectif','politique','condition','logo','facebook','linkedin','twitter','youtube')->take(1)->get();
        $info='';
        foreach ($data as $row) {
            // code...
            $info = $row->logo;
        }
        return $info;
    }
    function getNomSite()
    {
        $data = DB::table('sites')
        ->select('id', 'nom', 'description', 'email','adresse','tel1','tel2','tel3','token', 'about','mission','objectif','politique','condition','logo','facebook','linkedin','twitter','youtube')->take(1)->get();
        $info='';
        foreach ($data as $row) {
            // code...
            $info = $row->nom;
        }
        return strtoupper($info);
    }

    function getTokenSite()
    {
        $data = DB::table('sites')
        ->select('id', 'nom', 'description', 'email','adresse','tel1','tel2','tel3','token', 'about','mission','objectif','politique','condition','logo','facebook','linkedin','twitter','youtube')->take(1)->get();
        $info='';
        foreach ($data as $row) {
            // code...
            $info = $row->token;
        }
        return $info;
    }

    function getNumDevSite()
    {
        $data = DB::table('sites')
        ->select('id', 'nom', 'description', 'email','adresse','tel1','tel2','tel3','token', 'about','mission','objectif','politique','condition','logo','facebook','linkedin','twitter','youtube')->take(1)->get();
        $info='';
        foreach ($data as $row) {
            // code...
            $info = $row->tel3;
        }
        return $info;
    }

    function GetIdentifiantCategory($slug)
    {
        $listData = DB::table("blogs")
        ->join('category_articles','category_articles.id','=','blogs.id_cat')
        ->select("blogs.id", "blogs.titre","blogs.slug",
            "blogs.description","blogs.photo","blogs.etat",
            "category_articles.nom","blogs.id_cat",
         "blogs.created_at")
        ->where('category_articles.slug', '=', $slug)->limit(1)->get();
        $data = [];
        $identifiant = '';
        foreach ($listData as $row) {
            # code...
            $identifiant = $row->id_cat;

        }
        return $identifiant;
    }

    function getNomAgent($id)
    {
        $data = DB::table('users')
        
        ->select(
             "users.id","users.name","users.email", "users.created_at"
        )
        ->where("users.id", $id)
        ->get();
        $idAgent = '';
        foreach ($data as $row) {
            # code...
            $idAgent = $row->name;
        }

        return $idAgent;
    }

    function generateQrcode($text) {

        $qrc = QrCode::size(100)->generate($text);
        $qrcode='<img src="data:image/svg+xml;base64,'.base64_encode($qrc).'" 
        width="70" height="70">';
        return $qrcode;
    }

    function displayImg($schema, $file)
    {
        $logo=base_path('public/'.$schema.'/'.$file);
        $f=file_get_contents($logo);
        $pic='data:image/png;base64,'.base64_encode($f);
        return $pic;
    }

    function entetePrintPDF($text1, $text2)
    {
        $output = '';
        $nomSite = $this->getNomSite();
        $logordc = $this->displayImg('images', 'rdc.png');
        $logoSite =$this->displayImg('images', $this->getLogoSite());

        $output .=' 
        <table width="100%" border="0" cellspacing="0" cellpadding="1" >
            <tr>
                <td width="25%">
                    <img src="'.$logoSite.'"  width="100" height="100" style="float: right;margin-top: 15px;" />
                </td>
                <td width="50%" style="font-weight:bold;">
                    <h3 align="center" style="color:blue;">
                        '.$text1.'
                    </h3>
    
                   <div align="center"> '.$text2.' </div>
                   <br/>
                </td>
                <td width="25%">
                    <img src="'.$logordc.'"  width="100" height="100" style="float: left;margin-top: 15px;" />
                </td>
            </tr>
        </table>
        ';
        return $output;
    }



    







}




?>