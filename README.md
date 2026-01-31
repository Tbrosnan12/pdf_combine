# Pdf Combine

Makes use of the pdfunite tool to combine a directory of pfds into one

Note currently the line that deletes the left over files `rm -- "$dir"/*.pdf` is commented out, you can un-comment this but at your own risk of misusage!

# Usage
With `pdf_combine.sh` in your path, navigate to the directory above the directory containing the pdfs you want to combine and run
```
pdf_combine.sh  <directory> <output_name>
```
alternatively 
```
bash /path/to/pdf_combine.sh <directory> <output_name>
```
Permissions may have to be given to `pdf_combine.sh` to run it.

# Dependencies
[pdfunite](https://github.com/mtgrosser/pdfunite/tree/master)
Note pdfunite already comes with most standard distros, you can check if it is installed with `pdfunite --version`. This script has been tested on pdfunite version 24.02.0,
