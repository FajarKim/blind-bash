<div align="center">
  <img src="https://raw.githubusercontent.com/FajarKim/blind-bash/master/images/logo.png" alt="Blind Bash Logo" width="300"/>
  <h2>Blind Bash</h2>
  <p>Alat untuk mengaburkan skrip bash 🛡️</p>
  <p><a href="https://github.com/FajarKim/blind-bash/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml">Laporkan Bug</a> · <a href="https://github.com/FajarKim/blind-bash/issues/new?assignees=&labels=enhancement&projects=&template=feature_request.yml">Ajukan Fitur</a> · <a href="https://github.com/FajarKim/blind-bash/discussions/new?category=q-a">Tanya Jawab</a></p>
  <p><a href="/docs/README-ID.md">Indonesia</a> · <a href="/docs/README-KR.md">한국어</a> · <a href="/docs/README-FR.md">Français</a></p>
  <a href="https://github.com/FajarKim/blind-bash/releases"><img src="https://custom-icon-badges.demolab.com/github/v/tag/FajarKim/blind-bash?label=Version&labelColor=302d41&color=f2cdcd&logoColor=d9e0ee&logo=tag&style=for-the-badge" alt="Version"/></a>
  <a href="https://github.com/FajarKim/blind-bash/stargazers/"><img src="https://custom-icon-badges.demolab.com/github/stars/FajarKim/blind-bash?label=Stars&logo=star&labelColor=302d41&color=c9cbff&logoColor=d9e0ee&style=for-the-badge" alt="Stars"></a>
  <a href="https://github.com/FajarKim/blind-bash/network/members/"><img src="https://custom-icon-badges.demolab.com/github/forks/FajarKim/blind-bash?label=Forks&logo=fork&labelColor=302d41&color=b5e8e0&logoColor=d9e0ee&style=for-the-badge" alt="Forks"></a>
  <a href="https://github.com/FajarKim/blind-bash/issues"><img src="https://custom-icon-badges.demolab.com/github/issues/FajarKim/blind-bash?label=Issues&labelColor=302d41&color=f5a97f&logoColor=d9e0ee&logo=issue&style=for-the-badge" alt="Issues"/></a>
  <a href="https://github.com/FajarKim/blind-bash/pull"><img src="https://custom-icon-badges.demolab.com/github/issues-pr/FajarKim/blind-bash?&label=Pull%20Requests&labelColor=302d41&color=ddb6f2&logoColor=d9e0ee&logo=git-pull-request&style=for-the-badge" alt="PRs"/></a>
  <a href="https://github.com/FajarKim/blind-bash/archive/refs/heads/master.zip"><img src="https://custom-icon-badges.demolab.com/github/languages/code-size/FajarKim/blind-bash?label=Download&logo=download&labelColor=302d41&color=b7bdf8&logoColor=d9e0ee&style=for-the-badge" alt="Download .zip"></a>
</div>

# Deskripsi
Blind Bash adalah alat serbaguna yang dirancang untuk mengaburkan skrip Bash, meningkatkan keamanan skrip dengan membuatnya lebih sulit untuk diuraikan.  Skrip ini menggabungkan string acak dan enkripsi variabel, membuat proses kebingungan lebih kuat.

## Fitur Utama
- **Teknik Pengacakan:** Alat ini menggabungkan string acak dan pembuatan variabel, sehingga meningkatkan kompleksitas skrip yang dikaburkan dan membuatnya lebih tahan terhadap rekayasa balik.
 - **Ramah Pengguna:** Blind Bash dirancang dengan mempertimbangkan kesederhanaan, memberikan pengguna antarmuka yang mudah dipahami untuk mengaburkan skrip Bash.
 - **Pemeriksaan Peningkatan:** Alat ini menyertakan fitur untuk memeriksa pembaruan, memastikan pengguna memiliki Blind Bash versi terbaru dan berpotensi mendapatkan manfaat dari perbaikan bug atau fungsi tambahan.
 - **Keamanan yang Ditingkatkan:** Blind Bash secara signifikan meningkatkan keamanan skrip Bash dengan mengaburkan konten Anda, sehingga mengurangi kerentanan terhadap akses tidak sah atau gangguan.
 - **Enkripsi Acak:** Alat ini menawarkan mode pengaburan yang berbeda, memungkinkan kompleksitas skrip yang dikaburkan dan membuatnya lebih tahan terhadap rekayasa balik.

