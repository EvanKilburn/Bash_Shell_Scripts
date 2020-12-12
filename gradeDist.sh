#!/bin/bash
#October 8, 2020
#Evan Kilburn, 18EWK, 20148263
#This program will use $1 to grade the assignment submissions stored in $2 and total up how much of each grade 
if [[ (( $3 != "" )) || (( $2 == "" )) ]];then
	echo "error: gradeDist.sh needs two arguments"
	exit 1
elif [[ !(-x $1) ]];then
	echo "error: $1 is not an existing, executable file"
	exit 1
elif [[ !(-d $2) ]];then
	echo "error: $2 does not exist or is not a directory"
	exit 1
fi
cd ~
cd $2
A=0
B=0
C=0
D=0
F=0
grade=""
list=$(ls) #command substitution
for aFile in $list
do
	if [[ -f $aFile ]];then #checks if aFile is a regular file
		grade=$(source $1 $aFile) #calls the grading file and stores result in grade
		if [[ $grade == "A" ]];then
			(( A++ ))
		elif [[ $grade == "B" ]];then
			(( B++ ))
		elif [[ $grade == "C" ]];then
			(( C++ ))
		elif [[ $grade == "D" ]];then
			(( D++ ))
		else
			(( F++ ))
		fi
	fi
done
echo "A: $A"
echo "B: $B"
echo "C: $C"
echo "D: $D"
echo "F: $F"
