#!/usr/bin/env bash
LAUNCHER_FILE=$1
CLASS_NAME=$2

trap "Error while executing script, aborted." ERR

FULL_LAUNCHER_PATH=$(readlink -f $(which ${LAUNCHER_FILE}))
if [ ! -e "${FULL_LAUNCHER_PATH}" ]
then
	echo "Could not find $LAUNCHER_FILE, please specify its full path or make it available in PATH."
	exit 1
fi

FULL_LAUNCHER_DIR=$(dirname ${FULL_LAUNCHER_PATH})
THIS_DIR=$(dirname $(readlink -f $0))

if [ ! -e ${FULL_LAUNCHER_DIR}/agent.jar ] 
then
	cp ${THIS_DIR}/agent.jar "${FULL_LAUNCHER_DIR}" 
fi

cd $FULL_LAUNCHER_DIR
sed -r -e 's|(\$[A-Z]*_?JDK/bin/java) (\$JVM_ARGS)|\1 '"-javaagent:agent.jar=${CLASS_NAME} \2|" $FULL_LAUNCHER_PATH |  bash -s
