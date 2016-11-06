#!/bin/bash
IMPALA_LOG_DIR=${IMPALA_LOG_DIR:-/data/log/impala}
IMPALA_STATE_STORE_PORT=${IMPALA_STATE_STORE_PORT:-24000}
IMPALA_STATE_STORE_HOST=${IMPALA_STATE_STORE_HOST:-127.0.0.1}
IMPALA_BACKEND_PORT=${IMPALA_BACKEND_PORT:-22000}
IMPALA_CATALOG_SERVICE_HOST=${IMPALA_CATALOG_SERVICE_HOST:-127.0.0.1}

IMPALA_SERVER_ARGS=${IMPALA_SERVER_ARGS:- \
    -log_dir=${IMPALA_LOG_DIR} \
    -catalog_service_host=${IMPALA_CATALOG_SERVICE_HOST} \
    -state_store_port=${IMPALA_STATE_STORE_PORT} \
    -use_statestore -state_store_host=${IMPALA_STATE_STORE_HOST} \
    -be_port=${IMPALA_BACKEND_PORT}}
DAEMON_FLAGS="${IMPALA_SERVER_ARGS}"
/usr/bin/impalad ${DAEMON_FLAGS}