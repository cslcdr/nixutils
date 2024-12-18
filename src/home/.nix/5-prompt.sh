#!/usr/bin/env bash

prompt() (
  clear=$(tput sgr0)
  eol=$(tput el)
  style=$(
    tput setab 7
    tput setaf 0
  )

  printf '\e]0;%s\a' "${1}"

  for text in "${@:2}"; do
    echo -n "${style}  ${text}  ${clear}  "
  done

  echo -n "${style}${eol}${clear}"
)

if [ "${ZSH_VERSION}" ]; then
  # shellcheck disable=SC2034
  PROMPT=$'\n'$(prompt '%1~' '%n' '%m' '%*' '%~' '%?')$'\n\n''%# '

  preexec() {
    echo
  }
fi

if [ "${BASH_VERSION}" ]; then
  PS0=$'\n'
  PS1=$'\n'$(prompt '\W' '\u' '\h' '\t' '\w' '$?')$'\n\n''\$ '
fi

unset -f prompt
