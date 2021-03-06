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
	qstat "$@" | tail -n+3 |  sed 's/ \+/\t/g' | sed 's/^\t//' | cut -f1,3-5 | sort | uniq -c | sed 's/^ \+//' | sed 's/ \+/\t/g' | sort -k5,5 -k1,1n
}

function woe {
	# warn on end: pop a desktop notification when a command longer than 15s finishes
	# the notification when disappear when closer or after 2 min
	# from http://askubuntu.com/questions/409611/desktop-notification-when-long-running-commands-complete
	start=$(date +%s)
	"$@"
	[ $(($(date +%s) - start)) -le 15 ] || notify-send "$(echo $@) finished" "Completed in $(($(date +%s) - start)) seconds"  -t 120000
}

function numcols {
	head -n1 $1 | sed 's/\t/\n/g' | nl
}

function tgrep {
	f=`echo "${@: -1}"`
	head -n1 $f
	grep $@
}

function enable_proxy {

	export http_proxy=http://www-cache.curie.fr:3128
	export HTTP_PROXY=http://www-cache.curie.fr:3128
	export https_proxy=http://www-cache.curie.fr:3128
	export ftp_proxy=http://www-cache.curie.fr:3128
	export no_proxy=localhost,127.0.0.0/8,127.0.1.1,127.0.1.1*,local.home,127.0.0.1

}

function disable_proxy {

        export http_proxy=""
        export HTTP_PROXY=""
        export https_proxy=""
        export ftp_proxy=""
        export no_proxy=""

}
