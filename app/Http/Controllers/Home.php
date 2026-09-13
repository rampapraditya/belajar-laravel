<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Home extends Controller
{
    public function index()
    {
        $data['menu'] = request()->segment(1);
        
        $logo = asset('img/def.png');
        $foto = asset('img/def.png');

        $data['foto'] = $foto;
        $data['logo'] = $logo;
        $data['akses'] = 'ADMINISTRATOR';
        $data['nama'] = 'Rampa Praditya';

        return view('home.index', $data);
    }
}
