#!/bin/bash

CSCOPE_DIR=~/xyz

# Create the directory if it doesn't exist
if [ ! -d "${CSCOPE_DIR}" ]; then
    mkdir -p "${CSCOPE_DIR}"
fi

# Generate the list of source files, properly grouping -o conditions
find "${PWD}" -type f \( \
    -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o \
    -iname '*.hpp' -o -iname '*.cc' -o -iname '*.hh' \
\) > "${CSCOPE_DIR}/cscope.files"

# Build the cscope database
cscope -q -R -b -i "${CSCOPE_DIR}/cscope.files" -f "${CSCOPE_DIR}/cscope.out"

# Export the database path
export CSCOPE_DB="${CSCOPE_DIR}/cscope.out"

echo "Cscope setup done."
