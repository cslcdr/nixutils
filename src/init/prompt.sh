#!/usr/bin/env bash

# shellcheck disable=SC1090

. <(

  prompt() {
    delimiter=─
    carriage=$'\r'
    items=$(printf '  %s ' "${@:2}")
    line='tput cols | xargs seq | xargs printf'

    cat << EOF
${1}='\
\$(${line} "%.0s ")
\$(${line} "%.0s${delimiter}")${carriage}\
\$(seq 6 | xargs printf "%.0s${delimiter}") ${items}  \
\$(git branch --show-current 2> /dev/null | sed "s/$/   /")

> '
EOF
  }

  if [ "${BASH_VERSION}" ]; then
    prompt PS1 \\t \\u \\h \\w
  elif [ "${ZSH_VERSION}" ]; then
    prompt PROMPT %\* %n %m %\~ %\?
  fi

)
