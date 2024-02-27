#!/bin/sh

# Check number of input arguments
if [ $# -ne 2 ]
then 
    echo "ERROR: The number of input arguments should be 2.
1) Path to directory.
2) Search phrase."
    exit 1
fi

# Safe arguments in human readable variables
filesDir=$1
searchStr=$2

# Check that directory exists
if [ ! -d $filesDir ]
then
    echo "No such directory on the filesystem."
    exit 1 
fi

# Find the number of all files in filesDir and its subdirectiories
numOfFiles=$(find $filesDir -type f | wc -l)
numOfLinesWithSearchStr=$(grep -r $searchStr $filesDir | wc -l)


echo The number of files are $numOfFiles and the number of matching lines are $numOfLinesWithSearchStr.
exit 0