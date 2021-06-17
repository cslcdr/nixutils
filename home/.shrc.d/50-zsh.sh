#!/usr/bin/env bash

[ "${ZSH_VERSION}" ] && {
  PROMPT=$'\n'$(shrc-prompt '%n' '%m' '%*' '%~')$'\n\n''%# '

  export PROMPT

  preexec() {
    echo
  }

  setopt autocd
  setopt extendedglob
  setopt nobeep
  setopt nocaseglob
  setopt nocasematch
  setopt nocheckjobs
  setopt numericglobsort
  setopt promptsubst
  setopt rcexpandparam

  zstyle ':completion:*' accept-exact '*(N)'
  zstyle ':completion:*' cache-path ~/.zsh/cache
  zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
  zstyle ':completion:*' menu select
  zstyle ':completion:*' rehash true
  zstyle ':completion:*' use-cache on

  bindkey -e
  autoload -Uz compinit
  compinit
}
