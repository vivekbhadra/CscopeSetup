#!/bin/bash

# Generate a file list while excluding the output directory
find . -type d -path ./output -prune -o -type f \( \
    -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o \
    -iname '*.hpp' -o -iname '*.cc' -o -iname '*.hh' \
\) > ./cscope.files

# Build the Cscope database
cscope -q -R -b -i ./cscope.files -f ./cscope.out

# Generate the Ctags database while excluding noisy folders
ctags --exclude=output --exclude=package --exclude=system -R .

# Export the Cscope environment variable for the current session
export CSCOPE_DB="./cscope.out"

echo "Cscope and Ctags databases have been successfully generated."
