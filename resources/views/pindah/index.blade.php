<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Utama</title>
</head>
<body>
    <h1>Halaman Utama</h1>
    <hr>
    <button>
        <a href="{{ url('/pindah/detail') }}" style="text-decoration: none; color: black;">Pindah Halaman Model 1</a>
    </button>
    
    <button onclick="pindahHalaman()">Pindah Halaman Model 2</button> 

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function pindahHalaman() {
            window.location.href = "{{ url('/pindah/detail') }}";
        }
    </script>
</body>
</html>