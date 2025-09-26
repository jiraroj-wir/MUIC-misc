#!/bin/zsh

# Setup:
# Create a folder named unorganized/ and add 10 files of various types: i.e., .txt, .jpg, .pdf.
# Create and name 3 additional folders under the same parent directory: images/, documents/, and texts/.

# create `unorganized` directory
mkdir ./unorganized/

# array of various file types
extensions=(txt log webp joblib pdf jpg wav arw tex csv json)

# loop through `extensions` and create files
for extension in $extensions; do
    touch "./unorganized/file.$extension"
done

# create `images/`, `documents/` and `texts/` directories as instructed
mkdir ./images/
mkdir ./documents/
mkdir ./texts/
