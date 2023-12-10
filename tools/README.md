# Blind Bash Tools
Tools for installing [Blind Bash](https://github.com/FajarKim/blind-bash) on the Termux application.

# Installation
Simply run the `install.sh` file, or use the following commands:
<table>
  <tr>
    <td><div align="center"><b>Method</b></div></td>
    <td><div align="center"><b>Command</b></div></td>
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

As an alternative, you can first download the `install.sh` script and run it afterwards:
- ```shell
  wget https://raw.githubusercontent.com/FajarKim/blind-bash/master/tools/install.sh
  ```
- ```shell
  bash install.sh
  ```

# Commands
Supported commands after the tool is successfully installed:
* `blind-bash`: to start encrypting Bash files.
* `blind-bash --upgrade`: to begin updating/upgrading [Blind Bash](https://github.com/FajarKim/blind-bash) tools.
* `blind-bash --uninstall`: to uninstall [Blind Bash](https://github.com/FajarKim/blind-bash) tools if installed on the Termux application.
