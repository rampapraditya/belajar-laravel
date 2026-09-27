<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Identitas extends Model
{
    use HasUuids; // Opsional: Aktifkan jika 'kode' diisi otomatis pakai UUID oleh Laravel

    // 1. Tentukan nama tabel secara eksplisit (sesuai nama tabel di databasemu)
    protected $table = 'identitas';

    // 2. Ubah primary key bawaan Laravel ke kolom 'kode'
    protected $primaryKey = 'kode';

    // 3. Beritahu Laravel bahwa key tersebut adalah string, bukan auto-increment integer
    public $incrementing = false;
    protected $keyType = 'string';

    // 4. Daftarkan semua kolom yang boleh diisi (Mass Assignment) sesuai gambar
    protected $fillable = [
        'namaapp',
        'organisasi',
        'alamat',
        'kdpos',
        'tlp',
        'email',
        'logo'
    ];

    // Jika tabel kamu tidak memiliki kolom created_at dan updated_at, aktifkan baris di bawah ini:
    public $timestamps = false;
}
