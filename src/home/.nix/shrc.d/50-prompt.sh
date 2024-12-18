#!/usr/bin/env bash

pprompt() {
  local c e s t

  c=$(tput sgr0)
  e=$(tput el)
  s=$(
    tput setab 7
    tput setaf 0
  )

  for t in "${@}"; do
    echo -n "${s}  ${t}  ${c} "
  done

  echo -n "${s}${e}${c}"
}

if [ "${BASH_VERSION}" ]; then
  PS0=$'\n'
  PS1=$'\n'$(pprompt '\u' '\h' '\t' '\w' '$?')$'\n\n''\$ '

  export PS0 PS1
fi

if [ "${ZSH_VERSION}" ]; then
  PROMPT=$'\n'$(pprompt '%n' '%m' '%*' '%~' '%?')$'\n\n''%# '

  export PROMPT

  preexec() {
    echo
  }
fi
