#!/bin/bash
choice=$1

case $choice in
addLineTop)
filename=$2
text=$3
sed -i "1i\\$text" "$filename"
;;
addLineBottom)
filename=$2
text=$3
sed -i '$a\'"$text" "$filename"
;;
addLineAt)
filename=$2
text=$3
num=$4
sed -i "$num"'i\'"$text" "$filename"
;;
updateFirstWord)
filename=$2
text=$3
firstword=$(sed -n '1s/\([^[:space:]]*\).*/\1/p' "$filename")
# sed -i 's/eighteight/ninety/' template.txt
sed -i 's/'"$firstword"'/'"$text"'/' "$filename"
;;
updateAllWords)
# this is replacing word at line number update it to take the word number
    filename=$2
    text=$3
    num=$4
    word=$(sed -n "${num}s/\([^[:space:]]*\).*/\1/p" "$filename")
    sed -i "s/${word}/${text}/g" "$filename"
;;
deleteLine)
filename=$2
num=$3
sed -i "$num"'d' $filename
;;
deleteLineWord)
filename=$2
num=$3
sed -i "$num"'d' $filename
;;
*)
echo "Invalid Choice"
;;
esac
