<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Backend\{Localisation};
use App\Traits\{GlobalMethod,Slug};
use DB;
class LocalisationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        $data = Localisation::get();
        return response()->json([
            'data'      =>  $data
        ]);
    }

   
    public function store(Request $request)
    {
        //
        if ($request->id !='') 
        {
            # code...
            // update 
            $data = Role::where("id", $request->id)->update([
                'name'      =>  $request->name,
                'adress'    =>  $request->adress,
                'city'      =>  $request->city,
                'state'     =>  $request->state,
                'hours'     =>  $request->hours,
                'latitude'  =>  $request->latitude,
                'longitude' =>  $request->longitude,
                'user_id'   =>  $request->user_id
            ]);
            return response()->json(['data'  =>  "Modification avec succès!!!"]);

        }
        else
        {
            // insertion 
            $data = Role::create([
                'name'      =>  $request->name,
                'adress'    =>  $request->adress,
                'city'      =>  $request->city,
                'state'     =>  $request->state,
                'hours'     =>  $request->hours,
                'latitude'  =>  $request->latitude,
                'longitude' =>  $request->longitude,
                'user_id'   =>  $request->user_id
            ]);
            return response()->json(['data'  =>  "Insertion avec succès!!!"]);
         

        }
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
        $data = Localisation::where('id', $id)->get();
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
        $data = Localisation::where("id", $id)->delete();
        return response()->json(['data'  =>  "Suppression avec succès!!!"]);
    }
}
