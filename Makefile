# Define variables for your application
APP_NAME := xyz
APP_CONTAINER_NAME := $(APP_NAME)-app
REPO := quay.io/ppremru/$(APP_NAME)
TAG := v1.0.0
MESSAGE := "Hello from podman"

# The default target that runs when you type 'make'
all: build run

.PHONY: build run stop test push clean

## Build the container image from the Dockerfile
build:
	podman build -t $(APP_NAME) .

## Run the container in detached mode
run:
	podman run -p 8080:8080 -e MESSAGE="${MESSAGE}" --name $(APP_CONTAINER_NAME) -d $(APP_NAME)

## Stop the running container
stop:
	podman stop $(APP_CONTAINER_NAME)

## Test the running application
test:
	@echo "Testing the application..."
	curl http://localhost:8080

## Push the tagged image to the registry
push:
	podman push $(APP_NAME) $(REPO):$(TAG)

## Clean up by stopping and removing the container
clean: stop
	podman rm $(APP_CONTAINER_NAME)
