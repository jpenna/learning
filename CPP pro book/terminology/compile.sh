#!/bin/bash
# check for changes based on the last edit time
declare -i count

output="./main"
run="gcc -lstdc++ -std=c++1y -o $output main.cpp"
count=0

while true
do
  ATIME1=`stat -c %Z main.cpp`
  # ATIME2=`stat -c %Z student.cpp`
  # ATIME3=`stat -c %Z database.cpp`

  # ATIME5=`stat -c %Z personal.h`
  # ATIME6=`stat -c %Z student.h`
  # ATIME7=`stat -c %Z database.h`

  if [[ "$ATIME1" != "$LTIME1" ]]
  then
    count+=1
    printf "\n---$count---\n" && $run && $output
    LTIME1=$ATIME1
    # LTIME2=$ATIME2
    # LTIME3=$ATIME3
    # LTIME5=$ATIME5
    # LTIME6=$ATIME6
    # LTIME7=$ATIME7
  fi
  sleep 2
done
