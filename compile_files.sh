#!/bin/bash


compiled="compiled.csv"
dir=$1

usage()
{
	echo "usage: ./compile_files.sh dir [-f | --output-file output_filename]"
}

if [ "$1" == "" ]; then
       usage
       exit
fi       

while [ "$2" != "" ]; do
	case $2 in
		-f | --output-file ) shift
			compiled="$2"
			;;
		-h | --help ) usage
			      exit
			      ;;
	esac
	shift
done

echo "Compiling from: $dir..."


files=$(ls $dir)

touch $compiled

i=0

for file in $files; do
	if [[ "$i" -ne 0 ]]; then
		tail -n +2 $dir/$file >> $compiled
	else
		tail -n +0 $dir/$file >> $compiled
	fi
	
	(( i++ ))
	echo "Processing file #: $i -- $dir/$file"
done

echo "Created $compiled......Done"
