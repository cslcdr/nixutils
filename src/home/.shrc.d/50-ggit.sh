#!/usr/bin/env bash

ggit() {
  local dist="${HOME}"/.ggit
  local \
    logs="${dist}"/logs \
    repos="${dist}"/repos \
    repo

  [ -r "${repos}" ] || reggit

  rm -rf "${logs}"
  mkdir -p "${logs}"

  while
    read -r repo
  do
    {
      printf '\n%s\n\n' "${repo}"
      git -C "${repo}" "${@}" \
        | sed 's/^/    /g'
    } > "${logs}"/"$(basename "${repo}")" &
  done < "${repos}"

  wait
  cat "${logs}"/*
}

reggit() {
  local dist="${HOME}"/.ggit

  mkdir -p "${dist}"
  find "$(pwd)" -type d -name .git -print0 \
    | xargs -0 dirname \
    | tee "${dist}"/repos
}
