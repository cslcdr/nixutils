#!/usr/bin/env bash

if [ "${BASH_VERSION}" ]; then
  PS0=$'\n'
  PS1=$'\n'' ╲ \t ╲ \u ╲ \h ╲ \W ╲ $? ╲ $(
    git branch --show-current 2> /dev/null | sed "s/$/ ╲/"
  )'$'\n ╱ '
elif [ "${ZSH_VERSION}" ]; then
  preexec() { echo; }
  # shellcheck disable=SC2034,SC2016
  PROMPT=$'\n'' ╲ %* ╲ %n ╲ %m ╲ %1~ ╲ %? ╲ $(
    git branch --show-current 2> /dev/null | sed "s/$/ ╲/"
  )'$'\n ╱ '
fi
