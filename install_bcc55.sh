#!/bin/bash

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

if 
	! (
	echo 433B44741F07F2AD673EB936511D498C5A6B7F260F98C4D9A6DA70C41A56D855 "$MY_PATH/_dl/freecommandLinetools.exe"
	) | sha256sum -c -
then
	mkdir -p "$MY_PATH/_dl"
	wget http://altd.embarcadero.com/download/bcppbuilder/freecommandLinetools.exe -O "$MY_PATH/_dl/freecommandLinetools.exe"
	if 
		! (
		echo 432B44741F07F2AD673EB936511D498C5A6B7F260F98C4D9A6DA70C41A56D855 "$MY_PATH/_dl/freecommandLinetools.exe"
		) | sha256sum -c -
	then
		echo Bad download!!
		exit 1
	fi
fi

if ! test -d "$MY_PATH/_wineprefix/drive_c/BCC55"
then
	7z x "$MY_PATH/_dl/freecommandLinetools.exe" -o"$MY_PATH/_wineprefix/drive_c/BCC55"
fi
