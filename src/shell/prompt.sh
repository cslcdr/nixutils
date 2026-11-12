#!/usr/bin/env bash
# shellcheck disable=SC2034

__prompt() {
  echo
  printf '\e[1m\e[30m\e[47m   %s   \e[m ' "${@:2}"
  printf '\e[47m\e[K\e[m\n\n%s ' "${1}"
}

if [ "${BASH_VERSION}" ]; then

  PROMPT_DIRTRIM=2

  PS1=$(
    __prompt '\$' '\D{%Y-%m-%d}' '\D{%H:%M:%S}' \\h \\u \\w \$\?
  )

elif [ "${ZSH_VERSION}" ]; then

  PROMPT=$(
    __prompt '%#' '%D{%Y-%m-%d}' '%D{%H:%M:%S}' %m %n %2\~ %\?
  )

fi
