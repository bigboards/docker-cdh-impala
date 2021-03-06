#!/bin/bash
IMPALA_CONF_DIR=${IMPALA_CONF_DIR:-/etc/impala/conf}
[ -n "${IMPALA_CONF_DIR}" -a -r ${IMPALA_CONF_DIR}/impala-env.sh ] && . ${IMPALA_CONF_DIR}/impala-env.sh

DAEMON_FLAGS="${IMPALA_SERVER_ARGS} -redirect_stdout_stderr=false -alsologtostderr=true"

echo "ENV for impala-server"
echo $DAEMON_FLAGS
/usr/bin/impalad ${DAEMON_FLAGS}