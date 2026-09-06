<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input POST</title>
</head>
<body>
    <h1>Data yang Anda Kirim (Metode POST)</h1>
    <p>Nama Lengkap: <strong>{{ $namaUser }}</strong></p>
    <p>Alamat Email: <strong>{{ $emailUser }}</strong></p>

    <br>
    <a href="{{ url('/formulir') }}">← Kembali ke Halaman Utama</a>
</body>
</html>