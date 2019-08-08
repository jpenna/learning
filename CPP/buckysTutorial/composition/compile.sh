#!/bin/bash
# check for changes based on the last edit time
while true
do
  ATIME=`stat -c %Z main.cpp`
  ATIME2=`stat -c %Z Birthday.cpp`
  ATIME3=`stat -c %Z People.cpp`

  if [[ "$ATIME" != "$LTIME" || "$ATIME2" != "$LTIME2" || "$ATIME3" != "$LTIME3" ]]
  then
    make && printf "\n-----START-----\n\n" && ./out
    LTIME=$ATIME
    LTIME2=$ATIME2
    LTIME3=$ATIME3
  fi
  sleep 2
done
