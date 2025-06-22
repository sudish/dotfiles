# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' format 'Completing %d:'
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-/]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'With %e corrections:'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/sj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -d ~/.ghcup/bin ] && PATH=~/.ghcup/bin:$PATH
[ -d ~/.local/bin ] && PATH=~/.local/bin:$PATH

# export every environment variable
setopt all_export

# root dir for sundry zsh things
ZDIR=~/.zsh.d

autoload -Uz add-zsh-hook

# Load a system-specific startup file, if present
sys_init=$ZDIR/init.d/sysinit-$(uname -o)
[[ -r $sys_init ]] && source $sys_init
unset sys_init

# Load various startup files, prioritized by name
for file in $ZDIR/init.d/S[0-9][0-9]_*; do
    source $file
done
unset file

# directory and host shortcuts
for file in zdirs zhosts; do
    [[ -r $ZDIR/$file ]]  && source $ZDIR/$file
done
unset file

# zsh options
setopt \
    all_export always_to_end auto_name_dirs auto_pushd complete_aliases \
    complete_in_word correct extended_glob extended_history glob_star_short \
    hist_allow_clobber hist_fcntl_lock hist_find_no_dups \
    hist_ignore_all_dups hist_ignore_dups hist_lex_words hist_no_store \
    hist_reduce_blanks hist_save_no_dups inc_append_history kshoptionprint \
    list_packed long_list_jobs magic_equal_subst mark_dirs no_clobber \
    prompt_subst pushd_ignore_dups pushd_minus pushd_silent pushd_to_home \
    transient_rprompt
unsetopt \
    beep bg_nice list_ambiguous multi_func_def nomatch

TZ=EST5EDT
DIRSTACKSIZE=20
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
SELECTMIN=0

# Options for various programs
PAGER=less
EDITOR=nvim
VISUAL=nvim
MYSQL_PS1='\u@\h/\d> '
VERSION_CONTROL=existing	# GNU patch
#LESS=-R

# enable color ls o/p
LS_COLOR_OPTS='--color=tty'
ls $LS_COLOR_OPTS >&| /dev/null || unset LS_COLOR_OPTS
l () { LC_COLLATE=C ls $LS_COLOR_OPTS -al $* }
alias ls="LC_COLLATE=C ls $LS_COLOR_OPTS -F"

# enable color grep/ack o/p
GREP_COLOR_OPTS='--color=auto'
grep $GREP_COLOR_OPTS localhost /etc/hosts >&| /dev/null || \
    unset GREP_COLOR_OPTS
ACK_COLOR_MATCH='bold red'

# dotfiles
#
# first checkout into ~/dotfiles  with:
#   cd
#   git clone --separate-git-dir=$HOME/.dotfiles git@github.com:sudish/dotfiles.git
#
# then move all the dotfiles into ~:
#   mv dotfiles/.* $HOME
# this last step may need help like `cp -a dotfiles/.config/* .config` etc
#
# finally initialize the ~/.git file with:
#   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status
#
# this alias is no longer needed as any git operation with --git-dir will create ~/.git
# alias c='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#
# helper to clone a command's completion
# from https://unix.stackexchange.com/a/496759
# compdefas () {
#   if (($+_comps[$1])); then
#     compdef $_comps[$1] ${^@[2,-1]}=$1
#   fi
# }
#
# compdefas git c

# aliases
alias d='dirs -v'
alias dcmp='git diff --no-index --name-status'
alias egrep="egrep $GREP_COLOR_OPTS"
alias grep="grep $GREP_COLOR_OPTS"
alias fgrep="fgrep $GREP_COLOR_OPTS"
alias jobs='\jobs -lp'
alias lg=lazygit
alias m='less -R'
alias md=mkdir
alias v=nvim
alias wh='whence -csa'

# global aliases, active anywhere on a line
alias -g '*F'='**/*(.)'  # grep foo *F -> all files, including subdirs

# cd to root of current git tree
cdg() {
    local gitroot
    gitroot=`git rev-parse --show-toplevel 2>/dev/null` && cd $gitroot
}

# Powerlevel10k
source ~/.zsh.d/submodules/powerlevel10k/powerlevel9k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# dircolors
#eval $(dircolors $ZDIR/dircolors.256dark)
eval $(dircolors $ZDIR/dircolors.gruvbox)

# zoxide
eval "$(zoxide init zsh)"

# cdr: persistent working directory history
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':completion:*:*:cdr:*:*' menu selection

# keybindings
bindkey -e
bindkey ' ' magic-space
bindkey '' backward-delete-char
bindkey '' backward-delete-char

# search history using entered prefix.
bindkey '\e[1;5A' history-beginning-search-backward
bindkey '\e[1;5B' history-beginning-search-forward

# history search with a menu
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '\eP' history-beginning-search-menu

# Insert $!, repeat for earlier history
autoload -U smart-insert-last-word
zle -N smart-insert-last-word
bindkey '\e.' smart-insert-last-word

# Insert last word, repeat for earlier
autoload -U copy-earlier-word
zle -N copy-earlier-word
bindkey '\em' copy-earlier-word

# zsh-users plugins

# Fish-like autosuggestions for zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"
source ~/.zsh.d/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh

# shell syntax highlighting
source ~/.zsh.d/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history-substring-search must follow syntax-highlighting - and everything else really
source ~/.zsh.d/submodules/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind to control up- and down-arrow
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down
