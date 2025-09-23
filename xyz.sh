#!/bin/bash

TAG=v1.0.0
YOU=ppremru
MESSAGE="hello from the build process..."

# build ..
echo "Build"
podman build -t xyz .
podman images
read -p "press enter to continue"

echo "Run"
podman run -d -p 8080:8080 --name xyz-app -e MESSAGE="${MESSAGE}" localhost/xyz:latest
podman ps
read -p "press enter to continue"

# test 
echo "Test"
curl http://localhost:8080
echo
read -p "...press enter to continue"


# cleanup 
echo Cleanup
podman stop xyz-app
podman rm xyz-app
#podman rmi localhost/xyz:latest
read -p "...press enter to continue"

# Registry deeds
echo "Push to quay.io"
echo "Did you do this already?: podman login quay.io"
read -p "...press enter to continue"
podman push xyz quay.io/${YOU}/xyz:${TAG}

# some git chores that might be done ...
# git tag -a $TAG -m "Release version ${TAG}"
# git push origin $TAG
echo "All done"
read -p "...press enter to continue"
