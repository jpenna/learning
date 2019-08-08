#!/bin/bash
# check for changes based on the last edit time
while true
do
  ATIME=`stat -c %Z main.cpp`
  ATIME2=`stat -c %Z Sally.cpp`

  if [[ "$ATIME" != "$LTIME" || "$ATIME2" != "$LTIME2" ]]
  then
    make && printf "\n-----START-----\n\n" && ./out
    LTIME=$ATIME
    LTIME2=$ATIME2
  fi
  sleep 2
done
