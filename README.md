# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Prereqs

Have Bash installed

## Windows Instructions

1. Install Scoop

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    ```

2. Install pkgs

    ```bash
    scoop bucket add extras
    ```

    ```bash
    scoop install fzf gh neovim ripgrep zig 7zip pwsh wget
    # prompts admin 2x to install
    scoop install vcredist2022
    ```

3. Clone repo in location

    ```bash
    cd ~/AppData/Local/nvim
    ```

### Optional

***Untested***

Config URL: [weztermConfig](https://github.com/AnarchyEcho/weztermconfig)

```bash
scoop install wezterm
```
