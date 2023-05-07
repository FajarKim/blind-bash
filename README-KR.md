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
Bourne Again Shell (bash) 스크립트 파일을 난독화하여 읽을 수 없게 만드는 데 사용되는 도구 🛡️.

<details>
<summary>번역</summary>

- [🇬🇧 English (UK)](https://github.com/FajarKim/blind-bash/blob/master/README-EN.md)
- [🇫🇷 France](https://github.com/FajarKim/blind-bash/blob/master/README-FR.md)
- [🇮🇩 Indonesian](https://github.com/FajarKim/blind-bash)
</details>

# 설치 지침
## Termux
### 방법 1
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install coreutils xz-utils git -y`
- `$ git clone https://github.com/FajarKim/blind-bash`
- `$ cd blind-bash/tools/Termux`
- `$ ./install.sh` 또는 `$ bash install.sh`
### 방법 2
<table>
    <tr>
        <td><div align="center"><b>메소드</b></div></td>
        <td><div align="center"><b>명령어</b></div></td>
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

또는 먼저 `install.sh` 스크립트를 다운로드한 후 실행할 수 있습니다:
```text
$ wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Termux/install.sh
$ bash install.sh
```
## Linux
### 방법 1
- `$ apt update -y && apt upgrade -y`
- `$ apt install coreutils xz-utils git -y`
- `$ git clone https://github.com/FajarKim/blind-bash`
- `$ cd blind-bash/tools/Linux`
- `$ ./install.sh` 또는 `$ bash install.sh`
### 방법 2
<table>
    <tr>
        <td><div align="center"><b>메소드</b></div></td>
        <td><div align="center"><b>명령어</b></div></td>
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

또는 먼저 `install.sh` 스크립트를 다운로드한 후 실행할 수 있습니다:
```text
$ wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/Linux/install.sh
$ bash install.sh
```

# 사용 지침
지원되는 명령어:
<table>
    <tr>
        <td><div align="center"><b>명령어</b></div></td>
        <td><div align="center"><b>설명</b></div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-h</code> 또는 <code>--help</code></div></td>
        <td><div align="left">이 도움말 표시</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-v</code> 또는 <code>--version</code></div></td>
        <td><div align="left">출력 버전 정보</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-f</code> 또는 <code>--file</code></div></td>
        <td><div align="left">난독화된 파일 이름 시작</div></td>
    </tr>
<table>

이 도구를 실행하는 방법:
### 예제 1
```text
$ blind-bash.sh -f FILE
```
또는
```text
$ blind-bash.sh --file FILE
```
### 예제 2
```text
$ blind-bash.sh -f FILE1 FILE2 FILE3...
```
또는
```text
$ blind-bash.sh --file FILE1 FILE2 FILE3...
```
### 노트
파일의 라인 수가 많을수록 암호화하는 데 더 오래 걸립니다.

# 연락처
이 도구와 관련하여 문제나 궁금한 점이 있으면 아래 연락처로 문의해 주세요. 저를 팔로우하는 것을 잊지 마세요!
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

# 기부하기
이 계정의 개발과 발전을 위해 기부하고 싶은 친절한 분들은 아래 링크를 클릭해 주세요! 기부해주시는 분들께 진심으로 감사드립니다 😊😊😊
<div align="left">
    <a href="https://github.com/sponsors/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_github.png" alt="GitHub Sponsor" width="250"></a>
    <a href="https://paypal.me/agusbirawan/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_paypal.png" alt="PayPal Donate" width="250"></a>
    <a href="https://trakteer.id/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_trakteer.png" alt="Trakteer.id Donate" width="250"></a>
</div>