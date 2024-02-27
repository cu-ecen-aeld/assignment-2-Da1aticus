#!/bin/sh

# Check number of input arguments
if [ $# -ne 2 ]
then 
    echo "ERROR: The number of input arguments should be 2
1) File path (with file name included).
2) Text to write in a file."
    exit 1
fi

# Safe arguments in human readable variables
writeFile=$1
writeStr=$2

# Create folder if it doesn't yet exist. 
if [ ! -d $(dirname $writeFile) ] 
then 
    mkdir -p $(dirname $writeFile)
fi

# Create file
touch $writeFile
if [ $? -ne 0 ] # this checks if the last command ran successfully
then
    exit 1
else
    echo $writeStr > $writeFile
    exit 0
fi






