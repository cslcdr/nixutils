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

  local repo

  (
    while read -r repo; do
      {
        printf '\n%s\n\n' "${repo}"
        git -C "${repo}" -c color.ui=always "${@}" \
          | sed 's/^/    /g'
      } > "${logs}/${repo##*/}" 2>&1 &
    done < "${repos}"
    wait
  )

  cat "${logs}"/*
  echo
}

reggit() {
  local root=~/.ggit

  mkdir -p "${root}"
  find "$(pwd)" -type d -name .git -print0 \
    | xargs -r -0 dirname \
    | tee "${root}"/repos
}
