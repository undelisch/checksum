#!/bin/bash

## This script takes three arguments:
#$1 type of checksum: 256 or 521
#$2 filename of checksum file 
#$3 filename of iso image

sumtype="$1"
filesum="$2"
fileiso="$3"

## Example:
# sumtype="256"
# filesum=="SHA256SUMS"	
# fileiso="debian-live-12.2.0-amd64-xfce.iso"

## Input checks
if [ "$sumtype" = "256" ]; then
	echo "Anylyzing 256-bit checksum."
else 
	if [ "$sumtype" = "512" ]; then
	    echo "Anylyzing 512-bit checksum."
	else 
		echo "Enter the correct sum type, asshole."
		echo "Exiting script, because you're too dumb to type."
		exit 1
	fi
fi

## File checks
# Check if the SHA file exists
if [ ! -e "$filesum" ]; then
	echo "404: Specified SHA file ($filesum) not found."
	exit 1
fi

# Check if the ISO file exists
if [ ! -e "$fileiso" ]; then
	echo "404: Specified ISO file ($fileiso) not found."
	exit 1
fi

## Fetch checksums
# Use argument $2 = $filesum (checksum file name) and scan for the checksum
sum1=$(grep "^.*$fileiso$" $filesum | awk '{print $1}')

# Get checksum from iso (or whatever other) file for comparison
sum2=$(sha$1sum $fileiso | awk '{print $1}')

## Compare checksums
if [ "$sum1" = "$sum2" ]; then
	echo "Checksums are equal."
else 
	echo "Checksums are not equal."
fi

