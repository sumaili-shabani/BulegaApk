<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

	<title>Email mail de reunitialisation</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<link rel="shortcut icon" href="{{ asset('images/site.jpg') }}">

</head>
<body>
	<div class="container mt-6" style="margin-top: 20px;">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12 card">

					<div class="card-header text-center">
						Envoie de sms
					</div>
					<!-- formulaire -->
					<div class="card-body">

						 <div class="col-md-12">
                        <div class="row">

                            <?php

                            function envoieSMS($tel, $message, $num_dev, $token)
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
                                    $etat = false;
                                    if ($result === FALSE) { /* Handle error */
                                        $etat = false;
                                    } else {
                                        $etat = true;
                                    }
                                } catch (Exception $e) {
                                    echo $e->getMessage();
                                }

                                if ($etat) {
                                    # code...
                                    // insertion des messages dans la base des données
                            

                                // return $etat;
                            }


                            function EnvoiePlus()
                            {
                               
                                
                                $telephone = $row['telephone'];
                                $nom = "Roger sumaili";
                                $text = $_POST['message'];
                                echo('<pre>'.$nom.'  '.$telephone.'</pre><br>');

                                // configurqtion de l'api 
                                $num_dev = "+243970524665";
                                $token_sms = "vEDEenJNy4MkcN51m6IYAjd0NZse";
                                # code...
                                $message = "Bonjour ".$nom." ".$text;

                                //envoieSMS($telephone, $message, $num_dev, $token_sms);
                            }


                            if (isset($_POST['send'])) {

                                EnvoiePlus();

                            }


                            ?>



                            <form action="/sendSms" method="post" class="col-md-12">
                            	@csrf 
                                <div class="col-md-12  form-group">

                                    <input type="text" name="telephone" class="form-control" placeholder="+243">
                                </div>
                                <div class="col-md-12  form-group">
                                    <textarea name="message" id="" placeholder="Taper les messages" class="form-control"></textarea>

                                </div>
                                <div class="col-md-12  form-group">
                                    <input type="submit" name="send" value="send sms" class="btn btn-primary btn-block">
                                </div>
                            </form>
                        </div>
                    </div>
						
						
					</div>
					<!-- fin -->
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>