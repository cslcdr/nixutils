#!/usr/bin/env bash

ggit() {
  local logs repos root

  root=~/.ggit
  logs=${root}/logs
  repos=${root}/repos

  if [ ! -r "${repos}" ]; then
    reggit
  fi

  rm -rf "${logs}"
  mkdir -p "${logs}"

  local repo

  while read -r repo; do
    {
      printf '\n\n%s\n\n' "${repo}"
      git -C "${repo}" "${@}" \
        | sed 's/^/    /g'
    } > "${logs}/${repo##*/}" &
  done < "${repos}"

  wait
  cat "${logs}"/*
}

reggit() {
  local root=~/.ggit

  mkdir -p "${root}"
  find "$(pwd)" -type d -name .git -print0 \
    | xargs -0 dirname \
    | tee "${root}"/repos
}
