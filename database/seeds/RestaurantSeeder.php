<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RestaurantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('localisations')->insert([
            'user_id'       =>  4,
            'name'          =>  'Goma Keshero',
            'adress'        =>  'Santé mantale',
            'city'          =>  'Goma',
            'state'         =>  'RDcongo',
            'hours'         =>  '9:00am-6:00pm',

            'latitude'      =>  29.187261, 
            'longitude'     =>  -1.655107,
            'created_at'    =>  date('Y-m-d H:i:s'),
            'updated_at'    =>  date('Y-m-d H:i:s')
        ]);

        DB::table('localisations')->insert([
            'user_id'       =>  4,
            'name'          =>  'Goma Keshero',
            'adress'        =>  'Santé mantale',
            'city'          =>  'Goma',
            'state'         =>  'RDcongo',
            'hours'         =>  '9:00am-6:00pm',

            'latitude'      =>  29.187599, 
            'longitude'     =>  -1.655418,
            'created_at'    =>  date('Y-m-d H:i:s'),
            'updated_at'    =>  date('Y-m-d H:i:s')

        ]);

        DB::table('localisations')->insert([
            'user_id'       =>  4,
            'name'          =>  'Stade des freres de la charité(charity park stadium)',
            'adress'        =>  'Stade des freres',
            'city'          =>  'Goma',
            'state'         =>  'RDcongo',
            'hours'         =>  '10:00am-4:00pm',

            'latitude'      =>  29.188271, 
            'longitude'     =>  -1.65554,
            'created_at'    =>  date('Y-m-d H:i:s'),
            'updated_at'    =>  date('Y-m-d H:i:s')
            
        ]);
    }
}
