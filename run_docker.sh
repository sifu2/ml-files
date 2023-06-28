#!/bin/bash
export BIND_URL="0.0.0.0:8001";
export SECRET_WORD="motherland!";
gunicorn main:app -k uvicorn.workers.UvicornWorker -b $BIND_URL --env SECRET_WORD=$SECRET_WORD --log-config logging.conf
