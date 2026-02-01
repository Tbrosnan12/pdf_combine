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

# Making Bookmarks
cd $dir
touch bookmarks.txt
declare -i bookmark_no=0
declare -i page_count=0


for file in *.pdf; do \
    book_name=$(echo "${file%.*}")
    book_name=${book_name//[0-9]/}
    bookmark_no=$((bookmark_no+1))
    pages=$(pdfinfo "$file" | awk '/Pages:/ {print $2}')
    echo "
BookmarkBegin
BookmarkTitle: ${book_name}
BookmarkLevel: 1
BookmarkPageNumber: $((page_count+1))" >> bookmarks.txt
page_count=$((page_count+pages))
done 
cd ..



# Merge them into one
if pdftk "${files[@]}" cat output merged.pdf; then
    echo "Converted ${#files[@]} files to ${name}.pdf"
    pdftk merged.pdf update_info ${dir}/bookmarks.txt output "${name}.pdf"
    echo "Added Table of Contents"
    
    # Remove originals only if merge succeeded
    # rm -- "$dir"/*.pdf
    
    # Move the merged PDF into the directory
     mv -- "${name}.pdf" "${dir}/${name}.pdf"
else
    echo "Error: pdfunite failed"
    exit 1
fi

