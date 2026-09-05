<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProdukController extends Controller
{
    public function index()
    {
        $data['kategori'] = 'Elektronik & Gadget';
        $data['daftarProduk'] = ['Laptop Gaming ASUS', 'Mouse Logitech G Pro', 'Keyboard Mechanical'];

        return view('produk/index', $data);
    }

    public function promo()
    {
        $data['judulPromo'] = 'Promo Spesial Hari Ini!';
        $data['diskon'] = 'Diskon hingga 50% untuk semua aksesoris!';

        return view('produk/promo', $data);
    }
}
