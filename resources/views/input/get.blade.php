<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input GET</title>
</head>

<body>
    <h1>Hasil Pencarian Anda (Metode GET)</h1>
    <p>Kata kunci yang Anda cari adalah: <strong>{{ $kataKunci }}</strong></p>

    <br>
    <a href="{{ url('/formulir') }}">← Kembali ke Halaman Utama</a>
</body>

</html>