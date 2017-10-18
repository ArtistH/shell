#!/bin/sh
# 检测出注释行, 老版本的shell需要加\, 即 ~ ^'\#'.*$

while read line
do
	if [[ "$line" =~ ^'#'.*$ ]]
	then
		echo $line
	fi
done < $1
