# 💤 LazyVim in the EchoDev flavour

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
   # vcredist2022 prompts admin 2x to install
   scoop install vcredist2022
   scoop install fzf gh neovim ripgrep zig 7zip pwsh wget adb scrcpy luarocks lazygit imagemagick ghostscript
   ```

3. Clone repo in location

   ```bash
   cd ~/AppData/Local/nvim
   ```

### Optional

Config URL: [weztermConfig](https://github.com/AnarchyEcho/weztermconfig)
