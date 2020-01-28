#!/bin/bash
# -e exit       when a command fails
# -u exit       when trying to use undefined variable
# -o pipefail   return the exit code of piped commands that fail
# -x            debug

set -euo pipefail

PREFIX="[*]"

echo
echo $PREFIX "Good commit: $1"
echo $PREFIX "File path: $2"
echo $PREFIX "Git branch: $3"
echo $PREFIX "Project name $4"
# conditional variables
BG=''
FOUND=2

# init git bisect
echo 
echo $PREFIX "Init git bisect"

cd $4
git checkout $3
git bisect start
git bisect bad
git bisect good $1
cd ..

#-eq $FOUND is numerically equal to 2 ?
while [ $FOUND -eq 2 ]; do 
    # check the file if it exists
    # -f check if the file is a regular file 
    if [ -f $2 ] ; then
        BG='bad'
        echo $PREFIX "File found" 
    else
        BG='good'
        echo $PREFIX "File not found"
    fi
    cd $4
    # git bisect bad/good   Parameters, return a view  
    # wc                    Print newline, word, and byte counts for each FILE.              
    # awk                   $1 newlines number,$2 words number, $3 byte number.
    # assign the number of lines of the output of git biset bad/good to the FOUND variable
    FOUND=$(git bisect $BG | wc | awk '$1 {print $1}') 
    cd ..
done    
echo "[*] commit found "
cd $4
git show

 
