#!/bin/bash

#read the file record.txt assuming each record is three fields: ID FirstName LastName
while read -r if fname lname; do
#extract 10th to 13th character
(positions 10 to 13, 0-based index is 9)
numstr ="${id:9:4}"        #10th to 13th position
num=$(echo "$numstr" | sed 's/^0*//')
#remove leading zeros

#only proceed if num is not empty
if [[ -z "$num"]] then
continue 
fi
