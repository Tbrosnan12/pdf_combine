#!/bin/bash

dir=$1
files=("$dir"/*.pdf)


# Making Bookmarks
touch bookmarks.txt
declare -i bookmark_no=0
declare -i page_count=0

for file in $dir/*.pdf; do \
    name=${file//[0-9]/}
    bookmark_no=$((bookmark_no+1))
    pages=$(pdfinfo "$file" | awk '/Pages:/ {print $2}')
    echo "
BookmarkBegin
BookmarkTitle: ${name}
BookmarkLevel: ${bookmark_no}
BookmarkPageNumber: ${page_count}" >> bookmarks.txt
page_count=$((page_count+pages))
done 


