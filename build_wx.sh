#!/bin/bash -e

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

export WINEPREFIX="$MY_PATH/_wineprefix"

if ! test -d "$MY_PATH/_wineprefix/drive_c/WX"
then
	(
		cd "$MY_PATH/wxWidgets/build/msw"
		export WINEPATH="C:\BCC55\Bin"
		#wine make SHELL=CMD.exe -f makefile.bcc -DWINVER=0x0400 SHARED=0 MONOLITHIC=1 UNICODE=0 BUILD=release clean
		wine make SHELL=CMD.exe -f makefile.bcc -DWINVER=0x0400 SHARED=0 MONOLITHIC=1 UNICODE=0 BUILD=release
	)
	mkdir -p "$MY_PATH/_wineprefix/drive_c/WX"
	mkdir -p "$MY_PATH/_wineprefix/drive_c/WX/include"
	mkdir -p "$MY_PATH/_wineprefix/drive_c/WX/lib"
	(
		cd "$MY_PATH/wxWidgets"
		cp -r include/* "$MY_PATH/_wineprefix/drive_c/WX/include"
		cp -r lib/bcc_lib/msw/* "$MY_PATH/_wineprefix/drive_c/WX/include"
		cp -r lib/bcc_lib/*.lib "$MY_PATH/_wineprefix/drive_c/WX/lib"
	)
fi
