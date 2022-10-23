<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use App\Models\Backend\{Reunion};
use App\Traits\{GlobalMethod, Slug};
use DB;

class ReunionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    use GlobalMethod,Slug;
    public function index(Request $request)
    {
        //
        $data = DB::table("reunions")
        ->join('users','users.id','=','reunions.user_id')
        ->select("reunions.id", "reunions.nom","reunions.slug",
            "reunions.start_date","reunions.end_date","reunions.hours","reunions.user_id",

            'users.avatar','users.name','users.email','users.sexe',
         "reunions.created_at");

        if (!is_null($request->get('query'))) {
            # code...
            $query = $this->Gquery($request);

            $data->where('reunions.nom', 'like', '%'.$query.'%')
            ->orWhere('users.name', 'like', '%'.$query.'%')
            ->orWhere('reunions.start_date', 'like', '%'.$query.'%')
            ->orWhere('reunions.end_date', 'like', '%'.$query.'%')
            ->orWhere('reunions.hours', 'like', '%'.$query.'%')
            ->orderBy("reunions.id", "desc");

            return $this->apiData($data->paginate(4));
           

        }
        $data->orderBy("reunions.id", "desc");
        return $this->apiData($data->paginate(4));
    }

    function fetchReunion(Request $request)
    {
        //
         $data = DB::table("reunions")
        ->join('users','users.id','=','reunions.user_id')
        ->select("reunions.id", "reunions.nom","reunions.slug",
            "reunions.start_date","reunions.end_date","reunions.hours","reunions.user_id",

            'users.avatar','users.name','users.email','users.sexe',
         "reunions.created_at")->get();

        return response()->json(['data'  =>  $data]);
    }

    public function participateToConference($slug)
    {
        //
        $data = DB::table("reunions")
        ->join('users','users.id','=','reunions.user_id')
        ->select("reunions.id", "reunions.nom","reunions.slug",
            "reunions.start_date","reunions.end_date","reunions.hours","reunions.user_id",

            'users.avatar','users.name','users.email','users.sexe',
         "reunions.created_at")->where('reunions.slug', $slug)->take(1)->get();
        return response()->json(['data'  =>  $data]);
    }


    function displayInCalendar($user_id)
    {
 
        $gains = DB::table("reunions")
        ->join('users','users.id','=','reunions.user_id')
        ->select("reunions.id", "reunions.nom","reunions.slug",
            "reunions.start_date","reunions.end_date","reunions.hours","reunions.user_id",

            'users.avatar','users.name','users.email','users.sexe',
         "reunions.created_at")
        ->where('reunions.user_id',$user_id)
        ->get();

        $data = [];

        foreach ($gains as $row) {

            $name = $row->nom. "à ".$row->hours;
            # code...
            array_push($data, array(

                "name"      =>  $name,
                "start"     =>  $row->start_date,
                "end"       =>  $row->end_date
            ));

        }
        return response()->json(['data' => $data]);

    }


    public function showNotificationUser($user_id, Request $request)
    {
        //
        $data = DB::table("reunions")
        ->join('users','users.id','=','reunions.user_id')
        ->select("reunions.id", "reunions.nom","reunions.slug",
            "reunions.start_date","reunions.end_date","reunions.hours","reunions.user_id",

            'users.avatar','users.name','users.email','users.sexe',
         "reunions.created_at");

        if (!is_null($request->get('query'))) {
            # code...
            $query = $this->Gquery($request);

            $data->where([
                ['reunions.nom', 'like', '%'.$query.'%'],
                ['reunions.user_id', $user_id]
            ])

            ->orderBy("reunions.id", "desc");

            return $this->apiData($data->paginate(3));
           

        }

        $data->where('reunions.user_id', $user_id)
        ->orderBy("reunions.id", "desc");
        return $this->apiData($data->paginate(3));
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
            $stringToSlug=substr($request->nom,0,16).'-'.$this->generateOpt(8);
            $slug =$this->makeSlug($stringToSlug);

            $data = Reunion::where("id", $request->id)->update([
                'user_id'           =>  $request->user_id,
                'nom'               =>  $request->nom,
                'start_date'        =>  $request->start_date,
                'end_date'          =>  $request->end_date,
                'hours'             =>  $request->hours

            ]);
            return response()->json(['data'  =>  "Modification avec succès!!!"]);

        }
        else
        {
            // insertion 
            $stringToSlug=substr($request->nom,0,16).'-'.$this->generateOpt(8);
            $slug =$this->makeSlug($stringToSlug);
            $users = $request->user_id;
            foreach ($users as $user_id) {
                // code...
                $data = Reunion::create([
                    'user_id'           =>  $user_id,
                    'nom'               =>  $request->nom,
                    'start_date'        =>  $request->start_date,
                    'end_date'          =>  $request->end_date,
                    'hours'             =>  $request->hours,
                    'slug'              =>  $slug
                ]);
            }
            
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
        $data = DB::table("reunions")
        ->join('users','users.id','=','reunions.user_id')
        ->select("reunions.id", "reunions.nom","reunions.slug",
            "reunions.start_date","reunions.end_date","reunions.hours","reunions.user_id",

            'users.avatar','users.name','users.email','users.sexe',
         "reunions.created_at")->where('reunions.id', $id)->get();
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
        $data = Reunion::where("id", $id)->delete();
        return response()->json(['data'  =>  "Suppression avec succès!!!"]);
    }
}
