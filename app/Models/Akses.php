<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Akses extends Model
{
    use HasUuids;

    // 1. Tentukan nama tabel secara eksplisit
    protected $table = 'akses';

    // 2. Ubah primary key bawaan Laravel ke kolom 'idakses'
    protected $primaryKey = 'idakses';

    // 3. Beritahu Laravel bahwa primary key-nya adalah string (varchar/UUID)
    public $incrementing = false;
    protected $keyType = 'string';

    // 4. Daftarkan kolom yang boleh diisi (Mass Assignment)
    protected $fillable = [
        'namaakses'
    ];

    // Kolom created_at dan updated_at bertipe datetime akan diisi otomatis oleh Laravel
}
