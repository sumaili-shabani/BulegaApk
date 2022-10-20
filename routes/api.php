<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['namespace'   =>  "Role"], function(){
    Route::get("fetch_role", 'RoleController@index');
    Route::get("fetch_single_role/{id}", 'RoleController@edit');
    Route::get("delete_role/{id}", 'RoleController@destroy');
    Route::post("insert_role", 'RoleController@store');
});

Route::group(['namespace'   =>  "User"], function(){
    Route::get("fetch_user", 'UserController@index');
    Route::get("fetch_user_all", 'UserController@fetch_user_all');
    
    Route::get("fetch_single_user/{id}", 'UserController@edit');
    Route::get("delete_user/{id}", 'UserController@destroy');
    Route::post("insert_user", 'UserController@store');
    Route::post("change_pwd_user", 'UserController@ChangePassword');
    Route::post("change_role_user", 'UserController@ChangeRole');

    Route::post("insertion_user", 'UserController@insert_user');

    // envoie de mail
    Route::post("send_mail", 'SendMailController@send_mail');
    // imprimmer sa carte 
    Route::get('print_bill','UserController@printBill');

    Route::post('edit_photo','UserController@editPhoto');

    Route::get("showUser/{id}", 'UserController@showUser');

    //modifier son mot de passe
    Route::post("ChangeMyPasswordSecure", 'UserController@ChangeMyPasswordSecure');

    Route::get("fetch_user_ceo", 'UserController@fetch_user_ceo');

    Route::get("checkEtat_compte/{id}/{etat}", 'UserController@checkEtat_Compte');

    

    
    
});

Route::group(['namespace'   =>  "Site"], function(){
    Route::get("fetch_site", 'SiteController@index');
    Route::get("fetch_single_site/{id}", 'SiteController@edit');
    Route::get("delete_site/{id}", 'SiteController@destroy');
    Route::post("insert_site", 'SiteController@store');
   
    Route::post('edit_photo_site','SiteController@editPhoto');

});

Route::group(['namespace'   =>  "Basic"], function(){
    Route::get("fetch_basic", 'BasicController@index');
    Route::get("fetch_single_basic/{id}", 'BasicController@edit');
    Route::get("delete_basic/{id}", 'BasicController@destroy');
    Route::post("insert_basic", 'BasicController@store');

});

Route::group(['namespace'   =>  "Service"], function(){
    Route::get("fetch_service", 'ServiceController@index');
    Route::get("fetch_single_service/{id}", 'ServiceController@edit');
    Route::get("delete_service/{id}", 'ServiceController@destroy');
    Route::post("insert_service", 'ServiceController@store');

});

Route::group(['namespace'   =>  "Category"], function(){
    Route::get("fetch_category_article", 'CategoryArticleController@index');
    Route::get("fetch_single_category_article/{id}", 'CategoryArticleController@edit');
    Route::get("delete_category_article/{id}", 'CategoryArticleController@destroy');
    Route::post("insert_category_article", 'CategoryArticleController@store');
    Route::get("fetchCategoryArticle", 'CategoryArticleController@fetchCategoryArticle');
    
});

Route::group(['namespace'   =>  "Blog"], function(){
    Route::get("fetch_blog", 'BlogController@index');
    Route::get("fetch_single_blog/{id}", 'BlogController@edit');
    Route::get("delete_blog/{id}", 'BlogController@destroy');

    Route::get("checkEtat_blog/{id}/{etat}", 'BlogController@checkEtat_blog');
    Route::post("insert_blog", 'BlogController@insertData');
    Route::post("update_blog", 'BlogController@updateData');

});


Route::group(['namespace'   =>  "Partenaire"], function(){
    Route::get("fetch_partenaire", 'PartenaireController@index');
    Route::get("fetch_single_partenaire/{id}", 'PartenaireController@edit');
    Route::get("delete_partenaire/{id}", 'PartenaireController@destroy');
    Route::post("insert_partenaire", 'PartenaireController@insertData');
    Route::post("update_partenaire", 'PartenaireController@updateData');

});

Route::group(['namespace'   =>  "Galery"], function(){
    Route::get("fetch_galery", 'GaleryController@index');
    Route::get("fetch_single_galery/{id}", 'GaleryController@edit');
    Route::get("delete_galery/{id}", 'GaleryController@destroy');
    Route::post("insert_galery", 'GaleryController@insertData');
    Route::post("update_galery", 'GaleryController@updateData');

});

Route::group(['namespace'   =>  "Video"], function(){
    Route::get("fetch_video", 'VideoController@index');
    Route::get("fetch_single_video/{id}", 'VideoController@edit');
    Route::get("delete_video/{id}", 'VideoController@destroy');
    Route::post("insert_video", 'VideoController@store');

});

Route::group(['namespace'   =>  "Team"], function(){
    //team 
    Route::get("fetch_team", 'TeamController@index');
    Route::get("fetch_single_team/{id}", 'TeamController@edit');
    Route::get("delete_team/{id}", 'TeamController@destroy');
    Route::post("insert_team", 'TeamController@insertData');
    Route::post("update_team", 'TeamController@updateData');
    Route::get("validationTeam/{id}/{etat}", 'TeamController@validationTeam');
    
});

