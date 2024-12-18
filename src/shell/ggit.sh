#!/usr/bin/env bash

ggit() (
  id=0
  logs=path/to/ggit

  full-line() {
    tput cols | xargs seq | xargs printf %.0s╌
  }

  rm -rf "${logs}"

  mkdir -p "${logs}" \
    && find "$(pwd)" -type d -name .git -print0 \
    | xargs -r -0 dirname \
      | while read -r repo; do
        {
          echo
          full-line
          printf '\r\e[8C  %s  \n\n' "${repo}"
          git -C "${repo}" -c color.ui=always "${@}" 2>&1
        } > "${logs}/$(printf '%06d' ${id})" &

        ((id++))
      done

  wait

  cat "${logs}"/*
  echo
)
