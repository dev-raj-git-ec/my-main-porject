#!/bin/bash
# clean the ugly.txt file before each test
: > ugly.txt

# Read the file record.txt assuming each record is three fields: ID FirstName LastName
while read -r id fname lname; do
    # Extract 10th to 13th character (positions 10 to 13, 0-based index is 9)
    extract10to13="${id:9:4}"              # 10th to 13th position
    num=$(echo "$extract10to13" | sed 's/^0*//')   # Remove leading zeros

    # Only proceed if num is not empty
    if [[ -z "$num" ]]; then
        continue
    fi

    # Ugly number check: Divide by 2, 3, and 5 until not possible
    temp="$num"
    for divisor in 2 3 5; do
        while [[ $temp -ne 0 && $((temp % divisor)) -eq 0 ]]; do
            temp=$((temp / divisor))
        done
    done

    # If temp equals 1, it's an ugly number
    if [[ "$temp" -eq 1 ]]; then
        # Lowercase ID for email
        email="$(echo "$id" | tr '[:upper:]' '[:lower:]')@bitspilani-digital.edu.in"
        # Write with specified separators
        printf "%s\t\t%s     %s\t  %s\n" "$id" "$fname" "$lname" "$email" >> ugly.txt
    fi
done < record.txt
