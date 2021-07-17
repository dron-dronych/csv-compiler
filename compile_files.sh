#!/bin/bash

dir=$1

echo "Compiling from: $dir..."


files=$(ls $dir)
compiled="compiled.csv"

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
