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
## pdftk
With apt:
```
sudo apt install -y pdftk
```
Note the package isn’t available in Fedora’s official package repository (See https://www.baeldung.com/linux/install-pdftk for other download options)
Or the Pdftk site https://pkgs.org/download/pdftk. 

