#!/bin/bash
# check for changes based on the last edit time
while true
do
  ATIME1=`stat -c %Z personal.cpp`
  ATIME2=`stat -c %Z student.cpp`
  ATIME3=`stat -c %Z database.cpp`

  ATIME5=`stat -c %Z personal.h`
  ATIME6=`stat -c %Z student.h`
  ATIME7=`stat -c %Z database.h`

  if [[ "$ATIME1" != "$LTIME1" || "$ATIME2" != "$LTIME2" || "$ATIME3" != "$LTIME3" || "$ATIME5" != "$LTIME5" || "$ATIME6" != "$LTIME6" || "$ATIME7" != "$LTIME7" ]]
  then
    clear && make && printf "\n-----START-----\n\n" && ./out
    LTIME1=$ATIME1
    LTIME2=$ATIME2
    LTIME3=$ATIME3
    LTIME5=$ATIME5
    LTIME6=$ATIME6
    LTIME7=$ATIME7
  fi
  sleep 2
done
