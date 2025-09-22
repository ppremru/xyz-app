# CI Life

Just an easy peasy example of the CI flow ...

## Local Build and Test

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

## Next Step

Excellent, that's a key milestone. You've now confirmed the first step of your CI workflow is working via the local build.

The next logical step in your CI process is to **build the production-ready image** and **push it to the container registry**. This makes the image available for your OpenShift cluster to pull for deployment.

-----

### Step 1: Log in to the Registry

Before you can push an image, you must log in to the registry from your terminal.

```bash
podman login quay.io
```

Enter your Quay.io username and password when prompted.

-----

### Step 2: Push the Container Image

Once logged in, use the `podman push` command to send your local `xyz` image to the Quay.io registry with a specific version tag, such as `vtest`.

```bash
podman push xyz quay.io/username/xyz:version
```

This command does the following:

  * `podman push`: The command to push a container image.
  * `xyz`: The name of your local image.
  * `quay.io/username/xyz:version`: The **full path** to the destination registry and the new image tag. The `vtest` tag signifies this is the new version your CI pipeline will create.

### Go admire

Login to quay.io with your id, and confirm the image is tagged.  ALSO, go to the settings and make it public.
