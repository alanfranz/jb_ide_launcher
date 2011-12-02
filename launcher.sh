#!/usr/bin/env bash
LAUNCHER_FILE=$1
CLASS_NAME=$2

FULL_LAUNCHER_PATH=$(readlink -f $(which ${LAUNCHER_FILE}))
FULL_LAUNCHER_DIR=$(dirname ${FULL_LAUNCHER_PATH})
THIS_DIR=$(dirname $(readlink -f $0))

if [ ! -e ${FULL_LAUNCHER_DIR}/agent.jar ] 
then
	cp ${THIS_DIR}/agent.jar ${FULL_LAUNCHER_DIR}
fi

cd $FULL_LAUNCHER_DIR
sed -r -e 's|(\$[A-Z]*_?JDK/bin/java) (\$JVM_ARGS)|\1 '"-javaagent:agent.jar=${CLASS_NAME} \2|" $FULL_LAUNCHER_PATH |  bash -s
