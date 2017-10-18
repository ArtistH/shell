#!/bin/bash

clean_elf()
{
    cd $1
	files=`ls`
 
    for current_file in $files
    do
        if [ -d $current_file  ]
        then
            clean_elf $current_file
        else
			rm -f `file * | grep ELF | cut -d: -f1`
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
 
clean_elf $1
