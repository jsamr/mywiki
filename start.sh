#!/bin/bash

function start {
	cache
	cd docroot 
	python -m SimpleHTTPServer 5000 &
	g_pid=$! 
}

function stop {
	kill -15 $g_pid
}

function restart() {
	stop
	start
}

function cache {
    cd $HOME/mywiki && pykwiki cache
}

function help {
	echo "stop|sto : stop"
	echo "start|sta : start"
	echo "restart|r : restart"
	echo "cache|c : update pykwiki cache"
	echo "help|h : display this message"
	echo "clear : clear the console"
	echo "quit|q  : stop and exit"
}

start

while [[ 1 ]] ; do
	read answer 
	case $answer in 
		stop|sto) stop ;;
		start|sta) start ;;
		restart|r) restart;;
		cache|c) cache ;;
 		help|h) help;;
		clear) clear;;
		quit|q) stop ; exit 0;;
		*) echo "Unknown command $answer";;
	esac
done
