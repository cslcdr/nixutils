#!/usr/bin/env bash
# shellcheck disable=SC1090
# shellcheck disable=SC2034
# shellcheck disable=SC2059

. <(

  print() {
    echo
    printf '\e[1m\e[30m\e[47m   %s   \e[m ' "${@}"
    printf '\e[47m\e[K\e[m'
  }

  if [ "${BASH_VERSION}" ]; then

    echo PROMPT_DIRTRIM=2

    echo PS1=\'"$(
      print '\D{%Y-%m-%d}' '\D{%H:%M:%S}' \\h \\u \\w \$\?
    )"$'\n\n\\$ '\'

  elif [ "${ZSH_VERSION}" ]; then

    echo PROMPT=\'"$(
      print '%D{%Y-%m-%d}' '%D{%H:%M:%S}' %m %n %2\~ %\?
    )"$'\n\n%# '\'

  fi

)
