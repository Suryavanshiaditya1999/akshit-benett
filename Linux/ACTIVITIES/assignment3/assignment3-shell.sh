#!/bin/bash
count=$1

if [ $(($count % 15)) == 0 ]; then
    echo "tomcat";

elif [ $(($count % 3)) == 0 ]; then
        echo "tom";
elif [ $(($count % 5)) == 0 ]; then
        echo " cat ";
else
echo " Not divisible by the 3,5,15 ";
fi
