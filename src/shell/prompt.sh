#!/usr/bin/env bash
# shellcheck disable=SC2034

if [ "${BASH_VERSION}" ]; then

  PROMPT_DIRTRIM=2

  PS1=$(
    echo
    printf '\e[1m\e[30m\e[47m   %s   \e[m ' '\D{%Y-%m-%d}' '\D{%H:%M:%S}' \\h \\u \\w \$\?
    printf '\e[47m\e[K\e[m'
  )$'\n\n\\$ '

elif [ "${ZSH_VERSION}" ]; then

  PROMPT=$(
    echo
    printf '\e[1m\e[30m\e[47m   %s   \e[m ' '%D{%Y-%m-%d}' '%D{%H:%M:%S}' %m %n %2\~ %\?
    printf '\e[47m\e[K\e[m'
  )$'\n\n%# '

fi
