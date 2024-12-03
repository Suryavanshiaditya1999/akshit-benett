#!/bin/bash

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <template_file> fname=<value1> topic=<value2>"
    exit 1
fi

template_file="$1"
fname=$(echo "$2" | cut -d '=' -f 2)
topic=$(echo "$3" | cut -d '=' -f 2)

echo "$(cat "$template_file" | sed "s/{{fname}}/$fname/g" | sed "s/{{topic}}/$topic/g")"