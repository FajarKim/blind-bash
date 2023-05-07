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
Un outil utilisé pour obscurcir les fichiers de script du Bourne Again Shell (bash), les rendant illisibles 🛡️.

<details>
<summary>Traduction</summary>

- [🇬🇧 English (UK)](https://github.com/FajarKim/blind-bash/blob/master/README-KR.md)
- [🇮🇩 Indonesian](https://github.com/FajarKim/blind-bash)
- [🇰🇷 Korean](https://github.com/FajarKim/blind-bash/blob/master/README-KR.md)
</details>

# Instructions d'Installation
## Termux
### Méthode 1
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install coreutils xz-utils git -y`
- `$ git clone https://github.com/FajarKim/blind-bash`
- `$ cd blind-bash/tools/Termux`
- `$ ./install.sh` ou `$ bash install.sh`
### Méthode 2
<table>
    <tr>
        <td><div align="center"><b>Méthode</b></div></td>
        <td><div align="center"><b>Commande</b></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>curl</b></div></td>
        <td><div align="left"><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>wget</b></div></td>
        <td><div align="left"><code>bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>fetch</b></div></td>
        <td><div align="left"><code>bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh)"</code></div></td>
    </tr>
<table>

Vous pouvez également télécharger le script `install.sh` et l'exécuter ensuite:
```text
$ wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh
$ bash install.sh
```
## Linux
### Méthode 1
- `$ apt update -y && apt upgrade -y`
- `$ apt install coreutils xz-utils git -y`
- `$ git clone https://github.com/FajarKim/blind-bash`
- `$ cd blind-bash/tools/Linux`
- `$ ./install.sh` ou `$ bash install.sh`
### Méthode 2
<table>
    <tr>
        <td><div align="center"><b>Méthode</b></div></td>
        <td><div align="center"><b>Commande</b></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>curl</b></div></td>
        <td><div align="left"><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>wget</b></div></td>
        <td><div align="left"><code>bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>fetch</b></div></td>
        <td><div align="left"><code>bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh)"</code></div></td>
    </tr>
<table>

Vous pouvez également télécharger le script `install.sh` et l'exécuter ensuite:
```text
$ wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh
$ bash install.sh
```

# Instructions d'Utilisation
Commande supportées:
<table>
    <tr>
        <td><div align="center"><b>Commande</b></div></td>
        <td><div align="center"><b>Description</b></div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-h</code> ou <code>--help</code></div></td>
        <td><div align="left">Afficher cette aide</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-v</code> ou <code>--version</code></div></td>
        <td><div align="left">Informations sur la version de sortie</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-f</code> ou <code>--file</code></div></td>
        <td><div align="left">Démarrage du nom des fichiers obfusqués</div></td>
    </tr>
<table>

Comment utiliser cet outil:
### Exemple 1
```text
$ blind-bash.sh -f FILE
```
ou
```text
$ blind-bash.sh --file FILE
```
### Exemple 2
```text
$ blind-bash.sh -f FILE1 FILE2 FILE3...
```
ou
```text
$ blind-bash.sh --file FILE1 FILE2 FILE3...
```
### Remarques
Plus il y a de lignes dans un fichier, plus il faudra de temps pour le crypter.

# Contacter
N'hésitez pas à me contacter ci-dessous si vous avez des problèmes ou des questions concernant cet outil. N'oubliez pas de me suivre!
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

# Faire un Don
Pour les personnes aimables qui veulent faire un don pour le développement et la progression de ce compte, veuillez cliquer sur le lien ci-dessous! Je vous remercie beaucoup pour ceux qui veulent faire un don 😊😊😊
<div align="left">
    <a href="https://github.com/sponsors/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_github.png" alt="GitHub Sponsor" width="250"></a>
    <a href="https://paypal.me/agusbirawan/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_paypal.png" alt="PayPal Donate" width="250"></a>
    <a href="https://trakteer.id/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_trakteer.png" alt="Trakteer.id Donate" width="250"></a>
</div>