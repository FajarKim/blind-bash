# Blind Bash Tools
Tools untuk instalasi [Blind Bash](https://github.com/TeamThea/blind-bash) di Aplikasi Termux.

# Penginstallan
Cukup jalankan file `install.sh`, atau gunakan perintah:

Method | Command 
-------|--------------------------------------------
curl   | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/TeamThea/blind-bash/master/tools/install.sh)"`
wget   | `bash -c "$(wget -O- https://raw.githubusercontent.com/TeamThea/blind-bash/master/tools/install.sh)"`
fetch  | `bash -c "$(fetch -o - https://raw.githubusercontent.com/TeamThea/blind-bash/master/tools/install.sh)"`

# Perintah
Perintah yang didukung:
* `blind-bash`: untuk mulai mengenskripsi file Bash.
* `bb-update`: untuk mulai mengupdate tools [Blind Bash](https://github.com/TeamThea/blind-bash).
* `bb-uninstall`: untuk menguninstall tools [Blind Bash](https://github.com/TeamThea/blind-bash) apabila telah diinstall di Aplikasi Termux.
