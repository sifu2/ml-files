#!/bin/bash
export BIND_URL="0.0.0.0:8001";
export SECRET_WORD="motherland!";
export WORKERS=4;
source ./venv/bin/activate && gunicorn main:app -w $WORKERS -k uvicorn.workers.UvicornWorker -b $BIND_URL --env SECRET_WORD=$SECRET_WORD --log-config logging.conf
