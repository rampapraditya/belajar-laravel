<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Identitas;
use App\Models\Users;

class Home extends Controller
{
    public function index(Request $request)
    {
        if (!session()->has('logged_admin') || session()->get('logged_admin') !== true) {
            return redirect('login')->with('error', 'Silakan login terlebih dahulu.');
        }

        // 2. Ambil data menu aktif
        $data['menu'] = $request->segment(1);

        // 3. Ambil data nama dan akses langsung dari session login
        $data['nama']  = session()->get('nama');
        $data['akses'] = session()->get('namaakses');

        // 4. Mengambil Foto Profil Asli Pengguna dari database
        $foto = asset('img/def.png');
        $user = Users::find(session()->get('idusers'));
        if ($user && !empty($user->foto) && file_exists(public_path($user->foto))) {
            $foto = asset($user->foto);
        }
        $data['foto'] = $foto;

        // 5. Mengambil Nama Aplikasi & Logo Aplikasi dari tabel 'identitas'
        $identitas = Identitas::first();
        if ($identitas) {
            $logo = asset('img/def.png');
            if (!empty($identitas->logo) && file_exists(public_path($identitas->logo))) {
                $logo = asset($identitas->logo);
            }
            $data['appname'] = $identitas->namaapp;
            $data['logo']    = $logo;
        } else {
            $data['appname'] = "Sistem SPMI";
            $data['logo']    = asset('img/def.png');
        }

        // 6. Tampilkan halaman view home utama (resources/views/home/index.blade.php)
        return view('home.index', $data);
    }
}
