<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

use App\Models\Backend\{Texto};
use App\Traits\{GlobalMethod,Slug};
use DB;

class HomeController extends Controller
{
     /**
     * Create a new controller instance.
     *
     * @return void
     */

    use GlobalMethod,Slug;
    public function __construct()
    {
        $this->middleware('auth');
       
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }


    

    public function sendSmsPhone(Request $request)
    {
        $nom ="Roger sumaili";
        $message = $request->message;
        $phone = $request->phone;
       
        // configuration de l'api 
        $num_dev    = $this->getNumDevSite();
        $token_sms  = $this->getTokenSite();
        // $num_dev = "+243970524665";
        // $token_sms = "Mi0JE6VGyEsCp0RIFlzeQS1awtzb";
        # code...
        $messageSend = "Bonjour ".$nom." ".$message;


        foreach ($phone as $tel) {
            // code...

            $status = $this->envoieSMS($tel, $messageSend, $num_dev, $token_sms);
            if ($status == true) {
                // code...
                $texte ="nom".$nom."<br> tel:".$tel."<br> Message:".$message;

                $data = Texto::create([
                    'phone'     =>  $tel,
                    'message'   =>  $texte,
                    'etat'      =>  1
                ]);
                
                return response()->json([
                    'data'  =>  $texte
                ]);

            } else {
                // code...
                $texte = "Impossible d'envoyer le sms";
                $data = Texto::create([
                    'phone'     =>  $tel,
                    'message'   =>  $texte,
                    'etat'      =>  0
                ]);
                return response()->json([
                    'data'  =>  $texte
                ]);
            }
        }

        
        
    }

    public function sendSms(Request $request)
    {
        $nom ="Roger sumaili";
        $tel = $request->telephone;
        $message = $request->message;
       
        // configuration de l'api 
        $num_dev    = $this->getNumDevSite();
        $token_sms  = $this->getTokenSite();
        # code...
        $messageSend = "Bonjour ".$nom." ".$message;

        $status = $this->envoieSMS($tel, $messageSend, $num_dev, $token_sms);
        if ($status == true) {
            // code...
             echo("nom".$nom."<br> tel:".$tel."<br> Message:".$message);

        } else {
            // code...
            echo("erreur");
        }
        
    }

    public function envoieSMS($tel, $message, $num_dev, $token)
    {
        $etat = false;
        try {
            //form's fields name:
            $value = '{
                "outboundSMSMessageRequest":{
                    "address": "tel:' . $tel . '", 
                    "senderAddress":"tel:' . $num_dev . '", 
                    "outboundSMSTextMessage":{ 
                        "message": "' . $message . '" 
                    } 
                }
            }';
            //API url:
            $url = 'https://api.orange.com/smsmessaging/v1/outbound/tel:' . $num_dev . '/requests';
            //JSON data(not exact, but will be compiled to JSON) file: 
            // use key 'http' even if you send the request to https://...
            $options = array(
                'http' => array(
                    'header'  => "Content-Type: application/json\r\n" .
                        "Authorization:Bearer " . $token . "\r\n",
                    'method'  => 'POST',
                    'content' => $value
                )
            );
            //engine:
            $context  = stream_context_create($options);
            $result = file_get_contents($url, false, $context);
            if ($result === FALSE) { /* Handle error */
                $etat = false;
            } else {
                $etat = true;
            }

            return $etat;

        } catch (Exception $e) {
            echo($e->getMessage());
        }

        
    }


   


    
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function private()
    {
        return view('private');
    }

    public function users()
    {
        return User::all();
    }

    
}
