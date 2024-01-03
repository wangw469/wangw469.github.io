#!/bin/bash

# Change to the _posts directory
cd _posts || exit

# Process each Markdown file
for file in `find . -name "*.md"`; do
    # Remove the {{ page.title }} line and the following line with "---"
    sed -i '' '/{{ page.title }}/d' "$file"

    # Extract the date and city information
    meta_data=$(sed -n 's/<p class="meta">\(.*\)<\/p>/\1/p' "$file")
    day=$(echo "$meta_data" | awk '{print $1}')
    month=$(echo "$meta_data" | awk '{print $2}')
    year=$(echo "$meta_data" | awk '{print $3}')
    city=$(echo "$meta_data" | awk '{print $5}')

    # Remove the original <p class="meta"></p> line
    sed -i '' '/<p class="meta">/d' "$file"

    # Add city and date lines
    sed -i '' "/title:/a\\
city: $city" "$file"
    sed -i '' "/city: $city/a\\
date: $day $month $year" "$file"
done

# Return to the original directory (optional)
cd - || exit

