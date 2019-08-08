#!/bin/bash
FILE=$1
FILE2=$2

# make sure the file exists
if [ ! -f "$FILE" ]
then
    echo -e "\x07File $1 doesn't exists !"
    exit
fi

# check for changes based on the last edit time
while true
do

  ATIME=`stat -c %Z $1`
  if [[ -n ${FILE2} ]]
  then
    ATIME2=`stat -c %Z $2`
  fi

  if [[ "$ATIME" != "$LTIME" || -n "$FILE2" && "$ATIME2" != "$LTIME2" ]]
  then
    if [[ -z ${FILE2} ]]
    then
      g++ -o ${FILE%.*} $FILE && ./${FILE%.*}
      LTIME=$ATIME
    else
      g++ -o ${FILE%.*} $FILE $FILE2 && ./${FILE%.*}
      LTIME=$ATIME
      LTIME2=$ATIME2
    fi
  # else
  #   if [[  ]]
  #     then
  #       g++ -o ${FILE%.*} $FILE $FILE2 && ./${FILE%.*}
  #       LTIME2=$ATIME2
  #   fi
  fi

  sleep 2
done
