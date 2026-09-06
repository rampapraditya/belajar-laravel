<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InputController extends Controller
{
    public function index()
    {
        $data = [];
        return view('input.index', $data);
    }

    public function prosesGet(Request $request)
    {
        // get nilai, dan default value jika tidak ada input
        $data['kataKunci'] = $request->input('cari', 'Tidak ada kata kunci');

        return view('input.get', $data);
    }

    public function prosesPost(Request $request)
    {
        // Menangkap data kiriman form POST
        $data['namaUser'] = $request->input('nama');
        $data['emailUser'] = $request->input('email');

        return view('input.post', $data);
    }

    public function detail(Request $request)
    {
        $id = $request->segment(3);
        $data['id'] = $id;

        return view('input.detail', $data);
    }
}