> [!NOTE]
> Semakin banyak jumlah baris dalam sebuah file, semakin lama waktu yang dibutuhkan untuk mengenkripsi.

> [!WARNING]
> Blind Bash mungkin tidak kompatibel dengan beberapa sistem atau perangkat.

# Petunjuk Penginstalan
- ```shell
  pkg update -y && pkg upgrade -y
  ```
- ```shell
  pkg install coreutils xz-utils git -y
  ```
- ```shell
  git clone https://github.com/FajarKim/blind-bash
  ```
- ```shell
  cd blind-bash
  ```

Kemudian, jalankan file `blind-bash.sh` untuk mulai mengenkripsi file shell.
- ```shell
  bash blind-bash.sh --help
  ```

Jika Anda ingin menginstalnya ke folder `$PATH`, cukup jalankan file `install.sh` yang ada di folder tools.
- ```shell
  tools/install.sh
  ```
  atau
- ```shell
  cd tools && bash install.sh
  ```

Jika berhasil terinstal, jalankan perintah:
- ```shell
  blind-bash --help
  ```

Bisa juga dengan menggunakan cara ini:
<table>
  <tr>
    <td><div align="center"><b>Metode</b></div></td>
    <td><div align="center"><b>Perintah</b></div></td>
  </tr>
  <tr>
    <td><div align="center"><b>curl</b></div></td>
    <td>
      <div align="left">
        <pre class="language-shell"><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh)"</code></pre>
      </div>
    </td>
  </tr>
  <tr>
    <td><div align="center"><b>wget</b></div></td>
    <td>
      <div align="left">
        <pre class="language-shell"><code>bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh)"</code></pre>
      </div>
    </td>
  </tr>
  <tr>
    <td><div align="center"><b>fetch</b></div></td>
    <td>
      <div align="left">
        <pre class="language-shell"><code>bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh)"</code></pre>
      </div>
    </td>
  </tr>
</table>

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
- ```shell
  wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh
  ```
- ```shell
  bash install.sh
  ```

# Petunjuk Penggunaan
Alat ini diprogram untuk bisa dijalankan dengan beberapa perintah. Perintah yang didukung:
<table>
  <tr>
    <td><div align="center"><b>Perintah</b></div></td>
    <td><div align="center"><b>Deskripsi</b></div></td>
  </tr>
  <tr>
    <td><div align="left"><code>-h</code> atau <code>--help</code></div></td>
    <td><div align="left">Menampilkan bantuan alat ini.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>-v</code> atau <code>--version</code></div></td>
    <td><div align="left">Informasi versi keluaran terbaru.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>-f</code> atau <code>--file</code></div></td>
    <td><div align="left">Memulai nama file yang dikaburkan.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>--upgrade</code></div></td>
    <td><div align="left">Tingkatkan versi alat ini.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>--uninstall</code></div></td>
    <td><div align="left">Mencopot pemasangan alat ini.</div></td>
  </tr>
</table>

Cara menjalankan alat ini:
#### Contoh 1
```shell
blind-bash.sh -f FILE
```
atau
```shell
blind-bash.sh --file FILE
```
#### Contoh 2
Jika ingin mengenkripsi lebih dari 1 file dalam waktu yang sama, Anda bisa lakukan itu.
```shell
blind-bash.sh -f FILE1 FILE2 FILE3 etc...
```
atau
```shell
blind-bash.sh --file FILE1 FILE2 FILE3 etc...
```

## Lisensi
Blind Bash dirilis di bawah lisensi AGPL-3.0, yang memberikan izin berikut:
- Penggunaan komersial
- Modifikasi
- Distribusi
- Penggunaan paten
- Penggunaan pribadi

