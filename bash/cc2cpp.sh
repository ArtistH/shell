#!/bin/bash

cc2cpp()
{
    cd $1
	files=`ls`
 
    for current_file in $files
    do
        if [ -d $current_file  ]
        then
            cc2cpp $current_file
        elif [ "${current_file##*.}" = "cc" ]
        then
            mv $current_file ${current_file%.*}.cpp
        fi
    done

    cd ../
}
 
#================
# Main program
#================
if [ ! -d $1 ]
then
	echo "$1 is not a valid dir."
    exit
fi
 
cc2cpp $1
