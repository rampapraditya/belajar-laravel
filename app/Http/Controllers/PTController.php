<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pt;
use Illuminate\Support\Facades\Storage;

class PTController extends Controller
{
    public function index(Request $request)
    {
        // 1. Mengambil segment URL pertama (misal: 'pt') untuk penanda menu aktif
        $data['menu'] = $request->segment(1);


        $logo = asset('img/def.png');
        $foto = asset('img/def.png');

        $data['foto'] = $foto;
        $data['logo'] = $logo;
        $data['akses'] = 'ADMINISTRATOR';
        $data['nama'] = 'Rampa Praditya';

        // 2. Menampilkan file view 'pt/index.blade.php' sambil mengirimkan datanya
        return view('pt.index', $data);
    }

    public function ajaxList()
    {
        $list = Pt::orderBy('created_at', 'asc')->get();

        $data = [];
        $no = 1;

        foreach ($list as $row) {
            $logo = asset('img/def.png');

            if (!empty($row->logo_pt) && trim($row->logo_pt) !== '') {
                if (file_exists(public_path($row->logo_pt))) {
                    $logo = asset($row->logo_pt);
                }
            }

            $val = [];
            $val[] = $no;
            $val[] = $row->kode_pt;
            $val[] = $row->nama_pt;
            $val[] = $row->alamat_pt;
            $val[] = $row->telepon_pt;

            // Kolom Gambar Logo
            $val[] = '<img src="' . $logo . '" alt="Logo PT" class="rounded" style="max-width: 60px; height: auto;">';

            // Kolom Status
            $val[] = ($row->status == 1)
                ? '<span class="badge rounded-pill bg-label-primary me-1">Active</span>'
                : '<span class="badge rounded-pill bg-label-warning me-1">Tidak Aktif</span>';

            // Kolom Aksi Tombol Ganti (Edit) dan Hapus
            $namaAman = addslashes($row->nama_pt);
            $val[] = '<div class="d-flex align-items-center justify-content-center gap-2">
                        <button onclick="ganti(\'' . $row->id_pt . '\')" class="btn btn-sm btn-text-warning rounded-pill btn-icon item-edit" title="Edit">
                            <i class="icon-base ri ri-edit-box-line icon-22px"></i>
                        </button>
                        <button onclick="hapus(\'' . $row->id_pt . '\', \'' . $namaAman . '\')" class="btn btn-sm btn-text-danger rounded-pill btn-icon item-delete" title="Delete">
                            <i class="icon-base ri ri-delete-bin-line icon-22px"></i>
                        </button>
                    </div>';

            $data[] = $val;
            $no++;
        }

        session()->save();

        return response()->json(['data' => $data]);
    }

