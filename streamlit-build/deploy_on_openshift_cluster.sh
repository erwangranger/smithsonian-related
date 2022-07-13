#!/bin/bash

NS=dap-app

oc new-project dap-app

oc -n dap-app\
    new-app \
    https://github.com/erwangranger/smithsonian-related.git#main \
    --context-dir=streamlit-build \
    --image=python:3.10.4 \
    --strategy=docker \


echo 'waiting for service'
timeout --foreground \
    600s \
    bash -c -- \
        "until oc -n dap-app get service \
        | grep -o -E 'smithsonian'  > /dev/null 2>&1; \
        do printf '.' ; \
        sleep 5 ; \
        done"

oc  -n dap-app expose service/smithsonian-related

