if [[ $HOSTNAME == "EchoLaptop" ]]; then
  source C:/Users/anarc/Documents/code_projects/dotfiles/.env.local
elif [[ $HOSTNAME == "EchoDesktop" ]]; then
  source F:/Code_projects/Dotfiles/.env.local
fi
dotfiles() {
  if [[ $HOSTNAME == "EchoLaptop" ]]; then
    cd C:/Users/anarc/Documents/code_projects/dotfiles
  elif [[ $HOSTNAME == "EchoDesktop" ]]; then
    cd F:/Code_projects/Dotfiles
  fi
}
connectphone() {
  adb connect $PHONEIP
}
projects() {
  if [[ $HOSTNAME == "EchoLaptop" ]]; then
    cd C:/Users/anarc/Documents/code_projects
  elif [[ $HOSTNAME == "EchoDesktop" ]]; then
    cd F:/Code_projects
  fi
}
gpull() {
  git pull
}
gcom() {
  git add .
  git commit -m "$@"
}
compilehere() {
  g++ *.cpp -o "$@"
}
compileall() {
  g++ -g $(find . -type f -iregex ".*\.cpp") -o "$@"
}
sshpi() {
  ssh $PIIP
}
sshserver() {
  ssh $SERVERIP
}
rfmodules() {
  rm -rf node_modules/
  echo "removed node_modules in $PWD"
  if [[ "$@" == "npm" ]]; then
    rm package-lock.json
    echo "removed package-lock in $PWD"
  fi
  if [[ "$@" == "yarn" ]]; then
    rm yarn.lock
    echo "removed yarn.lock in $PWD"
  fi
  if [[ "$@" == "bun" ]]; then
    rm bun.lockb
    echo "removed bun.lockb in $PWD"
  fi
}
pyscripts() {
  py F:/Code_projects/pyScripts/main.py
}
fapi() {
  trap '' INT
  bun F:/Code_projects/Games/FAPI/gameplay-planner/bunner.js &
  (
    trap - INT
    bun run --cwd="F:/Code_projects/Games/FAPI/gameplay-planner" start
  )
  kill $!
  trap INT
}
refresh() {
  source ~/.bashrc
}
commands() {
  echo "refresh, dotfiles, connectphone, projects, gcom \"commit\", compileall (C++), compilehere (C++), rfmodules \"npm, yarn, or bun\"(for pkg-lock too), fapi"
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
