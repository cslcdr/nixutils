#!/usr/bin/env bash
# shellcheck disable=SC2034

if [ "${BASH_VERSION}" ]; then

  shopt -s autocd
  shopt -s globstar
  shopt -s no_empty_cmd_completion
  shopt -s nocaseglob
  shopt -s nocasematch

  bind 'set bell-style visible'
  bind 'set completion-ignore-case on'
  bind 'set expand-tilde on'
  bind 'set show-all-if-ambiguous on'
  bind 'set show-all-if-unmodified on'

elif [ "${ZSH_VERSION}" ]; then

  mkdir -p ~/.zsh

  setopt append_history
  setopt auto_cd
  setopt extended_glob
  setopt glob_star_short
  setopt hist_ignore_all_dups
  setopt hist_ignore_space
  setopt inc_append_history
  setopt no_beep
  setopt no_case_glob
  setopt no_case_match
  setopt no_check_jobs
  setopt numeric_glob_sort
  setopt prompt_subst
  setopt rc_expand_param

  zstyle ':completion:*' accept-exact '*(N)'
  zstyle ':completion:*' cache-path ~/.zsh/cache
  zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
  zstyle ':completion:*' menu select
  zstyle ':completion:*' rehash true
  zstyle ':completion:*' use-cache on

  HISTFILE=~/.zsh/history
  HISTSIZE=999
  SAVEHIST=999

  if autoload -Uz compinit; then
    compinit -d ~/.zsh/compdump
  fi

fi
