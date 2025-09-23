# Makefile Life

There is a basic `Makefile` tailored for your manual steps to work with your `xyz` application.   

This file automates the common tasks of building, running, and managing your container.

### How to Use It

**Run commands:** You can now use simple `make` commands to automate your workflow:
  * **`make`**: This will run the default `all` target, which builds and then runs your container.
  * **`make build`**: Builds the container image.
  * **`make run`**: Runs the container.
  * **`make test`**: Tests the application with `curl`.
  * **`make clean`**: Stops and removes the container.
  * **`make push`**: Pushes the image to your repository with a tag.
