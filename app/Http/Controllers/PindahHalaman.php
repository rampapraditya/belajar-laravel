<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PindahHalaman extends Controller
{
    public function index()
    {
        $data = [];

        return view('pindah.index', $data);
    }

    public function detail()
    {
        $data = [];

        return view('pindah.detail', $data);
    }
}
