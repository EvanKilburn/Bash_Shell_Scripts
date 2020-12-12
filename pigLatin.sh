#!/bin/bash
#October 8, 2020
#Evan Kilburn, 18EWK, 20148263
#Program converts the word in $1 into pig latin
if [[ (( $2 != "")) || (( $1 == "" )) ]];then
	echo "error: wrong number of arguments for pigLatin.sh (needs exactly one)"
	exit 1
fi
word=$1
if [[ ${word:0:1} == @(a|e|i|o|u|A|E|I|O|U) ]];then #checks if starts with vowel
	echo  "${word}way"
else
	(( length = ${#word} - 1 ))
	for x in $(seq 0 $length);
	do
		if [[ ${word:$x:1} == @(a|e|i|o|u|A|E|I|O|U) ]];then #finds first occurence of vowel in word
			echo "${word:$x:${#word}}${word:0:$x}ay"
			exit 0
		fi
	done
fi
