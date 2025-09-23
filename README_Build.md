# Build and Test Image

Just an easy peasy example of building and running an image with podman.

## The Podman Life

To build and run your xyz.py application locally in a container with Podman, you'll follow a three-step process: first, build the container image from your Dockerfile, then run a container from that image.  And lastly, clean up ...

### Step 1\. Build the Container Image

Navigate to the directory containing your `app.py`, `requirements.txt`, and `Dockerfile`. Then, use the `podman build` command to create the image and tag it with the name `xyz`.

```bash
podman build -t xyz .
```

This command instructs Podman to:

  * `build`: Create a new image using the `Dockerfile` in your current directory (`.`).
  * `-t xyz`: Tag the resulting image with the name `xyz`, which makes it easy to reference later.

-----

### Step 2\. Run and Test the Application

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

You should see the output: `Message: Hello from podman`

-----

### 3\. Stop and Remove the Container

When you're finished, you can stop and remove the container to free up resources.

```bash
podman stop xyz-app
podman rm xyz-app
```

## Conclusion

Excellent, that's a key milestone. You've now confirmed the first step of your CI workflow via a local build.
