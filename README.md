# Belajar Laravel (Proyek Pertama)

Proyek ini adalah langkah awal pembelajaran framework Laravel menggunakan lingkungan pengembangan Windows dan WampServer (WAMP). Dokumen ini mencatat solusi instalasi serta dasar-dasar pembuatan fitur menggunakan struktur MVC (Route, Controller, View).

## Spesifikasi Environment
*   **Sistem Operasi:** Windows
*   **Web Server & Database:** WampServer (WAMP)
*   **Dependency Manager:** Composer

## Masalah Instalasi pada Windows
Saat menjalankan perintah instalasi standar `composer create-project laravel/laravel`, proses gagal di tengah jalan dengan pesan error:
```text
error: invalid path 'tests/fixtures/env/nul.env'
```
**Penyebab:** Windows melarang penggunaan kata `nul` sebagai nama file atau folder (*reserved keyword*). Hal ini menyebabkan kegagalan pembuatan folder `vendor` dan file autoloader PHP.

## Solusi Instalasi (Clean Install)
Untuk menghindari error tersebut, paket pengujian (*development dependencies*) yang mengandung file bermasalah harus dilewati dengan menambahkan argumen `--no-dev`:

1.  Buka Command Prompt (CMD) dan masuk ke direktori web root WAMP:
    ```bash
    cd C:\wamp64\www
    ```
2.  Unduh proyek Laravel baru tanpa paket testing:
    ```bash
    composer create-project laravel/laravel belajar-laravel --no-dev
    ```
3.  Masuk ke dalam folder proyek yang baru dibuat:
    ```bash
    cd belajar-laravel
    ```
4.  Jalankan server pengembangan lokal bawaan Laravel:
    ```bash
    php artisan serve
    ```
5.  Buka browser dan akses URL berikut untuk memastikan aplikasi berjalan:
    http://127.0.0.1:8000

### Solusi Perbaikan (Tanpa Unduh Ulang)
Jika proyek sudah terlanjur diunduh menggunakan perintah standar dan mengalami error, jalankan perintah ini berurutan di dalam folder proyek:
```bash
# 1. Unduh ulang library utama yang kurang
composer install --no-dev

# 2. Salin file konfigurasi environment
copy .env.example .env

# 3. Buat kunci keamanan aplikasi
php artisan key:generate
```

## Alur Implementasi MVC (Route, Controller, View)

### 1. Cara Membuat Controller Baru
Pembuatan file Controller dilakukan secara otomatis menggunakan perintah bawaan Laravel (Artisan) melalui CMD di dalam direktori proyek utama:
```bash
php artisan make:controller ProdukController
```


## Cara Menjalankan dan Menguji Aplikasi
1. Aktifkan server pengembang lokal via CMD:
   ```bash
   php artisan serve
   ```
