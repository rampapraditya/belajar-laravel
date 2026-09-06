<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ProdukController;
use App\Http\Controllers\PindahHalaman;
use App\Http\Controllers\InputController;

Route::get('/', function () {
    return view('welcome');
});

Route::prefix('produk')->group(function () {
    Route::get('/', [ProdukController::class, 'index']);
    Route::get('/promo', [ProdukController::class, 'promo']);
});

// Route::get('/pindah', [PindahHalaman::class, 'index']);
Route::prefix('pindah')->group(function () {
    Route::get('/', [PindahHalaman::class, 'index']);
    Route::get('/detail', [PindahHalaman::class, 'detail']);
});

Route::prefix('formulir')->group(function () {
    Route::get('/', [InputController::class, 'index']);
    Route::get('/hasil-get', [InputController::class, 'prosesGet']);
    Route::post('/hasil-post', [InputController::class, 'prosesPost']);
    Route::get('/detail/{id}', [InputController::class, 'detail']);
});