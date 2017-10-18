#!/bin/sh

builddir=`pwd`
topdir=/workspace/src/

if [ $# -ne 1 ] ; then
   echo Usage: $0 sourcedir
   echo Example: /workspace/src/
   exit
fi
topdir=$1
# -----------------------------------------------------------
# Recursion function to check & decide which files to update.
# -----------------------------------------------------------
create_tree()
{
	# Enter new version's current directory
	cd $1
	echo "In $1..."
        if [ $1 != "CVS" ] ; then
		mkdir -p $2
        fi	
	# Get files list
	files=`ls`

	for current_file in $files; do
		# Check if the file is a directory
		if [ -d $1/$current_file ]; then
			# Check if the old version has the directory 
			if [ $current_file != "CVS" ] ; then
			    create_tree $1/$current_file $2/$current_file
			fi    
	
		else
			if [ -L $current_file ] ; then
				echo "$current_file is a link"
				cp -a $current_file $2
			else
			    cd $2
			    if [ -e $current_file ] ; then
				rm -f $current_file
			    fi
			    ln -s $1/$current_file $current_file
			    cd -
			fi    
		fi
	done
}


# ============
# Main program
# ============
cd $topdir
create_tree $topdir $builddir
