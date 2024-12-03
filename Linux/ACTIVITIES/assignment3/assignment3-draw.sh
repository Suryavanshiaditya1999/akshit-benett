#!/bin/bash
num=$1
case $2 in
t2)

        for((i=1;i<=$num;i++))
do
        for((j=1;j<=i;j++))
do
        echo -n "*"
done
        echo " "
done
;;

t1)

        for((i=1;i<=$num;i++))
do
        for((k=1;k<=$num-i;k++))
do
        echo -n " "
done
        for((j=1;j<=i;j++))
do
        echo -n "*"
done
        echo
done
;;

t3)
for ((i=1; i<=$num; i++));
        do
    for ((j=i; j<=$num-1; j++));
        do
       echo -n " "
    done
    for ((k=1; k<=2*i-1; k++)); do
        echo -n "*"
    done
    echo
done
;;
t4)
for ((i=$num; i>=1; i--));
        do
    for ((j=1; j<=i; j++));
         do
        echo -n "*"
    done
    echo
done
;;
t5)
for ((i=$num; i>=1; i--));
        do
    for ((j=i; j<$num; j++));
        do
        echo -n " "
    done
    for ((k=1; k<=i; k++));
        do
        echo -n "*"
    done
    echo
done
;;
t6)
for ((i=$num-1; i>=1; i--));
do

for ((j=$num-1; j>=i; j--));
        do
         echo -n " "
    done
    for ((k=1; k<=2*i-1; k++));
        do
         echo -n "*"
    done
    echo
done;;
t7)
  for ((i=1; i<=2*$num-1; i++)); do
    if ((i <= $num)); then

       for ((j=i; j<$num; j++)); do
            echo -n " "
        done
        for ((k=1; k<=2*i-1; k++)); do
            echo -n "*"
        done
    else

        for ((j=1; j<i-$num+1; j++)); do
            echo -n " "
        done
        for ((k=1; k<=2*(2*$num-i)-1; k++)); do
            echo -n "*"
        done
    fi
    echo
done
;;
esac
