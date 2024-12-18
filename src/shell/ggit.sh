#!/usr/bin/env bash

ggit() (
  local line repo
  local root=~/.ggit
  local logs=${root}/logs
  local repos=${root}/repos

  if [ ! -r "${repos}" ]; then
    reggit
  fi

  rm -rf "${logs}"
  mkdir -p "${logs}"

  line=$(tput cols | xargs seq | xargs printf %.0s~)

  while read -r repo; do
    {
      printf '\n%s\n\n%s\n\n' "${line}" "${repo}"
      git -C "${repo}" -c color.ui=always "${@}" 2>&1 \
        | sed 's/^/    /g'
    } > "${logs}/${repo##*/}" &
  done < "${repos}"

  wait

  cat "${logs}"/*

  printf '\n%s\n\n' "${line}"
)

reggit() (
  local target
  local root=~/.ggit
  local repos=${root}/repos

  target=$(cd "${1:-.}" && pwd)

  mkdir -p "${root}" \
    && find "${target}" -type d -name .git -print0 \
    | xargs -r -0 dirname \
      | tee "${repos}"
)
