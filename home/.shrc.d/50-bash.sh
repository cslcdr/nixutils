#!/usr/bin/env bash

[ "${BASH_VERSION}" ] && {
  PS0='\n'
  PS1=$'\n'$(shrc-prompt '\u' '\h' '\t' '\w')$'\n\n''\$ '

  export PS0 PS1

  shopt -s autocd
  shopt -s checkwinsize
  shopt -s complete_fullquote
  shopt -s direxpand
  shopt -s dirspell
  shopt -s expand_aliases
  shopt -s extglob
  shopt -s extquote
  shopt -s globstar
  shopt -s no_empty_cmd_completion
  shopt -s nocaseglob
  shopt -s nocasematch
  shopt -s promptvars
}