Untuk bahasa yang lebih lanjut, lihat [LISENSI](/LICENSE).

## Media Sosial dan Kontak
<div align="center">
  <a href="https://facebook.com/fajarrkim"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/facebook-icon.svg" alt="Facebook"></a>
  <a href="https://instagram.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/instagram-icon.svg" alt="Instagram"></a>
  <a href="https://wa.me/6285659850910?text=Hi"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/whatsapp-icon.svg" alt="WhatsApp"></a>
  <a href="https://t.me/FajarThea"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/telegram-icon.svg" alt="Telegram"></a>
  <a href="https://twitter.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/twitter-x-icon.svg" alt="Twitter"></a>
  <a href="https://tiktok.com/@fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/tiktok-icon.svg" alt="TikTok"></a>
  <a href="https://youtube.com/@FajarHacker"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/youtube-icon.svg" alt="YouTube"></a>
  <a href="https://m.me/fajarrkim"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/messenger-icon.svg" alt="Messenger"></a>
  <a href="mailto:fajarrkim@gmail.com"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/mail-icon.svg" alt="Email"></a>
  <p>Ikuti media sosial saya!</p>
</div>

# Donasi
Suka proyek ini? Harap pertimbangkan untuk berdonasi untuk membantu meningkatkannya!
<div align="left">
  <a href="https://github.com/sponsors/FajarKim/"><img src="https://img.shields.io/badge/GitHub-Sponsor-blue?labelColor=302d41&color=f5bde6&logo=github&logoColor=d9e0ee&style=for-the-badge" alt="GitHub Sponsor"></a>
  <a href="https://paypal.me/agusbirawan/"><img src="https://img.shields.io/badge/PayPal-Donate-blue?labelColor=302d41&color=f4dbd6&logo=paypal&logoColor=d9e0ee&style=for-the-badge" alt="PayPal Donate"></a>
  <a href="https://buymeacoffee.com/fajarkim/"><img src="https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-blue?labelColor=302d41&color=eed49f&logo=buymeacoffee&logoColor=d9e0ee&style=for-the-badge" alt="Buy Me a Coffee"></a>
  <a href="https://trakteer.id/FajarKim/"><img src="https://custom-icon-badges.demolab.com/badge/Trakteer-Donate-blue?labelColor=302d41&color=ed8796&logo=trakteerid&logoColor=d9e0ee&style=for-the-badge" alt="Trakteer.id Donate"></a>
</div>

Apakah Anda mempertimbangkan untuk mendukung proyek ini dengan menyumbang kepada saya? TOLONG JANGAN!!

Silakan kunjungi [tautan ini](https://fajarkim.github.io/donate) dan berikan donasi kecil untuk membantu orang-orang yang membutuhkan. Sumbangan kecil akan sangat bermanfaat. ❤️

## Alat Serupa Lainnya
#### BZip2 Shell Exec
[![BZip2 Shell Exec](https://github-readme-stats.vercel.app/api/pin?username=FajarKim&repo=bz2-shell&show_owner=true&title_color=8bd5ca&text_color=cad3f5&icon_color=c6a0f6&bg_color=24273a)](https://github.com/FajarKim/bz2-shell)
#### LZip Shell Exec
[![LZip Shell Exec](https://github-readme-stats.vercel.app/api/pin?username=FajarKim&repo=lzip-shell&show_owner=true&title_color=8bd5ca&text_color=cad3f5&icon_color=c6a0f6&bg_color=24273a)](https://github.com/FajarKim/lzip-shell)

<div align="center">
  <img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/line.svg?sanitize=true"/>
</div>

<p align="center">Dibuat dengan ❤️ dan Shell</p>
<p align="center">Copyright © 2022-sekarang Rangga Fajar Oktariansyah</p>
<div align="center">
  <a href="LICENSE"><img src="https://custom-icon-badges.demolab.com/github/license/FajarKim/blind-bash?label=License&labelColor=302d41&color=91d7e3&logo=law&logoColor=d9e0ee&style=for-the-badge" alt="License"></a>
</div>
