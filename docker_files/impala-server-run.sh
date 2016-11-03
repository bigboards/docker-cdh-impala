#!/bin/bash
DAEMON_FLAGS="${IMPALA_SERVER_ARGS} --redirect_stdout_stderr=false"
/usr/bin/impalad ${DAEMON_FLAGS}