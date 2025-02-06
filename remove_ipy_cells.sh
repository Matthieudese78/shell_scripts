#!/bin/bash

# Check if we're in a directory with .py files
if ! ls *.py &>/dev/null; then
    echo "No Python files found in current directory"
    exit 1
fi

# Process each Python file
for file in *.py; do
    # Create backup of original file
    # cp "$file" "${file}.bak"
    
    # Remove #%% and # %% patterns
    sed -i 's/#%%//g' "$file"
    sed -i 's/#\ %%//g' "$file"
    
    echo "Processed $file"
done

# echo "Backup files created with .bak extension"