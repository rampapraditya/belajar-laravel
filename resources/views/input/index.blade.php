<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Input</title>
</head>

<body>
    <h1>Selamat Datang di Portal Input Data</h1>
    <hr>

    <h2>1. Formulir Pencarian (Metode GET)</h2>
    <form action="{{ url('/formulir/hasil-get') }}" method="GET">
        <input type="text" name="cari" placeholder="Ketik kata kunci pencarian..." required>
        <button type="submit">Cari Data via GET</button>
    </form>

    <br>
    <hr><br>

    
    <h2>2. Formulir Pendaftaran (Metode POST)</h2>
    <form action="{{ url('/formulir/hasil-post') }}" method="POST">
        @csrf

        <label>Nama Lengkap:</label><br>
        <input type="text" name="nama" required><br><br>

        <label>Alamat Email:</label><br>
        <input type="email" name="email" required><br><br>

        <button type="submit">Kirim Data via POST</button>
    </form>

    <br><hr><br>

    
    <h2>3. Pindah Halaman via Segmen URL (Gaya Parameter)</h2>
    
    <button>
        <a href="{{ url('/formulir/detail/12') }}" style="text-decoration: none; color: black;">
            Buka Detail ID: 12
        </a>
    </button>

</body>

</html>