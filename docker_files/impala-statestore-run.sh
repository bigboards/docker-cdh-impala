#!/bin/bash
DAEMON_FLAGS="${IMPALA_STATE_STORE_ARGS} --redirect_stdout_stderr=false"
/usr/bin/statestored ${DAEMON_FLAGS}