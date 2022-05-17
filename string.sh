#!/bin/bash

# This function receives two arguments: text line and pattern. 
# It greps the pattern from the line and strips double quotes and grabs the second part of the value after ':'.

textManipulation() {

    echo $1 | grep -o "\"$2\":\"[^\"]*\"" | sed 's/"//'g | cut -d: -f2-

}

# Uses jq to parse the json file

jq -c '.[]' string.json | \

# Loop through the json objects to grab the first name, last name and domain name.
# Print the email based on these values

while read line; do 

    first_name=$(textManipulation $line first_name)
    last_name=$(textManipulation $line last_name)
    domain=$(textManipulation $line domain)

    echo $first_name.$last_name@$domain.com

done

