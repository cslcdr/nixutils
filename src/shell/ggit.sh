#!/usr/bin/env bash

ggit() (
  id=0
  logs=path/to/ggit

  rm -rf "${logs}" \
    && mkdir -p "${logs}" \
    && find "$(pwd)" -type d -name .git -print0 \
    | xargs -r -0 dirname \
      | while read -r repo; do
        {
          printf '\n\e[1m\e[37m\e[44m %s\e[K\e[m\n\n' "${repo}"
          git -C "${repo}" -c color.ui=always "${@}" 2>&1
        } > "${logs}/$(printf '%08d' ${id})" &

        ((id++))
      done

  wait

  cat "${logs}"/*
)
