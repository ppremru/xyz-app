# Store the Image

The next logical step after **build the production-ready image** is to **push it to the container registry**.   
Having it in a registry, makes the image available for your OpenShift cluster to pull for deployment.

-----

## Step 1: Log in to the Registry

Before you can push an image, you must log in to the registry from your terminal. (Yes, this is a pre-req, take a few minutes to steup quay.io.)

```bash
podman login quay.io
```

Enter your Quay.io username and password when prompted.

-----

## Step 2: Push the Container Image

Once logged in, use the `podman push` command to send your local `xyz` image to the Quay.io registry with a specific version tag, such as `vtest`.

```bash
podman push xyz quay.io/username/xyz:version
```

This command does the following:

  * `podman push`: The command to push a container image.
  * `xyz`: The name of your local image.
  * `quay.io/username/xyz:version`: The **full path** to the destination registry and the new image tag. The `vtest` tag signifies this is the new version your CI pipeline will create.

## Admire Your Deeds

Login to quay.io with your id, and confirm the image is tagged.  **ALSO, go to the settings in quay.io use the settings to make the image public.**
