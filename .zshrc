# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kevin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#Mine
export EDITOR=nvim
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.node_modules/bin:$PATH"
#eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias to git for managing dot files
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Go Lang setup
# export GOPATH=$HOME/apps/go
# export PATH=$PATH:$GOPATH/bin

# export ANDROID_HOME=/usr/local/opt/android-sdk

# Load NPM_TOKEN
if [ -f ~/.npm.env ]; then
  source ~/.npm.env
fi

alias dcc='docker-compose'
alias dccr='docker-compose rm -f'
alias dcr='docker-compose run --rm'
alias dce='docker-compose exec'
alias dcb='docker-compose build --pull'
alias dclean='docker rmi $(docker images -f "dangling=true" -q)'
alias dprune='docker system prune -af --volumes'
alias dccrriseapi='dccr app accounts-events accounts-jobs accounts-jobs-ui accounts-rest customer-api graphql jobs jobs-ui lrs'

alias artRiseStage='art -on rise-stage '
alias ardc='artRiseStage docker-compose '
alias ardr='ardc run --rm '
alias arde='ardc exec '

alias uuid="uuidgen | tr -d '\n' | pbcopy"
alias uuid2="uuidgen | tr -d '\n'"

alias ngrok-id='ngrok http --host-header=rewrite --subdomain kstewart-id-dev id-mapper.dev.articulate.zone:80'

alias dev='sh ~/.tmux/sh/dev.sh'

alias upload-file='curl -H "Content-Type: application/zip" -v --upload-file '

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'

alias startvpn='sudo nmcli connection up articulate --ask'

alias vim='nvim'

function gpr() {
  git push origin HEAD

  if [ $? -eq 0 ]; then
    github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@' -e 's%\.git$%%'`;
    branch_name=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`;
    pr_url=$github_url"/compare/master..."$branch_name
    chromium $pr_url;
  else
    echo 'failed to push commits and open a pull request.';
  fi
}

alias pbcopy="xclip -selection c"
alias pbpaste="xclip -selection clipboard -o"

export npm_config_prefix=~/.node_modules

# Turn off history sharing between terminals
unsetopt share_history

### QEMU virtual machines
#alias startwindows10="qemu-system-x86_64 -drive file=windows10,format=qcow2 -m 4G -enable-kvm -cpu host"
alias startwindows10="qemu-system-x86_64 -boot order=d -drive file=windows10,format=raw -m 4G -enable-kvm -cpu host -vga qxl"
alias startmanji3="qemu-system-x86_64 -boot order=d -drive file=manjaro-i3,format=raw -m 4G -enable-kvm -cpu host -vga qxl"
#-vga none -device qxl-vga,vgamem_mb=32
                      #qemu-system-x86_64 -cdrom  ~/Downloads/manjaro-i3-18.1.5-191229-linux54.iso -boot order=d -drive file=disk_image,format=raw -m 2G -enable-kvm -cpu host -vga qxl
