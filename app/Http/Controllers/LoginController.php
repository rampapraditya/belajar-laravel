<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Identitas;
use App\Models\Users;
use App\Libraries\Modul;

class LoginController extends Controller
{
    public function index()
    {
        $data = [];

        // Menggunakan Model Eloquent (Lebih bersih dan standar Laravel)
        $tersimpan = Identitas::first();

        if ($tersimpan) {
            $data['namaapp'] = $tersimpan->namaapp;
            $data['organisasi'] = $tersimpan->organisasi;

            $deflogo = asset('img/def.jpg');
            if (!empty($tersimpan->logo)) {
                if (file_exists(public_path($tersimpan->logo))) {
                    $deflogo = asset($tersimpan->logo);
                }
            }
            $data['logo'] = $deflogo;
        } else {
            $data['namaapp'] = "";
            $data['organisasi'] = "";
            $data['logo'] = asset('img/def.jpg');
        }

        return view('login', $data);
    }

    public function proses(Request $request)
    {
        clearstatcache();

        // 1. Ambil data input dari request AJAX
        $username = strip_tags($request->input('user'));
        $passwordRaw = strip_tags($request->input('pass'));

        $user = Users::where('username', $username)->first();

        if (!$user) {
            $status = "Sorry, user not found!";
        } else {
            // 3. JALAN KAN ENKRIPSI KUSTOM (Mengganti md5 lama dengan fungsi library baru)
            $passwordEnkrip = Modul::enkrip_pass($passwordRaw);

            // 4. Validasi password langsung mencocokkan nilai kolom 'pass' pada objek $user
            if ($user->pass !== $passwordEnkrip) {
                $status = "You are not authorized to access!";
            } else {
                // 5 & 6. Validasi tingkatan hak akses & Set Session Laravel (Menggunakan Relasi Modern)
                if ($user->akses && $user->akses->namaakses === "ADMINISTRATOR") {
                    session()->put([
                        'idusers'      => $user->idusers,
                        'nama'         => $user->nama,
                        'namaakses'    => $user->akses->namaakses,
                        'idpt'         => $user->id_pt,
                        'namapt'       => $user->pt ? $user->pt->nama_pt : '-',
                        'logged_admin' => true
                    ]);
                    
                    // Commit session secara paksa agar langsung terkunci saat halaman berpindah
                    session()->save();

                    $status = "ok";
                } else {
                    $status = "Not your access!";
                }
            }
        }

        // 7. Kembalikan response JSON beserta Token CSRF baru agar disinkronkan oleh iziToast
        return response()->json(['status' => $status], 200)
            ->header('X-CSRF-TOKEN', csrf_token());
    }


    public function logout()
    {
        // Menghapus dan membersihkan seluruh isi session (setara dengan session()->destroy())
        session()->flush();
        clearstatcache();

        // Mengarahkan langsung (redirect) ke halaman login utama
        return redirect('login');
    }
}
