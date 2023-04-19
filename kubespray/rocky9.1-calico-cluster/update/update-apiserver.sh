#!/bin/bash

namespace="dbscale"
branch="spdb-ccc"
commit_id="${1}"
kubectl set image -n "${namespace}" "deployment/dbscale-apiserver" dbscale-apiserver="bsg-dbscale-docker.pkg.coding.net/dbscale-kube/images/dbscale-apiserver:${branch}-${commit_id}"
