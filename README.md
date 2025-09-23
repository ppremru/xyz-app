# Very Basic Examples of Workflow Steps for a very simple application 

Just an easy peasy example of the manual steps from code to deployment.  This repo is about the code and the image, these steps would most likey be part of a CI integration (eg: Jenkins).

## Heads-up

Two git repositories:

1. xyz-app:     Simple, very simple, python application used to demonstrate a basic workflow from source to image. 
2. xyz-gitops:  Simple, very simple, helm charts to use with with argoCD on OpenShift.

Prepare your world:

* Install Podman on your desktop (CLI)
* And of course, get your git life together
* Setup a basic account on [Quay.io](https://quay.io/repository/Quay.io) 

## Why this code?

Simple source files (app.py, requirements.txt, and Dockerfile) form the basic building blocks for the CI steps of your pipeline. 

*Simplicity*: It's a minimal example, easy for non-programmers to understand and programmers can focus on the workflow.
*Container-ready*: The code is designed to run in a container, listening on all network interfaces (host='0.0.0.0') on a standard port.
*CI/CD Integration*: It uses an environment variable (MESSAGE) to view at runtime. Your CI pipeline can inject values, demonstrating a key part of the CI process.

## Crawl through commands ...

* [BuildAndTest](./README_Build.md)
* [PushToRegistry](./README_Registry.md)
* [FYSA - Makefile](./README_Makefile.md)
