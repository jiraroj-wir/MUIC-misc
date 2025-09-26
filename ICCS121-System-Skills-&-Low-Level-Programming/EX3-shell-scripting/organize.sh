#!/bin/zsh

# Scripting: Create a script to move each file in unorganized/ to its respective folder.

# image extensions array
image_extensions=(png jpg jpeg gif bmp tiff tif webp heic heif svg ico avif)

# text extensions array
text_extensions=(txt text log md markdown rtf tex rst cfg conf ini yaml yml json toml)

# document extensions array
document_extensions=(pdf doc docx odt rtf csv tsv xls xlsx ods ppt pptx odp)

# Can't tolerate O(n) lookup time, so we change to hashmap
typeset -A extensions_map=()

# map extensions to image
for extension in $image_extensions; do
    extensions_map[$extension]=image
done 

# map extensions to text
for extension in $text_extensions; do
    extensions_map[$extension]=text
done 

# map extensions to document
for extension in $document_extensions; do
    extensions_map[$extension]=document
done 

# Loop through files in unorganized/.
for file in ./unorganized/*; do
    # i don't think we learn this in class -- i just google it; this should keep only string after `.`
    file_extension=${file##*.}
    # this one is similar to the ones above, just cut at the backmost `/` in file directory
    file_name=${file##*/}

    # '-z' prefix means missing/ don't exist
    if [[ -z ${extensions_map[$file_extension]} ]]; then
        # Create folders for each file extension if they don’t exist.
        mkdir ./$file_extension/
        # Move files to the correct folder.
        mv $file ./$file_extension/$file_name
        # For each file moved, print a one-line log on the screen. The log should look like the following: "Moving <filename> to <foldername>/"
        echo "Moving $file_name to ./$file_extension/"
    else
        case ${extensions_map[$file_extension]} in
            image)
                # Move files to the correct folder.
                mv $file ./images/$file_name
                # For each file moved, print a one-line log on the screen. The log should look like the following: "Moving <filename> to <foldername>/"
                echo "Moving $file_name to ./images/"
                ;;
            text)
                # Move files to the correct folder.
                mv $file ./texts/$file_name
                # For each file moved, print a one-line log on the screen. The log should look like the following: "Moving <filename> to <foldername>/"
                echo "Moving $file_name to ./texts/"
                ;;
            document)
                # Move files to the correct folder.
                mv $file ./documents/$file_name
                # For each file moved, print a one-line log on the screen. The log should look like the following: "Moving <filename> to <foldername>/"
                echo "Moving $file_name to ./documents/"
                ;;
            *)
                # panic, scream
                echo "Ahhhhhhhhhhhhhhhhh!!!!!"
                ;;
        esac
    fi
done
