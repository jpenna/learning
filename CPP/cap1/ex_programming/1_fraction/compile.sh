#!/bin/bash
# check for changes based on the last edit time
while true
do
  ATIME1=`stat -c %Z main.cpp`
  ATIME2=`stat -c %Z fraction.cpp`

  ATIME3=`stat -c %Z fraction.h`

  if [[ "$ATIME1" != "$LTIME1" || "$ATIME2" != "$LTIME2" || "$ATIME3" != "$LTIME3" ]]
  then
    clear && make && printf "\n-----START-----\n\n" && ./out
    LTIME1=$ATIME1
    LTIME2=$ATIME2
    LTIME3=$ATIME3
  fi
  sleep 2
done
