#!/usr/bin/env bash

pprompt() {
  local c s t

  c=$(tput sgr0)
  s=$(
    tput setab 7
    tput setaf 0
  )

  for t in "${@}"; do
    echo -n "${s}  ${t}  ${c} "
  done

  echo -n "${s}$(tput el)${c}"
}

[ "${BASH_VERSION}" ] && {
  PS0='\n'
  PS1=$'\n'$(pprompt '\u' '\h' '\t' '\w')$'\n\n''\$ '

  export PS0 PS1
}

[ "${ZSH_VERSION}" ] && {
  PROMPT=$'\n'$(pprompt '%n' '%m' '%*' '%~')$'\n\n''%# '

  export PROMPT

  preexec() {
    echo
  }
}
