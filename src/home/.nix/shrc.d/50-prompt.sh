#!/usr/bin/env bash

prompt() {
  local clear eol style text

  clear=$(tput sgr0)
  eol=$(tput el)
  style=$(
    tput setab 7
    tput setaf 0
  )

  echo -en '\e]0;'"${1}"'\a'

  for text in "${@:2}"; do
    echo -n "${style}  ${text}  ${clear} "
  done

  echo -n "${style}${eol}${clear}"
}

if [ "${ZSH_VERSION}" ]; then
  PROMPT=$'\n'$(prompt '%1~' '%n' '%m' '%*' '%~' '%?')$'\n\n''%# '

  export PROMPT

  preexec() {
    echo
  }
else
  PS0=$'\n'
  PS1=$'\n'$(prompt '\W' '\u' '\h' '\t' '\w' '$?')$'\n\n''\$ '

  export PS0 PS1
fi

unset -f prompt
