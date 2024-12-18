#!/usr/bin/env bash

ggit() (
  id=0
  delimiter=╌
  logs=path/to/ggit

  line() {
    xargs printf %.0s${delimiter}
  }

  full-line() {
    tput cols | xargs seq | line
  }

  rm -rf "${logs}"
  mkdir -p "${logs}" \
    && find "$(pwd)" -type d -name .git -print0 \
    | xargs -r -0 dirname \
      | while read -r repo; do
        {
          echo
          full-line
          printf '\r%s   %s   \n\n' "$(seq 6 | line)" "${repo}"
          git -C "${repo}" -c color.ui=always "${@}" 2>&1
        } > "${logs}/$(printf '%06d' ${id})" &

        ((id++))
      done

  wait

  cat "${logs}"/*
)
