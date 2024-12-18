#!/usr/bin/env bash
# shellcheck disable=SC2034

if [ "${BASH_VERSION}" ]; then

  PS1=$'\n'$(
    printf '  %s  🯟' '\D{%Y-%m-%d}' '\D{%H:%M:%S}' \\h \\u \\w \$\?
  )$'\n\n''\$ '

elif [ "${ZSH_VERSION}" ]; then

  PROMPT=$'\n'$(
    printf '  %s  🯟' '%D{%Y-%m-%d}' '%D{%H:%M:%S}' %m %n %\~ %\?
  )$'\n\n''%# '

fi
