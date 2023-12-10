<div align="center">
  <img src="https://raw.githubusercontent.com/FajarKim/blind-bash/master/images/logo.png" alt="Blind Bash Logo" width="300"/>
  <h2>Blind Bash</h2>
  <p>난독화된 bash 스크립트용 도구 🛡️</p>
  <p><a href="https://github.com/FajarKim/blind-bash/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml">버그를 제보하기</a> · <a href="https://github.com/FajarKim/blind-bash/issues/new?assignees=&labels=enhancement&projects=&template=feature_request.yml">기능 요청</a> · <a href="https://github.com/FajarKim/blind-bash/discussions/new?category=q-a">물어보다</a></p>
  <p><a href="/docs/README-ID.md">Indonesia</a> · <a href="/docs/README-KR.md">한국어</a> · <a href="/docs/README-FR.md">Français</a></p>
  <a href="https://github.com/FajarKim/blind-bash/releases"><img src="https://custom-icon-badges.demolab.com/github/v/tag/FajarKim/blind-bash?label=Version&labelColor=302d41&color=f2cdcd&logoColor=d9e0ee&logo=tag&style=for-the-badge" alt="Version"/></a>
  <a href="https://github.com/FajarKim/blind-bash/stargazers/"><img src="https://custom-icon-badges.demolab.com/github/stars/FajarKim/blind-bash?label=Stars&logo=star&labelColor=302d41&color=c9cbff&logoColor=d9e0ee&style=for-the-badge" alt="Stars"></a>
  <a href="https://github.com/FajarKim/blind-bash/network/members/"><img src="https://custom-icon-badges.demolab.com/github/forks/FajarKim/blind-bash?label=Forks&logo=fork&labelColor=302d41&color=b5e8e0&logoColor=d9e0ee&style=for-the-badge" alt="Forks"></a>
  <a href="https://github.com/FajarKim/blind-bash/issues"><img src="https://custom-icon-badges.demolab.com/github/issues/FajarKim/blind-bash?label=Issues&labelColor=302d41&color=f5a97f&logoColor=d9e0ee&logo=issue&style=for-the-badge" alt="Issues"/></a>
  <a href="https://github.com/FajarKim/blind-bash/pull"><img src="https://custom-icon-badges.demolab.com/github/issues-pr/FajarKim/blind-bash?&label=Pull%20Requests&labelColor=302d41&color=ddb6f2&logoColor=d9e0ee&logo=git-pull-request&style=for-the-badge" alt="PRs"/></a>
  <a href="https://github.com/FajarKim/blind-bash/archive/refs/heads/master.zip"><img src="https://custom-icon-badges.demolab.com/github/languages/code-size/FajarKim/blind-bash?label=Download&logo=download&labelColor=302d41&color=b7bdf8&logoColor=d9e0ee&style=for-the-badge" alt="Download .zip"></a>
</div>

# 설명
Blind Bash는 Bash 스크립트를 난독화하는 다재다능한 도구로, 스크립트 보안을 향상시켜 해독이 더 어려워지도록 합니다. 이 스크립트는 난수 문자열 및 변수 암호화를 통합하여 난독화 과정을 더 견고하게 만듭니다.

## 주요 기능
- **난수화 기술:** 이 도구는 난수 문자열 및 변수 생성을 통합하여 난독화된 스크립트의 복잡성을 향상시키고 역공학에 대한 저항성을 높입니다.
- **사용자 친화적:** Blind Bash는 사용자가 Bash 스크립트를 난독화하기 위한 쉽게 이해할 수 있는 인터페이스를 제공하기 위해 간단하게 설계되었습니다.
- **업그레이드 확인:** 이 도구에는 업데이트를 확인하는 기능이 포함되어 있어 사용자가 Blind Bash의 최신 버전을 사용하고 버그 수정이나 추가 기능을 활용할 수 있도록 합니다.
- **향상된 보안:** Blind Bash는 Bash 스크립트의 보안을 크게 향상시켜 내용을 난독화하여 무단 접근이나 조작에 노출될 가능성을 줄입니다.
- **랜덤 암호화:** 이 도구는 다양한 난독화 모드를 제공하여 난독화된 스크립트의 복잡성을 높이고 역공학에 대한 저항성을 높입니다.

> [!NOTE]
> 파일의 라인 수가 많을수록 암호화하는 데 더 많은 시간이 걸릴 수 있습니다.

> [!WARNING]
> Blind Bash는 일부 시스템이나 장치와 호환되지 않을 수 있습니다.

# 설치 지침
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

그런 다음 `blind-bash.sh` 파일을 실행하여 셸 파일 암호화를 시작합니다.
- ```shell
  bash blind-bash.sh --help
  ```

`$PATH` 폴더에 설치하려면 `tools` 폴더에 있는 `install.sh` 파일을 실행하세요.
- ```shell
  tools/install.sh
  ```
  또는
- ```shell
  cd tools && bash install.sh
  ```

성공적으로 설치되면 다음 명령을 실행합니다:
- ```shell
  blind-bash --help
  ```

