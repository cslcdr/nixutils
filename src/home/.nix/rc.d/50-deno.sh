#!/usr/bin/env bash

export DENO_INSTALL=~/.deno
export DENO_INSTALL_ROOT=${DENO_INSTALL}
export DENO_DIR=${DENO_INSTALL}/cache

PATH=${DENO_INSTALL}/bin:${PATH}
