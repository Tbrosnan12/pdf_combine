#!/bin/bash

# Show usage if not enough arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory> <output_name>"
    echo "Merges all PDFs in <directory> into <output_name>.pdf"
    exit 1
fi

dir=$1
name=$2

# Collect all pdf files in an array
files=("$dir"/*.pdf)

# Exit if no PDFs found
if [ ! -e "${files[0]}" ]; then
    echo "No PDFs found in $dir"
    exit 1
fi

# Merge them into one
if pdfunite "${files[@]}" "${name}.pdf"; then
    echo "Converted ${#files[@]} files into ${name}.pdf"
    
    # Remove originals only if merge succeeded
    # rm -- "$dir"/*.pdf
    
    # Move the merged PDF back
    mv -- "${name}.pdf" "${dir}/${name}.pdf"
else
    echo "Error: pdfunite failed"
    exit 1
fi

