## Enabling Portage completions and Gentoo prompt for zsh
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

## Enabling cache for the completions for zsh
zstyle ':completion::complete:*' use-cache 1

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/14/bin:/home/mrturcot/bin

# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX="true"
export ZSH=/home/mrturcot/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(
  bundler
  git
  sudo
  thefuck
  zsh-autosuggestions
  zsh-completions
  zsh-histdb
  zsh-history-substring-search
  zsh-syntax-highlighting
)

# Sourcing

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/site-contrib/auto-fu.zsh/auto-fu.zsh
source $HOME/scripts/colors

# Enviroment variables

export SHELL=/bin/zsh
export USB_DEVFS_PATH=/dev/bus/usb
export VDPAU_DRIVER=radeonsi
export ANDROID_HOME="/home/mrturcot/Android/Sdk"
export REPO_OS_OVERRIDE=linux
export TERM=xterm-kitty
export KITTY_SHELL_INTEGRATION="enabled no-cursor"
export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-$(date +%s)}"
export BUILD_DATE="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d-%H-%S)"
#export DATE_FMT="+%Y-%m-%d"
#export CMAKE_MODULE_PATH="/usr/share/cmake/Modules/;/usr/share/ECM"
#export CMAKE_PREFIX_PATH="/usr/lib/cmake;/usr/lib64/cmake;/usr/include/yaml-cpp"
#export LD_LIBRARY_PATH="/usr/local/lib;/usr/local/lib64"
#export PLASMA_USE_QT_SCALING=1
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5
#export XDG_DATA_HOME=${XDG_DATA_HOME:-"${HOME}/.local/share"}
#export MANPATH="/usr/local/man:$MANPATH"
#export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Unsetting
unset XCURSOR_THEME
unset XCURSOR_SIZE

# Compilation flags
#export ARCHFLAGS="-arch x86_64"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt NO_EQUALS

# Release colors
colorscript -r

# Starship
eval "$(starship init zsh)"
