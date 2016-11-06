#!/bin/bash
[ -n "${IMPALA_CONF_DIR}" -a -r ${IMPALA_CONF_DIR}/impala-env.sh ] && . ${IMPALA_CONF_DIR}/impala-env.sh

DAEMON_FLAGS="${IMPALA_SERVER_ARGS}"
/usr/bin/impalad ${DAEMON_FLAGS}