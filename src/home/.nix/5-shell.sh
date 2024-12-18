#!/usr/bin/env bash

alias clear='tput clear'
alias grep='grep -i --color=auto'
alias la='ll -A'
alias less='less -i'
alias ll='ls -l'
alias ls='ls -h --color=auto'
alias reset='tput reset'

if [ "${BASH_VERSION}" ]; then
  shopt -s autocd
  shopt -s globstar
  shopt -s no_empty_cmd_completion
  shopt -s nocaseglob
  shopt -s nocasematch
elif [ "${ZSH_VERSION}" ]; then
  setopt auto_cd
  setopt glob_star_short
  setopt no_beep
  setopt no_case_glob
  setopt no_case_match
  setopt prompt_subst

  zstyle ':completion:*' accept-exact '*(N)'
  zstyle ':completion:*' cache-path ~/.zsh/cache
  zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
  zstyle ':completion:*' menu select
  zstyle ':completion:*' rehash true
  zstyle ':completion:*' use-cache on

  if autoload -Uz compinit; then
    compinit
  fi
fi
