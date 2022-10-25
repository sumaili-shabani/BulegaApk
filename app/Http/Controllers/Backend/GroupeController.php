<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Backend\{groupement};
use App\Traits\{GlobalMethod,Slug};
use DB;

class GroupeController extends Controller
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
        $data = DB::table("groupements")
        ->join('chefferis','chefferis.id','=','groupements.idChef')
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("groupements.id",
            //identification
            "groupements.idChef", "groupements.nomGroup",  
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at");

        if (!is_null($request->get('query'))) {
            # code...
            $query = $this->Gquery($request);

            $data->where('chefferis.nomTer', 'like', '%'.$query.'%')
            ->orWhere('groupements.nomGroup', 'like', '%'.$query.'%')
            ->orWhere('territoires.nomTerritoire', 'like', '%'.$query.'%')
            ->orderBy("groupements.id", "desc");

            return $this->apiData($data->paginate(4));
           

        }
        $data->orderBy("groupements.id", "desc");
        return $this->apiData($data->paginate(4));
    }


    function fetch_groupement_2()
    {
         $data = DB::table("groupements")
        ->join('chefferis','chefferis.id','=','groupements.idChef')
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("groupements.id",
            //identification
            "groupements.idChef", "groupements.nomGroup",  
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at")
        ->get();
        
        return response()->json(['data' => $data]);

    }

    function fetch_groupement_tug($idChef)
    {
         $data = DB::table("groupements")
        ->join('chefferis','chefferis.id','=','groupements.idChef')
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("groupements.id",
            //identification
            "groupements.idChef", "groupements.nomGroup",  
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at")
        ->where("groupements.idChef", $idChef)
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
            $data = groupement::where("id", $request->id)->update([
                'idChef'        =>  $request->idChef,
                'nomGroup'      =>  $request->nomGroup
            ]);
            return $this->msgJson('Modification avec succès!!!');

        }
        else
        {
            // insertion 
            $data = groupement::create([
                'idChef'        =>  $request->idChef,
                'nomGroup'      =>  $request->nomGroup
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
        $data =  DB::table("groupements")
        ->join('chefferis','chefferis.id','=','groupements.idChef')
        ->join('territoires','territoires.id','=','chefferis.idTer')
        ->select("groupements.id",
            //identification
            "groupements.idChef", "groupements.nomGroup",  
            "chefferis.idTer", "chefferis.nomTer", 
            "territoires.nomTerritoire", 
            "chefferis.created_at")->where('groupements.id', $id)->get();
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
        $data = groupement::where('id', $id)->delete();
        return $this->msgJson('Suppression avec succès!!!');
    }
}