    public function ajax_add(Request $request)
    {
        // 1. Gabungkan pengecekan file DAN teks ke dalam satu Validator agar CSRF Token diproses normal lebih dulu
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            // Kita gunakan 'required' agar Laravel otomatis menolak jika file kosong atau tidak valid
            'file'   => 'required|file|mimes:jpeg,jpg,png|max:10240', // 10240 KB = 10 MB
            'kode'   => 'required',
            'nama'   => 'required',
            'alamat' => 'nullable',
            'tlp'    => 'nullable',
            'status' => 'required',
        ], [
            'file.required' => 'File logo tidak ditemukan. Silakan pilih file untuk diunggah.',
            'file.mimes'    => 'Hanya diperkenankan file gambar (JPG/JPEG/PNG)',
            'file.max'      => 'Hanya diperkenankan file di bawah 10 MB',
        ]);

        // Jika ada aturan validasi yang dilanggar (termasuk jika file logo tidak ada)
        if ($validator->fails()) {
            return response()->json(['status' => $validator->errors()->first()], 200)
                ->header('X-CSRF-TOKEN', csrf_token());
        }

        // 2. Jika validasi lolos, jalankan logika penyimpanan data
        $status = $this->simpanDengan($request);

        // 3. Kembalikan response berupa JSON beserta Token CSRF baru yang sudah valid
        return response()->json(['status' => $status], 200)
            ->header('X-CSRF-TOKEN', csrf_token());
    }

    private function simpanDengan(Request $request)
    {
        try {
            $file = $request->file('file');

            // 1. Generate nama acak aman
            $fileName = $file->hashName();

            // Ini membuat file langsung berada di folder publik, mirip writable/public di CI4
            $file->move(public_path('logos'), $fileName);

            // 3. Simpan ke database via Eloquent Model Pt
            $pt = new Pt();
            $pt->kode_pt    = strip_tags($request->input('kode'));
            $pt->nama_pt    = strip_tags($request->input('nama'));
            $pt->alamat_pt  = strip_tags($request->input('alamat'));
            $pt->telepon_pt = strip_tags($request->input('tlp'));
            $pt->logo_pt    = 'logos/' . $fileName; // Kita simpan path foldernya sekalian agar mudah dipanggil
            $pt->status     = strip_tags($request->input('status'));

            $isSaved = $pt->save();

            if ($isSaved) {
                return "Data tersimpan";
            } else {
                return "Data gagal tersimpan";
            }
        } catch (\Exception $e) {
            return "Data gagal tersimpan";
        }
    }

    public function show(Request $request)
    {
        $pt = Pt::findOrFail($request->input('id'));
        return response()->json($pt);
    }

    // URL: pt/ajax-edit (Dipanggil saat tombol Save di dalam form Ganti diklik)
    public function ajax_edit(Request $request)
    {
        // 1. Ambil data PT yang akan diubah berdasarkan input 'kodesis' (id_pt)
        $pt = Pt::findOrFail($request->input('kodesis'));

        // 2. Set aturan validasi teks bawaan
        $rules = [
            'kode'   => 'required',
            'nama'   => 'required',
            'alamat' => 'nullable',
            'tlp'    => 'nullable',
            'status' => 'required',
        ];

        // 3. Tambahkan validasi file HANYA jika pengguna mengunggah berkas logo baru
        if ($request->hasFile('file') && $request->file('file')->isValid()) {
            $rules['file'] = 'file|mimes:jpeg,jpg,png|max:10240'; // Maksimal 10MB
        }

        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), $rules, [
            'file.mimes' => 'Hanya diperkenankan file gambar (JPG/JPEG/PNG)',
            'file.max'   => 'Hanya diperkenankan file di bawah 10 MB',
        ]);

        // Jika validasi gagal, kembalikan HTTP status 422 agar ditangkap blok error AJAX
        if ($validator->fails()) {
            return response()->json(['status' => $validator->errors()->first()], 422);
        }

        // 4. Eksekusi pembaruan data ke database
        try {
            $pt->kode_pt    = strip_tags($request->input('kode'));
            $pt->nama_pt    = strip_tags($request->input('nama'));
            $pt->alamat_pt  = strip_tags($request->input('alamat'));
            $pt->telepon_pt = strip_tags($request->input('tlp'));
            $pt->status     = strip_tags($request->input('status'));

            // Tangani pembaruan berkas logo jika ada file baru yang masuk
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $fileName = $file->hashName();

                // Hapus logo lama dari folder public fisik jika sebelumnya ada
                if (!empty($pt->logo_pt) && file_exists(public_path($pt->logo_pt))) {
                    unlink(public_path($pt->logo_pt));
                }

                // Pindahkan file logo baru langsung ke folder public fisik (public/logos/)
                $file->move(public_path('logos'), $fileName);
                $pt->logo_pt = 'logos/' . $fileName;
            }

            // Kolom updated_at otomatis diisi oleh Eloquent Laravel
            $pt->save();

            $status = "Data tersimpan";
        } catch (\Exception $e) {
            $status = "Data gagal tersimpan";
        }

        return response()->json(['status' => $status], 200)
            ->header('X-CSRF-TOKEN', csrf_token());
    }


    public function hapus(Request $request)
    {
        $idPt = $request->input('id');

        try {
            $pt = Pt::findOrFail($idPt);

            if (!empty($pt->logo_pt) && file_exists(public_path($pt->logo_pt))) {
                unlink(public_path($pt->logo_pt));
            }

            $pt->delete();
            $status = "Data terhapus";
        } catch (\Exception $e) {
            $status = "Data gagal terhapus";
        }

        return response()->json(['status' => $status], 200)
            ->header('X-CSRF-TOKEN', csrf_token());
    }
}
