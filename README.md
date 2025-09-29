# Very Basic Application to Demonstrate Workflow 

An easy-peasy example of the manual steps from code to deployment.  

1.   build an image and run it (podman)
2.   push the image to an image-registry (quay.io)

Manual steps that will be you CI Integration (eg:  Jenkin's).

## Heads-up

Refer to these TWO git repositories:

1. xyz-app:     Application Code (python, Dockerfile)  Simple, very simple, python application used to demonstrate a basic workflow from source to image. 
2. xyz-gitops:  Helm Charts to manage the deployment, service and routes in Openshift (ultimately for ArgoCD to poll.)

Prepare your host with tools to experiment with:

* Install Podman (CLI)
* And of course, get your git life together
* Setup an image registry , [Quay.io](https://quay.io/repository/Quay.io)
* Install Helm 
* .. and optionally install make

## Why this code?

Simple source files (app.py, requirements.txt, and Dockerfile) form the basic building blocks for the CI steps of your pipeline. 

*Simplicity*: It's a minimal example, easy for non-programmers to understand and programmers can focus on the workflow.
*Container-ready*: The code is designed to run in a container, listening on all network interfaces (host='0.0.0.0') on a standard port.
*CI/CD Integration*: It uses an environment variable (MESSAGE) to view at runtime. Your CI pipeline can inject values, demonstrating a key part of the CI process.

## Crawl through commands ...

* [BuildAndTest](./README_Build.md)
* [PushToRegistry](./README_Registry.md)
* [FYSA - Makefile](./README_Makefile.md)

## Diagram Rough Draft 

```mermaid
---
title: Oversimplified Workflow
config:
  theme: 'base'
  themeVariables:
    primaryColor: '#FFFFFFFF'
    primaryTextColor: '#000000'
    primaryBorderColor: '#0c0909ff'
    clusterBkg: '#80808080'
    lineColor: '#0e0d0dff'
    secondaryColor: '#80808080'
---
flowchart TB
    subgraph 0[Life of DevOps]
        direction TB
        subgraph s[Source Code Git]
            direction LR
            s1[Clone] --> s2[Branch]
            s2 --> s3[Commit]
            s3 --> s4[Push to Remote]
            s4 --> s5[Merge to main]
        end
        subgraph c[Config Git]
            direction LR
            c1[Clone] --> c2[Branch]
            c2 --> c3[Commit]
            c3 --> c4[Push to Remote]
            c4 --> c5[Merge to main]
        end
        s -- "Yaml for Helm and ArgoCD" --> c
        subgraph x[Config OCP]
            direction LR
            x0{Apply} --> x1[Git Clone]
            x1 --> x2[OCP Apply]
        end
        c -- "New or Update ArgoCD GitOps" --> x
    end

    subgraph 1[CI]
        direction TB
        subgraph buildimage[Manage Image]
            direction LR
            buildimage0[Git Workflow] --> buildimage1[Podman Build Image]
            buildimage1 --> buildimage2[Podman Tag Image]
            buildimage2 --> buildimage3[Podman Login to Quay]
            buildimage3 --> buildimage4[Podman Push Image to Quay]
        end
        subgraph updateconfig[Update Config]
            direction LR
            updateimage0[Git Workflow] --> updateimage1[Update Helm Chart]
        end
        buildimage -- "Version Tag" --> updateconfig
    end


    subgraph 2[CD]
        direction TB
        subgraph OCP[OpenShift GitOps]
            direction LR
            OCP1[ArgoCD Sync Git] --> OCP2[ArgoCD Helm Deploy]
        end
    end

    Start((Start)) --> 0
    0 -- "New Code Available" --> 1
    1 -- "New Version Available" --> 2
    2 --> End((End))
```
