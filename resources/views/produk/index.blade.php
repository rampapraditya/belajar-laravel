<!DOCTYPE html>
<html lang="id">

<head>
    <title>Daftar Produk</title>
</head>

<body>
    <h1>Kategori: {{ $kategori }}</h1>
    <ul>
        @foreach($daftarProduk as $produk)
        <li>{{ $produk }}</li>
        @endforeach
    </ul>
</body>

</html>