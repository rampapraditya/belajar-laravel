<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Users extends Model
{
    use HasUuids;

    // 1. Tentukan nama tabel secara eksplisit (karena jamak default Laravel mencari 'users')
    protected $table = 'users';

    // 2. Ubah primary key bawaan Laravel ke kolom 'idusers'
    protected $primaryKey = 'idusers';

    // 3. Beritahu Laravel bahwa primary key-nya adalah string (varchar)
    public $incrementing = false;
    protected $keyType = 'string';

    // 4. Daftarkan semua kolom yang boleh diisi (Mass Assignment) sesuai gambar
    protected $fillable = [
        'username',
        'pass',
        'nama',
        'email',
        'foto',
        'idakses',
        'id_pt',
        'suspend'
    ];

    // Relasi ke tabel akses
    public function akses()
    {
        return $this->belongsTo(Akses::class, 'idakses', 'idakses');
    }

    // Relasi ke tabel PT
    public function pt()
    {
        return $this->belongsTo(Pt::class, 'id_pt', 'id_pt');
    }

    
    /* 
      Catatan:
      - Kolom created_at dan updated_at bertipe datetime akan diisi otomatis oleh Laravel saat insert/update data.
      - Jika di kemudian hari kamu butuh autentikasi bawaan Laravel (Auth Guard), model ini tinggal disesuaikan extends-nya menjadi Authenticatable.
    */
}
