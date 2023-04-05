#!/bin/bash

namespace="dbscale"
branch="main"
commit_id="${1}"
kubectl set image -n "${namespace}" "deployment/cluster-manager" cluster-manager="bsg-dbscale-docker.pkg.coding.net/dbscale-kube/images/cluster-manager:${branch}-${commit_id}"
