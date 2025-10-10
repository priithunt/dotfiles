# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===================================================================
# Priidu .zshrc – minimalistlik, kiire ja oh-my-zsh'ita
# ===================================================================

# --- PATH ja Homebrew ---
export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"
fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
autoload -Uz compinit && compinit

# --- Java path ---
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# --- põhiseaded ---
export EDITOR="nvim"
setopt autocd
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history inc_append_history

# --- Powerlevel10k prompt ---
if [[ -r "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
    source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
fi
[[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ===================================================================
# Pluginad
# ===================================================================

# --- zoxide (nutikas cd) ---
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# --- autosuggestions ---
if [[ -r "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# ===================================================================
# Aliasid
# ===================================================================

# failide vaatamine (kasutame eza-d)
alias ls='eza -1 --group-directories-first'
alias ll='eza -lh --git --group-directories-first'
alias la='eza -lha --git --group-directories-first'

# mugavam otsing
alias grep='rg'
alias f='fzf'

# git
alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'

# python
alias venv="python3 -m venv .venv && source .venv/bin/activate"

# C kompileerimine
alias gccrun="gcc -Wall -Wextra -std=c11 -o main main.c && ./main"

# ===================================================================
# Täiendavad seadistused
# ===================================================================

# emacs-like keymap terminalis
bindkey -e

# case-insensitive globbing
setopt nocaseglob
unsetopt nomatch
alias bwunlock='export BW_SESSION=$(bw unlock --raw)'

# ────────────────────────────────
# BAT: Solarized (dark)
# ────────────────────────────────
export BAT_THEME="Solarized (dark)"

# ────────────────────────────────
# FZF seaded
# ────────────────────────────────

# Üldised fzf'i välimuse sätted
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview-window=right:60%:wrap"

# Ctrl-T: faili eelvaade bat’iga
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Alt-C: kataloogi eelvaade puuna (kasutab eza; kui pole, vaheta ls -laR vastu)
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Lae fzf zsh plugin (kui see on olemas)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf keybindings ja completion
source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh
source $(brew --prefix)/opt/fzf/shell/completion.zsh

# FZF: vaikimisi otsi faile fd-ga (ka peidetud, v.a .git)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# --- syntax highlighting (PEAB olema viimane plugin) ---
if [[ -r "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

export PATH="$PATH:$HOME/go/bin"
