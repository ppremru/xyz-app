#!/bin/bash

BUILD_VERSION=v1.0.99
YOU=ppremru

# build ..
podman build -t xyz .
podman run -p 8080:8080 --name xyz-app -d -e APP_VERSION=${BUILD_VERSION} xyz
podman ps

# test 
echo Test
curl http://localhost:8080

# cleanup 
echo
echo Cleanup
podman stop xyz-app
podman rm xyz-app
#podman rmi xyz

# Registry deeds
echo "Did you do this already?: podman login quay.io"
podman push xyz quay.io/${YOU}/xyz:${BUILD_VERSION}
