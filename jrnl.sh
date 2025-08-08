#!/usr/bin/env bash

# checks for directory structure
if [[ ! -d ~/.jrnl ]]; then
    mkdir ~/.jrnl
fi

# gets todays date (yymmdd)
YEAR=$(date +%y)
MONTH=$(date +%m)
DAY=$(date +%d)
TODAY=$YEAR$MONTH$DAY

# displays prompt and waits for input
echo "Enter Date (Null for Today): "
read INPUT

# if input is empty open today's note
if [[ -z $INPUT ]]; then
    vim ~/.jrnl/$TODAY && exit
# if input is not empty and a note exists for that day then open it
elif [[ -e ~/.jrnl/$INPUT ]]; then
    vim ~/.jrnl/$INPUT && exit
elif [[ -e ~/.jrnl/$YEAR$INPUT ]]; then
    vim ~/.jrnl/$YEAR$INPUT && exit
elif [[ -e ~/.jrnl/$YEAR$MONTH$INPUT ]]; then
    vim ~/.jrnl/$YEAR$MONTH$INPUT && exit
else
    echo "No Note Found" && exit
fi
