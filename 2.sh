#!/bin/bash
echo "Please input a number:"
read num
base=1
while [ $base -le $num ]; do
    magnification=1
    while [ $magnification -le $base ]; do
        echo -e "$base*$magnification=`expr $base \* $magnification ` \c"
        magnification=`expr $magnification + 1`
    done
    echo
    base=`expr $base + 1`
done
