#!/bin/bash

oc new-project dap-app

oc -n dap-app\
    new-app \
    https://github.com/erwangranger/smithsonian-related.git#main \
    --context-dir=streamlit-build \
    --docker-image=python:3.10.4 \
    --strategy=docker \
    --name=dap-app \
    --dry-run=true

oc expose service/smithsonian-related

