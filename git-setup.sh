#!/usr/bin/env bash

[ "${BASH_SOURCE[0]}" = "${0}" ] && {
  options=(
    'alias.a add'
    'alias.b branch'
    'alias.bb branch -a'
    'alias.c commit'
    'alias.d diff -w'
    'alias.dd diff -w HEAD'
    'alias.f fetch'
    'alias.l log --graph --decorate --oneline'
    'alias.ll log --graph --decorate --oneline --all'
    'alias.lll log --graph --decorate --all'
    'alias.pl pull'
    'alias.ps push'
    'alias.r reset'
    'alias.s status -sb'
    'alias.u remote update --prune'
    'color.ui true'
    'core.editor vim'
    'core.pager less -i'
    'credential.helper store'
    'init.defaultBranch main'
  )

  for option in "${options[@]}"; do
    read -r key value <<<"${option}"
    git config --global "${key}" "${value}"
  done
}
