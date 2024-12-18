#!/usr/bin/env bash
# shellcheck disable=SC2034

if [ "${BASH_VERSION}" ]; then

  PS0=$'\n'
  PS1=$'\n''\W  🯟  '

elif [ "${ZSH_VERSION}" ]; then

  PROMPT=$'\n''%1~  🯟  '
  preexec() { echo; }

fi
