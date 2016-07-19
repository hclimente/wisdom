function getscreen {
	# re-attach a screen by list number (instead of a long name)
	# or the only available one, if that is the case

	sceenNo=$1

	if [[ -z "$sceenNo" ]]
		then
		if [[ 0 -eq `screen -r | cut -f2 | egrep [0-9]+ | wc -l` ]]
			then
			echo No available screens
		else
			echo Available screens
			screen -r | cut -f1 | egrep [0-9]+ | nl
		fi
	else
		if [[ sceenNo -gt `screen -r | cut -f2 | egrep [0-9]+ | wc -l` ]]
			then
			echo Screen value too high
			screen -r | cut -f2 | egrep [0-9]+ | nl
		else
			screenId=`screen -r | cut -f2 | egrep [0-9]+ | sed -n $sceenNo"p"`
			screen -r $screenId
		fi
	fi
}

function tll {
	# display the last line of a bunch of files, after a unique -c
	tail -n1 $@ | grep -v "==" | grep -v "^$" | sort | uniq -c
}

function hg {
	# exectute a particular line from history, passed as argument
	line=$1
	command=`history | grep "^ \+$line " | sed 's/^\ \+[0-9]\+\ \+//g'`
	echo Executing \`$command\`
	eval $command
}

function uqstat {
	# your unique tasks in queue
	echo -e "#\tjob-id\tname\tuser\tstate"
	qstat | tail -n+3 |  sed 's/ \+/\t/g' | cut -f1,3-5 | sort | uniq -c | sed 's/^ \+//'
}