#!/bin/bash

# how to get this path right?
podman run -it --rm -w /test -v .:/test:Z --entrypoint=/test/setup.sh fedora:42 

