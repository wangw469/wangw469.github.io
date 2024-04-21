#!/bin/bash

# Check if two arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_name> <title>"
    exit 1
fi

# Assign arguments to variables
TITLE=$2
DATE=$(date +"%Y-%m-%d")  # Automatically generate the current date in the format YYYY-MM-DD
FILE_NAME="${DATE}-$1"     # Prefix the file name with the date

# Create a markdown file with the prefixed file name
cat <<EOF > "./_posts/$FILE_NAME.md"
---
layout: post
title: "$TITLE"
city: Suzhou
date: $DATE
---
EOF

echo "Markdown file $FILE_NAME.md with title '$TITLE' and date '$DATE' created successfully."

