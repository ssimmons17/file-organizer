#!/bin/bash

set -e

#find /home/stephen/* -maxdepth 0 -maxdepth 1 -and -type f | while IFS= read -r -d '' file 

misc=Miscellaneous

: '
find /home/stephen/* -maxdepth 0 -maxdepth 1 -and -type f -print0 | while IFS= read -r -d '' file; do
  if [[ $file =~ $(dirname $file) ]]; 
  then echo "$file will be copied to $(dirname $file)/$misc" 
fi
done
'

#Creation of the Miscellaneous folder
function createMiscDirs() {

find /home/stephen/** -maxdepth 0 -type d -print0 | while IFS= read -r -d '' file; do newDirs="$file/Miscellaneous"; 

if [[ ! -d "$newDirs" ]];
 then
  mkdir "$newDirs"
  #print which directories were created? 
 break
  printf '%s\n' "Directories were created successfully"
 else printf '%s\n' "$newDirs already exists"
 fi
done
}

#copy loose files to appropriate location
totalFiles=0
function copyLooseFiles() {

while IFS= read -r -d '' file; do
  if [[ "$file" =~ $(dirname "$file") ]]; 
   totalFiles=$(( $totalFiles + 1 ));
   sleep .1s
   then printf '%s\n' "$file will be printed to $(dirname $file)/$misc" 
  fi
done < <(find /home/stephen/* -maxdepth 0 -maxdepth 1 -and -type f -print0)
echo "$totalFiles files were copied to the designated location" 
}


#Run program
createMiscDirs

echo " "

copyLooseFiles



#
