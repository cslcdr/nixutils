#!/usr/bin/env bash

alias \
  clear='tput clear' \
  grep='grep -i --color=auto' \
  la='ll -A' \
  less='less -i' \
  ll='ls -l' \
  ls='ls -h --color=auto' \
  reset='tput reset'

[ "${BASH_VERSION}" ] && {
  shopt -s \
    autocd \
    globstar \
    no_empty_cmd_completion \
    nocaseglob \
    nocasematch
}

[ "${ZSH_VERSION}" ] && {
  setopt \
    auto_cd \
    glob_star_short \
    no_beep \
    no_case_glob \
    no_case_match

  zstyle ':completion:*' accept-exact '*(N)'
  zstyle ':completion:*' cache-path ~/.zsh/cache
  zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
  zstyle ':completion:*' menu select
  zstyle ':completion:*' rehash true
  zstyle ':completion:*' use-cache on

  autoload -Uz compinit
  compinit
}
