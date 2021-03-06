#!/bin/bash

function pidtree() {

	tp=( $(pgrep -P "$1") )

	for i in "${tp[@]}"; do
		if [ -z "${i}" ]; then
			exit
		else
			echo "${i}"
			pidtree "${i}"
		fi
	done

}

if [[ ! $1 ]]; then

	exit 1

fi

for i in "$@"; do

	if [[ ${args} ]]; then
		args="${args} ${i}"
	else
		args="${i}"
	fi

done

if echo "$1" | grep -q -F ".sh"; then

	args="bash ${args}"

fi

id=$(pgrep -a -x -f "${args}" | awk '{print $1}')

if [[ ${id} ]]; then

	ids=( ${id} $(pidtree "${id}") )

	for id in "${ids[@]}"; do
		windowid=$(wmctrl -l -p | grep "${id}" | awk '{print $1}')

		if [[ ${windowid} ]]; then
			wmctrl -i -a ${windowid}
			exit $?
		fi
	done

fi

eval "${args}" &
disown
