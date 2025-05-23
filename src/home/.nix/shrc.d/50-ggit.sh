#!/usr/bin/env bash

ggit() {
  local root=~/.ggit
  local logs=${root}/logs
  local repos=${root}/repos

  if [ ! -r "${repos}" ]; then
    reggit
  fi

  rm -rf "${logs}"
  mkdir -p "${logs}"

  local line repo

  line=$(printf "%$(tput cols)s" | tr ' ' '~')

  (
    while read -r repo; do
      {
        printf '\n'"${line}"'\n\n%s\n\n' "${repo}"
        git -C "${repo}" -c color.ui=always "${@}" 2>&1 \
          | sed 's/^/    /g'
      } > "${logs}/${repo##*/}" &
    done < "${repos}"

    wait
  )

  cat "${logs}"/*

  echo $'\n'"${line}"$'\n'
}

reggit() {
  local root=~/.ggit

  mkdir -p "${root}"
  find "$(pwd)" -type d -name .git -print0 \
    | xargs -r -0 dirname \
    | tee "${root}"/repos
}
