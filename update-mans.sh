#!/bin/bash

declare -r SRCDIR='/home/octo/liboping/src/mans'
declare -r DSTDIR='./content/documentation'

while read infile; do
	name="$(basename "${infile}" .pod)"
	outfile="${DSTDIR}/${name}.md"

	section=3
	if [[ $name = 'oping' ]]; then
		section=8
	fi

	(
		echo '---'
		echo 'date:' $(date --iso-8601=seconds)
		echo "title: \"${name}(${section})\""
		echo 'menu:'
		echo '  main:'
		echo '    parent: "docs"'
		echo "    identifier: \"${name}\""
		echo '---'
		pod2markdown "${infile}"
	) >"${outfile}"
done < <(ls "${SRCDIR}"/*.pod)