다음 방법을 사용할 수도 있습니다:
<table>
  <tr>
    <td><div align="center"><b>메소드</b></div></td>
    <td><div align="center"><b>명령어</b></div></td>
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

또는 먼저 `install.sh` 스크립트를 다운로드한 후 실행할 수 있습니다:
- ```shell
  wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh
  ```
- ```shell
  bash install.sh
  ```

# 사용 지침
이 도구는 여러 명령으로 실행되도록 프로그래밍되어 있습니다. 지원되는 명령:
<table>
  <tr>
    <td><div align="center"><b>명령어</b></div></td>
    <td><div align="center"><b>설명</b></div></td>
  </tr>
  <tr>
    <td><div align="left"><code>-h</code> 또는 <code>--help</code></div></td>
    <td><div align="left">이 도움말 표시.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>-v</code> 또는 <code>--version</code></div></td>
    <td><div align="left">출력 버전 정보.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>-f</code> 또는 <code>--file</code></div></td>
    <td><div align="left">Starting obfuscated files name.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>--upgrade</code></div></td>
    <td><div align="left">이 도구의 버전을 업그레이드하세요.</div></td>
  </tr>
  <tr>
    <td><div align="left"><code>--uninstall</code></div></td>
    <td><div align="left">이 도구 제거.</div></td>
  </tr>
</table>

이 도구를 실행하는 방법:
#### 예제 1
```shell
blind-bash.sh -f FILE
```
또는
```shell
blind-bash.sh --file FILE
```
#### 예제 2
동시에 2개 이상의 파일을 암호화하고 싶다면 그렇게 할 수 있습니다.
```shell
blind-bash.sh -f FILE1 FILE2 FILE3 etc...
```
또는
```shell
blind-bash.sh --file FILE1 FILE2 FILE3 etc...
```

## 특허
Blind Bash은 다음 권한을 부여하는 AGPL-3.0 라이선스에 따라 출시됩니다:
- 상업적 사용
- 수정
- 분포
- 특허사용
- 개인적인 사용

더 복잡한 언어에 대해서는 [특허](/LICENSE)를 참조하세요.

## 소셜 미디어 및 연락처
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
  <p>내 소셜 미디어를 팔로우하세요!</p>
</div>

# 기부하기
프로젝트가 마음에 드시나요? 개선을 위해 기부하는 것을 고려해 보세요!
<div align="left">
  <a href="https://github.com/sponsors/FajarKim/"><img src="https://img.shields.io/badge/GitHub-Sponsor-blue?labelColor=302d41&color=f5bde6&logo=github&logoColor=d9e0ee&style=for-the-badge" alt="GitHub Sponsor"></a>
  <a href="https://paypal.me/agusbirawan/"><img src="https://img.shields.io/badge/PayPal-Donate-blue?labelColor=302d41&color=f4dbd6&logo=paypal&logoColor=d9e0ee&style=for-the-badge" alt="PayPal Donate"></a>
  <a href="https://buymeacoffee.com/fajarkim/"><img src="https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-blue?labelColor=302d41&color=eed49f&logo=buymeacoffee&logoColor=d9e0ee&style=for-the-badge" alt="Buy Me a Coffee"></a>
  <a href="https://trakteer.id/FajarKim/"><img src="https://custom-icon-badges.demolab.com/badge/Trakteer-Donate-blue?labelColor=302d41&color=ed8796&logo=trakteerid&logoColor=d9e0ee&style=for-the-badge" alt="Trakteer.id Donate"></a>
</div>

나에게 기부하여 프로젝트를 지원하는 것을 고려하고 계십니까? 이러지마 제발!!

[이 링크](https://fajarkim.github.io/donate)를 방문하여 도움이 필요한 사람들을 돕기 위해 소액을 기부해 주세요. 작은 기부가 큰 도움이 됩니다. ❤️

## 기타 유사한 도구
#### BZip2 Shell Exec
[![BZip2 Shell Exec](https://github-readme-stats.vercel.app/api/pin?username=FajarKim&repo=bz2-shell&show_owner=true&title_color=8bd5ca&text_color=cad3f5&icon_color=c6a0f6&bg_color=24273a)](https://github.com/FajarKim/bz2-shell)
#### LZip Shell Exec
[![LZip Shell Exec](https://github-readme-stats.vercel.app/api/pin?username=FajarKim&repo=lzip-shell&show_owner=true&title_color=8bd5ca&text_color=cad3f5&icon_color=c6a0f6&bg_color=24273a)](https://github.com/FajarKim/lzip-shell)

<div align="center">
  <img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/line.svg?sanitize=true"/>
</div>

<p align="center">❤️과 Shell로 제작</p>
<p align="center">Copyright © 2022-현재의 Rangga Fajar Oktariansyah</p>
<div align="center">
  <a href="LICENSE"><img src="https://custom-icon-badges.demolab.com/github/license/FajarKim/blind-bash?label=License&labelColor=302d41&color=91d7e3&logo=law&logoColor=d9e0ee&style=for-the-badge" alt="License"></a>
</div>
