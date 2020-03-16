#!/bin/bash
FILE=`cygpath -w $1`
MY_PATH="`dirname \"$0\"`"
cmd //c "$MY_PATH\\compile.bat" $FILE
