# razee-cluster-cleaner
A quick method for pruning old clusters (and their deployment data) from Razeedash (https://razee.io)

## What is this?
This project contains everything you need to build a container image that will clean up unwanted old cluster and deployment data in your Razeedash deployment.

## Prerequisites
* [buildah](https://buildah.io)
* Razeedash deployed on a Kubernetes cluster
* kubectl (with your KUBECONFIG already set up to access the Kubernetes cluster where Razeedash is deployed

## Building the image
To build the image simply run the `build-image.sh` script, passing in the string to be used as the name for the resulting image. (e.g. jpapejr/razee-cluster-cleaner). Push the image to a image repository that your Kubernetes cluster can reach, and you're good. 

## Running the cleaner
The cleaner is implemented as a [Kubernetes Job](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/). There are just a few tweaks in the `job.yaml` you need to make for each cluster you want to prune. Those should be pretty self-explanatory once you look at the `job.yaml` file. 
