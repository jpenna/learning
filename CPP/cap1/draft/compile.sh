#!/bin/bash
# check for changes based on the last edit time
while true
do
  ATIME=`stat -c %Z cpp_pointer.cpp`

  if [[ "$ATIME" != "$LTIME" ]]
  then
    make && printf "\n-----START-----\n\n" && ./out
    LTIME=$ATIME
  fi
  sleep 2
done
