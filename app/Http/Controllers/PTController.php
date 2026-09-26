<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pt;

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
        // 1. Mengambil data PT dari database diurutkan berdasarkan created_at ASC (sesuai kode CI4 kamu)
        $list = \App\Models\Pt::orderBy('created_at', 'asc')->get();

        $data = [];
        $no = 1;

        // 2. Lakukan perulangan untuk menyusun format data DataTables
        foreach ($list as $row) {
            $logo = asset('img/def.png');

            // Cek jika kolom logo_pt ada stands data dan filenya nyata di folder storage public
            if (!empty($row->logo_pt) && trim($row->logo_pt) !== '') {
                // Laravel menyimpan file upload di folder storage/app/public/logos
                if (\Illuminate\Support\Facades\Storage::disk('public')->exists('logos/' . $row->logo_pt)) {
                    $logo = asset('storage/logos/' . $row->logo_pt);
                }
            }

            $val = [];
            $val[] = $no;
            $val[] = $row->kode_pt;
            $val[] = $row->nama_pt;
            $val[] = $row->alamat_pt;
            $val[] = $row->telepon_pt;

            // Kolom Gambar Logo (Menjaga style persis seperti markup CI4 milikmu)
            $val[] = '<img src="' . $logo . '" alt="Logo PT" class="rounded" style="max-width: 60px; height: auto;">';

            // Kolom Status (Menjaga style badge theme kamu)
            $val[] = ($row->status == 1)
                ? '<span class="badge rounded-pill bg-label-primary me-1">Active</span>'
                : '<span class="badge rounded-pill bg-label-warning me-1">Tidak Aktif</span>';

            // Kolom Aksi Tombol Edit (ganti) dan Hapus (hapus)
            // Menggunakan addslashes agar nama PT yang memiliki tanda kutip tunggal tidak merusak string JavaScript
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

        // 3. Kembalikan data dalam format JSON standar Laravel
        return response()->json(['data' => $data]);
    }

    public function ajaxAdd(Request $request)
    {
        // 1. Cek apakah ada file yang diunggah dan statusnya valid
        if (!$request->hasFile('file') || !$request->file('file')->isValid()) {
            return response()->json(['status' => "File logo tidak ditemukan. Silakan pilih file untuk diunggah."])
                ->header('X-CSRF-TOKEN', csrf_token());
        }

        // 2. Lakukan validasi input teks dan aturan file (MIME & Ukuran Maksimal 10MB)
        $validator = \Illuminate\Support\Facades\Validator::make($request->all(), [
            'file'   => 'required|file|mimes:jpeg,jpg,png|max:10240', // 10240 KB = 10 MB
            'kode'   => 'required',
            'nama'   => 'required',
            'alamat' => 'nullable',
            'tlp'    => 'nullable',
            'status' => 'required',
        ], [
            'file.mimes' => 'Hanya diperkenankan file gambar (JPG/JPEG/PNG)',
            'file.max'   => 'Hanya diperkenankan file di bawah 10 MB',
        ]);

        // Jika validasi gagal, langsung kembalikan pesan error pertama
        if ($validator->fails()) {
            return response()->json(['status' => $validator->errors()->first()])
                ->header('X-CSRF-TOKEN', csrf_token());
        }

        // 3. Jika validasi lolos, jalankan logika penyimpanan data
        $status = $this->simpanDengan($request);

        // 4. Kembalikan response berupa JSON beserta Token CSRF baru agar sinkron dengan iziToast kamu
        return response()->json(['status' => $status], 200)
            ->header('X-CSRF-TOKEN', csrf_token());
    }

    private function simpanDengan(Request $request)
    {
        try {
            $file = $request->file('file');

            // Generate nama file acak yang aman (seperti $file->getRandomName() di CI4)
            $fileName = $file->hashName();

            // Pindahkan file ke folder storage/app/public/logos
            $file->storeAs('logos', $fileName, 'public');

            // Simpan data ke database menggunakan Model Pt Laravel
            $pt = new Pt();
            $pt->kode_pt    = strip_tags($request->input('kode'));
            $pt->nama_pt    = strip_tags($request->input('nama'));
            $pt->alamat_pt  = strip_tags($request->input('alamat'));
            $pt->telepon_pt = strip_tags($request->input('tlp'));
            $pt->logo_pt    = $fileName;
            $pt->status     = strip_tags($request->input('status'));

            // id_pt (UUID), created_at, dan updated_at diisi otomatis oleh Laravel
            $isSaved = $pt->save();

            if ($isSaved) {
                return "Data tersimpan";
            } else {
                return "Data gagal tersimpan";
            }

            return "Data tersimpan";
        } catch (\Exception $e) {
            return "Data gagal tersimpan";
        }
    }
}
