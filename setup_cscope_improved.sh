#!/bin/bash
find -type d -path ./output -prune -type f -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' -o -iname '*.cc' -o -iname '*.hh'  -type f > ./cscope.files
cscope -q -R -b -i ./cscope.files -f ./cscope.out
ctags --exclude=output --exclude=package --exclude=system -R .
export CSCOPE_DB=./cscope.out
