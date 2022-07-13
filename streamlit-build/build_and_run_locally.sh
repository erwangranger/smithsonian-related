#!/bin/bash

podman build -t dap_app:v01 -f Dockerfile .

podman run --rm -p 8080:8080 dap_app:v01