Route::group(['namespace'   =>  "ContactInfo"], function(){
    Route::get("fetch_contact_onfo", 'ContactInfoController@index');
    Route::get("fetch_single_contact_onfo/{id}", 'ContactInfoController@edit');
    Route::get("delete_contact_onfo/{id}", 'ContactInfoController@destroy');
    Route::post("insert_contact_onfo", 'ContactInfoController@store');

});

Route::group(['namespace'   =>  "Carousel"], function(){
    Route::get("fetch_carousel", 'CarouselController@index');
    Route::get("fetch_single_carousel/{id}", 'CarouselController@edit');
    Route::get("delete_carousel/{id}", 'CarouselController@destroy');
    Route::post("insert_carousel", 'CarouselController@insertData');
    Route::post("update_carousel", 'CarouselController@updateData');
    
});

/*
*les scripts commencent
*=====================
*pnud management project
*------------------------
*/
Route::group(['namespace'   =>  "Backend"], function(){

    //mot de la semaine
    Route::get("fetch_week", 'SwotController@indexMotSemaine');
    Route::get("fetch_single_week/{id}", 'SwotController@editMotSemaine');
    Route::get("delete_week/{id}", 'SwotController@destroyMotSemaine');
    Route::post("insert_week", 'SwotController@storeMotSemaine');
    Route::get("fetch_latest_week", 'SwotController@showLatestweek');
    Route::get("fetch_latest_users", 'SwotController@getListUsersLatest');

    //fin mot de la semaine


    Route::get("fetch_pays", 'PaysController@index');
    Route::get("fetch_single_pays/{id}", 'PaysController@edit');
    Route::get("delete_pays/{id}", 'PaysController@destroy');
    Route::post("insert_pays", 'PaysController@store');
    Route::get("fetch_pays_2", 'PaysController@fetch_pays_2');
    Route::get("destroyMessage/{id}", 'PaysController@destroyMessage');
    

    //provinces
    Route::get("fetch_province", 'ProvinceController@index');
    Route::get("fetch_single_province/{id}", 'ProvinceController@edit');
    Route::get("delete_province/{id}", 'ProvinceController@destroy');
    Route::post("insert_province", 'ProvinceController@store');
    Route::get("fetch_province_2", 'ProvinceController@fetch_province_2');
    Route::get("fetch_province_tug_pays/{idPays}", 'ProvinceController@fetch_province_tug_pays');

    //secteur
    Route::get("fetch_secteur", 'SecteurController@index');
    Route::get("fetch_single_secteur/{id}", 'SecteurController@edit');
    Route::get("delete_secteur/{id}", 'SecteurController@destroy');
    Route::post("insert_secteur", 'SecteurController@store');
    Route::get("fetch_secteur_2", 'SecteurController@fetch_secteur_2');

    //forme_juridiques
    Route::get("fetch_forme_juridiques", 'FormeJuridiqueController@index');
    Route::get("fetch_single_forme_juridiques/{id}", 'FormeJuridiqueController@edit');
    Route::get("delete_forme_juridiques/{id}", 'FormeJuridiqueController@destroy');
    Route::post("insert_forme_juridiques", 'FormeJuridiqueController@store');
    Route::get("fetch_forme_juridiques_2", 'FormeJuridiqueController@fetch_forme_juridiques_2');

    //entreprises
    Route::get("fetch_entreprise", 'EntrepriseController@index');
    Route::get("fetch_single_entreprise/{id}", 'EntrepriseController@edit');
    Route::get("delete_entreprise/{id}", 'EntrepriseController@destroy');
    Route::post("insert_entreprise", 'EntrepriseController@store');
    Route::get("fetch_entreprise_2", 'EntrepriseController@fetch_entreprise_2');

    Route::get("checkEtat_entreprise/{id}/{etat}", 'EntrepriseController@checkEtat_entreprise');
    Route::get('get_project_infos/{slug}','EntrepriseController@getEntrepriseDetails');
    Route::post('add_pitch','EntrepriseController@AddPich');
    Route::post('add_busness_plan','EntrepriseController@AddBusnessPlan');

    //triage filtrage
    Route::get("fetch_entreprise_tug/{id}", 'EntrepriseController@fetch_entreprise_tug');
    


    //photoentreprise
    
    Route::get("fetch_photo_entreprise/{id_entrep}", 'EntrepriseController@getPhotoEntreprise');
    Route::post('add_photo_entreprise','EntrepriseController@AddPhotoEntreprise');
    Route::get("delete_photo_entreprise/{id}", 'EntrepriseController@destroyPhotoEntreprise');

    //videoentreprise
    Route::get("fetch_video_entreprise/{id_entrep}", 'EntrepriseController@getVideoEntreprise');
    Route::post("insert_video_entreprise", 'EntrepriseController@storeVideoEntreprise');
    Route::get("fetch_single_video_entreprise/{id_entrep}", 'EntrepriseController@editVideoEntreprise');
    Route::get("delete_video_entreprise/{id_entrep}", 'EntrepriseController@destroyVideoEntreprise');
    
    //canvas model
    Route::get("fetch_canvas_entreprise/{slug}", 'EntrepriseController@getCanvasEntreprise');
    Route::get("fetch_single_canvas_entreprise/{id_entrep}", 'EntrepriseController@editCanvasEntreprise');
    Route::post("insert_canvas_entreprise", 'EntrepriseController@storeCanvasEntreprise');
    Route::get("delete_canvas_entreprise/{id_entrep}", 'EntrepriseController@destroyCanvasEntreprise');

    //pour canvas correction
    Route::get("fetch_single_canvas_correction_entreprise/{id_entrep}", 'EntrepriseController@editCanvasCorrectionEntreprise');
    Route::post("insert_canvas_correction_entreprise", 'EntrepriseController@storeCanvasCorrectionEntreprise');
    Route::get("delete_canvas_correction_entreprise/{id_entrep}", 'EntrepriseController@destroyCanvasCorrectionEntreprise');

    //swot model
    Route::get("fetch_swot_entreprise/{slug}", 'EntrepriseController@getSwotEntreprise');
    Route::get("fetch_single_swot_entreprise/{id_entrep}", 'EntrepriseController@editSwotEntreprise');
    Route::post("insert_swot_entreprise", 'EntrepriseController@storeSwotEntreprise');
    Route::get("delete_swot_entreprise/{id_entrep}", 'EntrepriseController@destroySwotEntreprise');

    //pour swot correction
    Route::get("fetch_single_swot_correction_entreprise/{id_entrep}", 'EntrepriseController@editSwotCorrectionEntreprise');
    Route::post("insert_swot_correction_entreprise", 'EntrepriseController@storeSwotCorrectionEntreprise');
    Route::get("delete_swot_correction_entreprise/{id_entrep}", 'EntrepriseController@destroySwotCorrectionEntreprise');

    Route::get("fetch_filtre_menu_entreprise", 'EntrepriseController@getMenuFiltrage');
    //show ceo entreprise and filtre
    Route::get("fetch_ceo_entreprise", 'EntrepriseController@showCeoEntreprise');
    Route::get("getEntreprisePays/{idPays}", 'EntrepriseController@getEntreprisePays');
    Route::get("getEntreprisePprovince/{idPays}", 'EntrepriseController@getEntreprisePprovince');
    Route::get("getEntrepriseSecteur/{idsecteur}", 'EntrepriseController@getEntrepriseSecteur');
    Route::get("getEntrepriseForme/{idforme}", 'EntrepriseController@getEntrepriseForme');
    Route::get("getEntrepriseEdition/{idforme}", 'EntrepriseController@getEntrepriseEdition');
    //document
    Route::get('get_project_infos_document/{slug}','EntrepriseController@getEntrepriseDetailsDocument');

    // impression de la liste
    Route::get('pdf_entreprise_morale','SwotController@makepdfEntrepriseMorale');
    Route::get('pdf_liste_entreprise_morale','SwotController@makepdfListeEntrepriseMorale');

    //statistique users
    Route::get('stat_users','SwotController@stat_users');
    Route::get('stat_users_sexe_ceo','SwotController@stat_users_sexe_ceo');
    Route::get('pnudShowLineChartAssuranceAuto','SwotController@pnudShowLineChartAssuranceAuto');
    Route::get('stat_blogs','SwotController@stat_blogs');
    
    Route::get('statEntreprise','SwotController@statEntreprise');
    Route::get('statEntrepriseSecteur','SwotController@statEntrepriseSecteur');
    
    Route::get("showCountDashbord", 'SwotController@showCountDashbord');
    Route::get('statEntreprisePrint','SwotController@statEntreprisePrint');

    //debit
    Route::get("showCountDashbord_tug/{id}", 'SwotController@showCountDashbord_tug');
    Route::get('fetchMessagesTug/{user_id}', 'SwotController@fetchMessagesTug');
    
    Route::get('/get_all_users', 'SwotController@users');


    //territoire
    Route::get("fetch_territoire", 'TerritoireController@index');
    Route::get("fetch_single_territoire/{id}", 'TerritoireController@edit');
    Route::get("delete_territoire/{id}", 'TerritoireController@destroy');
    Route::post("insert_territoire", 'TerritoireController@store');
    Route::get("fetch_territoire_2", 'TerritoireController@fetch_territoire_2');

    //texto sms
    Route::get("fetch_texto", 'TextoController@index');
    Route::get("fetch_single_texto/{id}", 'TextoController@edit');
    Route::get("delete_texto/{id}", 'TextoController@destroy');
    Route::post("insert_texto", 'TextoController@store');
    
    Route::get("checkEtat_texto/{id}/{phone}/{etat}", 'TextoController@checkEtat_texto');
    


    
});

/*
*les scripts commencent
*=====================
*pnud management project
*------------------------
*/



