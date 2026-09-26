<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Pt extends Model
{
    use HasUuids; // Mengaktifkan otomatisasi UUID bawaan Laravel

    // 1. Tentukan nama tabel secara manual (karena huruf kapital 'PT')
    protected $table = 'pt';

    // 2. Tentukan kolom primary key yang memuat UUID tersebut
    protected $primaryKey = 'id_pt';

    // 3. Tentukan kolom yang boleh diisi (Mass Assignment)
    protected $fillable = [
        'kode_pt', 
        'nama_pt', 
        'alamat_pt', 
        'telepon_pt', 
        'logo_pt', 
        'status'
    ];

}

