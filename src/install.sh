#!/usr/bin/env bash

(return 2> /dev/null) || {

  cd "$(dirname "${0}")"/.. \
    || exit 1

  target=$(pwd -P)/target

  install() {
    if grep -q -F "${1}" "${2}"; then
      echo "${2}" is up-to-date
    else
      printf '\n%s\n' "${1}" >> "${2}"
    fi
  }

  git config --global include.path "${target}"/gitconfig

  install "source ${target}/vimrc" ~/.vimrc
  install "\$include ${target}/inputrc" ~/.inputrc
  install ". ${target}/initrc" ~/.bashrc
  install ". ${target}/initrc" ~/.zshrc

}
