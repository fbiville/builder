#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

template=${1}
output=${2}

if [ -f $template ] ; then
  rm  $output
  echo "# DO NOT EDIT - this file is the output of the '$template' template " >> $output
  while IFS= read -r line
  do
    eval "echo \"$(echo "$line" | sed -e 's|"|\\"|g')\" >> $output"
  done < "$template"
fi
