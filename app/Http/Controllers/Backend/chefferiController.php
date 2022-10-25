<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Backend\{chefferi};
use App\Traits\{GlobalMethod,Slug};
use DB;

class chefferiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    use GlobalMethod;
    use Slug;
    public function index(Request $request)
    {
        //
        $data = DB::table("chefferis")
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("chefferis.id", 
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at");

        if (!is_null($request->get('query'))) {
            # code...
            $query = $this->Gquery($request);

            $data->where('chefferis.nomTer', 'like', '%'.$query.'%')
            ->orWhere('territoires.nomTerritoire', 'like', '%'.$query.'%')
            ->orderBy("chefferis.id", "desc");

            return $this->apiData($data->paginate(4));
           

        }
        $data->orderBy("chefferis.id", "desc");
        return $this->apiData($data->paginate(4));
    }


    function fetch_chefferie_2()
    {
         $data = DB::table("chefferis")
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("chefferis.id", 
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at")
        ->get();
        
        return response()->json(['data' => $data]);

    }

    function fetch_chefferie_tug($idTer)
    {
         $data = DB::table("chefferis")
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("chefferis.id", 
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at")
        ->where("chefferis.idTer", $idTer)
        ->get();
        
        return response()->json(['data' => $data]);

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
            $data = chefferi::where("id", $request->id)->update([
                'idTer'     =>  $request->idTer,
                'nomTer'    =>  $request->nomTer
            ]);
            return $this->msgJson('Modification avec succès!!!');

        }
        else
        {
            // insertion 
            $data = chefferi::create([
                'idTer'     =>  $request->idTer,
                'nomTer'    =>  $request->nomTer
            ]);

            return $this->msgJson('Insertion avec succès!!!');
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
        $data =  DB::table("chefferis")
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("chefferis.id", 
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at")->where('chefferis.id', $id)->get();
        return response()->json(['data' => $data]);
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
        $data = chefferi::where('id', $id)->delete();
        return $this->msgJson('Suppression avec succès!!!');
    }


}
