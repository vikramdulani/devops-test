#!/bin/bash

textManipulation() {

    echo $1 | grep -o "\"$2\":\"[^\"]*\"" | sed 's/"//'g | cut -d: -f2-

}

jq -c '.[]' string.json | \

while read line; do 

    first_name=$(textManipulation $line first_name)
    last_name=$(textManipulation $line last_name)
    domain=$(textManipulation $line domain)

    echo $first_name.$last_name@$domain.com

done

