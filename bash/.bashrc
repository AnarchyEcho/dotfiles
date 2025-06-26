case "$HOSTNAME" in
"EchoDesktop")
  source F:/Code_projects/Dotfiles/.env.local
  ;;
"EchoLaptop")
  source C:/Users/anarc/Documents/code_projects/dotfiles/.env.local
  ;;
esac

dotfiles() {
  case "$HOSTNAME" in
  "EchoDesktop")
    cd F:/Code_projects/Dotfiles
    ;;
  "EchoLaptop")
    cd C:/Users/anarc/Documents/code_projects/dotfiles
    ;;
  *)
    echo "Not implemented for $HOSTNAME"
    ;;
  esac
}
connectphone() {
  adb connect $PHONEIP
}
projects() {
  case "$HOSTNAME" in
  "EchoDesktop")
    cd F:/Code_projects
    ;;
  "EchoLaptop")
    cd C:/Users/anarc/Documents/code_projects
    ;;
  esac
}
gpull() {
  git pull
}
gcom() {
  git add .
  git commit -m "$@"
}
sshpi() {
  ssh $PIIP
}
sshserver() {
  ssh $SERVERIP
}
rfmodules() {
  rm -rf ./node_modules/
  echo "removed node_modules in $PWD"

  case "$@" in
  "npm")
    rm ./package-lock.json
    echo "removed package-lock in $PWD"
    ;;
  "yarn")
    rm ./yarn.lock
    echo "removed yarn.lock in $PWD"
    ;;
  "bun")
    rm ./bun.lockb
    echo "removed bun.lockb in $PWD"
    ;;
  esac
}
pyscripts() {
  case "$HOSTNAME" in
  "EchoDesktop")
    py F:/Code_projects/pyScripts/main.py
    ;;
  *)
    echo "Not implemented for $HOSTNAME"
    ;;
  esac
}
fapi() {
  trap '' INT
  case "$HOSTNAME" in
  "EchoDesktop")
    bun F:/Code_projects/Games/FAPI/gameplay-planner/bunner.js &
    ;;
  *)
    echo "Not implemented for $HOSTNAME"
    return
    ;;
  esac
  (
    trap - INT
    bun run --cwd="F:/Code_projects/Games/FAPI/gameplay-planner" start
  )
  kill $!
  trap INT
}
sdkmanager() {
  case "$HOSTNAME" in
  "EchoDesktop")
    E:/androidSdk/cmdline-tools/latest/bin/sdkmanager.bat "$@"
    ;;
  *)
    echo "Not implemented for $HOSTNAME"
    ;;
  esac
}
refresh() {
  source ~/.bashrc
}
commands() {
  echo "refresh, dotfiles, connectphone, projects, gcom \"commit\", rfmodules \"npm, yarn, or bun\"(for pkg-lock too), fapi"
}

alias ls='ls --color=always'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vi='nvim'
alias vim='nvim'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export DENO_INSTALL="/c/Users/anarc/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export BUN_INSTALL="$HOME/.bun/bin"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

eval "$(starship init bash)"
