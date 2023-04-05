#!/bin/bash

namespace="dbscale"
branch="main"
commit_id="${1}"
kubectl set image -n "${namespace}" "deployment/cluster-engine" cluster-engine="bsg-dbscale-docker.pkg.coding.net/dbscale-kube/images/cluster-engine:${branch}-${commit_id}"
