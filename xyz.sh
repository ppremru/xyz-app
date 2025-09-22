#!/bin/bash

TAG=v1.0.0
YOU=ppremru

# build ..
podman build -t xyz .
podman run -p 8080:8080 --name xyz-app -d -e TAG=${TAG} xyz
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
podman push xyz quay.io/${YOU}/xyz:${TAG}

# some git chores that might be done ...
# git tag -a $TAG -m "Release version ${TAG}"
# git push origin $TAG

