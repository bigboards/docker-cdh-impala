#!/bin/bash
DAEMON_FLAGS="${IMPALA_CATALOG_ARGS} --redirect_stdout_stderr=false"
/usr/bin/catalogd ${DAEMON_FLAGS}