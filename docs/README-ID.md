![Blind Bash Logo](https://raw.githubusercontent.com/FajarKim/blind-bash/master/images/logo.png)
<div align="center">
    <a href="https://github.com/FajarKim/blind-bash"><img src="https://img.shields.io/github/languages/code-size/FajarKim/blind-bash?label=BZip2%20Shell%20Exec&style=plastic&logo=github&color=blue" alt="Blind Bash"></a>
    <a href="https://github.com/FajarKim/blind-bash/stargazers/"><img src="https://img.shields.io/github/stars/FajarKim/blind-bash?label=Star&style=plastic&color=red" alt="Stars"></a>
    <a href="https://github.com/FajarKim/blind-bash/network/members/"><img src="https://img.shields.io/github/forks/FajarKim/blind-bash?label=Fork&style=plastic&color=f5ff5e" alt="Forks"></a>
    <a href="https://github.com/FajarKim/blind-bash/issues?q=is%3Aopen+is%3Aissue/"><img src="https://img.shields.io/github/issues/FajarKim/blind-bash?label=Issue&style=plastic&color=a1b3ff" alt="Issues"></a>
    <a href="https://github.com/FajarKim/blind-bash/issues?q=is%3Aissue+is%3Aclosed/"><img src="https://img.shields.io/github/issues-closed/FajarKim/blind-bash?label=Issue&style=plastic&color=ffffff" alt="Issues"></a>
    <a href="https://github.com/FajarKim/blind-bash/watchers/"><img src="https://img.shields.io/github/watchers/FajarKim/blind-bash?label=Watch&style=plastic&color=1fe1f" alt="Whatchers"></a>
    <a href="https://github.com/FajarKim/blind-bash/pulls?q=is%3Aopen+is%3Apr/"><img src="https://img.shields.io/github/issues-pr/FajarKim/blind-bash?&label=Pull%20requests&style=plastic&color=971dff" alt="Pull-requests"></a>
    <a href="https://github.com/FajarKim/blind-bash/pulls?q=is%3Apr+is%3Aclosed/"><img src="https://img.shields.io/github/issues-pr-closed/FajarKim/blind-bash?&label=Pull%20requests&style=plastic&color=orange" alt="Pull-requests"></a>
    <a href="https://github.com/FajarKim/blind-bash/blob/master/LICENSE"><img src="https://img.shields.io/github/license/FajarKim/blind-bash?label=License&style=plastic&color=01ffc4&logo=gnu" alt="License"></a>
</div>

# Blind Bash
Sebuah alat yang digunakan untuk mengaburkan file skrip Bourne Again Shell (bash), sehingga tidak dapat dibaca 🛡️.

<details>
<summary>Terjemahan</summary>

- [🇬🇧 English (UK)](https://github.com/FajarKim/blind-bash/blob/master/README-EN.md)
- [🇫🇷 France](https://github.com/FajarKim/blind-bash/blob/master/README-FR.md)
- [🇰🇷 Korean](https://github.com/FajarKim/blind-bash/blob/master/README-KR.md)
</details>

# Petunjuk Penginstallan
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install coreutils xz-utils git -y`
- `$ git clone https://github.com/FajarKim/blind-bash`
- `$ cd blind-bash/tools`
- `$ ./install.sh` atau `$ bash install.sh`

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
```text
$ wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh
$ bash install.sh
```

# Petunjuk Penggunaan
Perintah yang didukung:
<table>
    <tr>
        <td><div align="center"><b>Perintah</b></div></td>
        <td><div align="center"><b>Keterangan</b></div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-h</code> atau <code>--help</code></div></td>
        <td><div align="left">Menampilkan bantuan untuk alat ini</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-v</code> atau <code>--version</code></div></td>
        <td><div align="left">Informasi versi keluaran terbaru</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-f</code> atau <code>--file</code></div></td>
        <td><div align="left">Mulai nama file yang diobfuscate</div></td>
    </tr>
<table>

Cara menjalankan alat ini:
### Contoh 1
```text
$ blind-bash.sh -f FILE
```
atau
```text
$ blind-bash.sh --file FILE
```
### Contoh 2
```text
$ blind-bash.sh -f FILE1 FILE2 FILE3...
```
atau
```text
$ blind-bash.sh --file FILE1 FILE2 FILE3...
```
### Catatan
Semakin banyak jumlah baris dalam sebuah file, semakin lama waktu yang dibutuhkan untuk mengenkripsi.

# Kontak
Silahkan hubungi kontak saya dibawah ini jika ada masalah atau pertanyaan mengenai alat ini. Jangan lupa untuk follow ya!
<div align="center">
    <a href="https://www.facebook.com/fajarrkim"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/facebook_logo.png" alt="Facebook" width="35"></a>
    &ensp;
    <a href="https://www.instagram.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/instagram_logo.png" alt="Instagram" width="35"></a>
    &ensp;
    <a href="https://wa.me/6285659850910?text=Hi"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/whatsapp_logo.png" alt="WhatsApp" width="35"></a>
    &ensp;
    <a href="https://t.me/FajarThea"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/telegram_logo.png" alt="Telegram" width="35"></a>
    &ensp;
    <a href="https://www.twitter.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/twitter_logo.png" alt="Twitter" width="35"></a>
    &ensp;
    <a href="mailto:fajarrkim@gmail.com"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/gmail_logo.png" alt="Gmail" width="35"></a>
</div>

# Donasi
Bagi orang baik yang mau berdonasi untuk perkembangan dan kemajuan akun ini, bisa klik tautan di bawah ini! Saya berterima kasih banyak kepada yang mau berdonasi 😊😊😊
<div align="left">
    <a href="https://github.com/sponsors/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_github.png" alt="GitHub Sponsor" width="250"></a>
    <a href="https://paypal.me/agusbirawan/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_paypal.png" alt="PayPal Donate" width="250"></a>
    <a href="https://trakteer.id/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_trakteer.png" alt="Trakteer.id Donate" width="250"></a>
</div>