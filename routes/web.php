<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ProdukController;

Route::get('/', function () {
    return view('welcome');
});

Route::prefix('produk')->group(function () {
    Route::get('/', [ProdukController::class, 'index']);
    Route::get('/promo', [ProdukController::class, 'promo']);
});