CSCOPE_DIR=~/xyz

if [ ! -d ${CSCOPE_DIR} ]; then
	mkdir -p ${CSCOPE_DIR}
fi

find ${PWD} -type f -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' -o -iname '*.cc' -o -iname '*.hh'  -type f  > ${CSCOPE_DIR}/cscope.files
cscope -q -R -b -i ${CSCOPE_DIR}/cscope.files -f ${CSCOPE_DIR}/cscope.out
CSCOPE_DB=${CSCOPE_DIR}/cscope.out
export CSCOPE_DB
echo "cscope setup done."
