#!/usr/bin/env bash

[ "${BASH_SOURCE[0]}" = "${0}" ] && {
  cp -r "$(dirname "${0}")"/home/. "${HOME}"
}
