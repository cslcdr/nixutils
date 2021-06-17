#!/usr/bin/env bash

ggiitt() {
  local repo

  [ -r "${HOME}"/.ggiitt ] ||
    reggiitt

  while
    read -r repo
  do
    tput sc
    line
    tput rc
    tput cuf 2
    tput bold
    basename "${repo}" |
      xargs printf '  %s  \n\n'
    tput sgr0
    git -C "${repo}" "${@}"
    echo
  done <"${HOME}"/.ggiitt

  line
  echo
}

line() {
  seq "${COLUMNS}" |
    xargs printf '━%.0s'
}

reggiitt() {
  find "$(pwd)" -type d -name .git -print0 2>/dev/null |
    xargs -0 dirname |
    tee "${HOME}"/.ggiitt
}

shrc-prompt() {
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
