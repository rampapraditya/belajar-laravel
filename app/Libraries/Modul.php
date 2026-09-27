<?php

namespace App\Libraries;

class Modul
{
    /**
     * Enkripsi password manual bawaan aplikasi lama.
     * Dibuat menjadi static agar bisa dipanggil langsung tanpa 'new Modul()'
     */
    public static function enkrip_pass(string $str): string
    {
        $kunci = '979a218e0632df2935317f98d47956c7';
        $hasil = "";
        $kunciLen = strlen($kunci);
        for ($i = 0; $i < strlen($str); $i++) {
            $karakter = substr($str, $i, 1);
            $kuncikarakter = substr($kunci, ($i % $kunciLen) - 1, 1);
            $karakter2 = chr(ord($karakter) + ord($kuncikarakter));
            $hasil .= $karakter2;
        }
        return urlencode(base64_encode($hasil));
    }

    /**
     * Dekripsi password manual bawaan aplikasi lama.
     * Dibuat menjadi static agar bisa dipanggil langsung tanpa 'new Modul()'
     */
    public static function dekrip_pass(string $str): string
    {
        $str2 = base64_decode(urldecode($str));
        $hasil = '';
        $kunci = '979a218e0632df2935317f98d47956c7';
        $kunciLen = strlen($kunci);
        for ($i = 0; $i < strlen($str2); $i++) {
            $karakter = substr($str2, $i, 1);
            $kuncikarakter = substr($kunci, ($i % $kunciLen) - 1, 1);
            $karakter2 = chr(ord($karakter) - ord($kuncikarakter));
            $hasil .= $karakter2;
        }
        return $hasil;
    }
}
