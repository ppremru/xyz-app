# Application XYZ

Simple file set to form a basic workflow from source to image to deploy on OpenShift using Helm via ArgoCD.

## Heads-up

You need:
* Podman
* Quay.io setup
* git repo 

## Why this code?

Simple source files (app.py, requirements.txt, and Dockerfile) form the basic building blocks for the CI steps of your pipeline. 

*Simplicity*: It's a minimal example, easy for non-programmers to understand and programmers can focus on the workflow.
*Container-ready*: The code is designed to run in a container, listening on all network interfaces (host='0.0.0.0') on a standard port.
*CI/CD Integration*: It uses an environment variable (TAG) to view the version. Your CI pipeline can inject the version number (e.g., from a Git tag or a build number) at build time, demonstrating a key part of the CI process.

## Deploy on OpenShift or bust!

The next stage would be to create the Helm chart and ArgoCD configuration for the CD steps.


## Local
To build and run your xyz.py application locally in a container with Podman, you'll follow a two-step process: first, build the container image from your Dockerfile, then run a container from that image.

To build and run your `xyz.py` application locally in a container with **Podman**, you'll follow a two-step process: first, build the container image from your `Dockerfile`, then run a container from that image.

### 1\. Build the Container Image

Navigate to the directory containing your `app.py`, `requirements.txt`, and `Dockerfile`. Then, use the `podman build` command to create the image and tag it with the name `xyz`.

```bash
podman build -t xyz .
```

This command instructs Podman to:

  * `build`: Create a new image using the `Dockerfile` in your current directory (`.`).
  * `-t xyz`: Tag the resulting image with the name `xyz`, which makes it easy to reference later.

-----

### 2\. Run and Test the Application

Once the image is built, you can run a container from it. The `-p` flag is essential to map the container's internal port to your local machine, allowing you to access the web server.

```bash
podman run -p 8080:8080 --name xyz-app -d xyz
```

This command does the following:

  * `run`: Starts a new container.
  * `-p 8080:8080`: **Maps** the container's port 8080 to your local machine's port 8080.
  * `--name xyz-app`: Assigns a human-readable name to the container.
  * `-d`: Runs the container in detached mode (in the background).
  * `xyz`: The name of the image to run.

To verify the application is working, open a new terminal and use `curl` to send a request to your local server:

```bash
curl http://localhost:8080
```

You should see the output: `Hello, World! This is version 1.0.0.`

-----

### 3\. Stop and Remove the Container

When you're finished, you can stop and remove the container to free up resources.

```bash
podman stop xyz-app
podman rm xyz-app
```


