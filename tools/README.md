# Blind Bash Tools
Tools untuk instalasi [Blind Bash](https://github.com/FajarKim/blind-bash) di Aplikasi Termux.

# Penginstallan
Cukup jalankan file `install.sh`, atau gunakan perintah:

| Metode    | Perintah                                                                                                      |
| :-------- | :------------------------------------------------------------------------------------------------------------ |
| **curl**  | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh)"` |
| **wget**  | `bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh)"`  |
| **fetch** | `bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh)"` |

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
```text
$ wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh
$ bash install.sh
```

# Perintah
Perintah yang didukung:
* `blind-bash`: untuk mulai mengenskripsi file Bash.
* `bb-upgrade`: untuk mulai mengupdate/mengupgrade tools [Blind Bash](https://github.com/FajarKim/blind-bash).
* `bb-uninstall`: untuk menguninstall tools [Blind Bash](https://github.com/FajarKim/blind-bash) apabila telah diinstall di Aplikasi Termux.
