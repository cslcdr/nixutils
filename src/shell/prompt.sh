#!/usr/bin/env bash
# shellcheck disable=SC2034

if [ "${BASH_VERSION}" ]; then

  PROMPT_DIRTRIM=2
  PS1=$'\n{'$(
    printf ' %s }  {' '\D{%Y-%m-%d}' '\D{%H:%M:%S}' \\h \\u \\w \$\?
  )$'\b \n\n''\$ '

elif [ "${ZSH_VERSION}" ]; then

  PROMPT=$'\n{'$(
    printf ' %s }  {' '%D{%Y-%m-%d}' '%D{%H:%M:%S}' %m %n %2\~ %\?
  )$'\b \n\n''%# '

fi
