#!/bin/bash

namespace="dbscale"
branch="spdb-ccc"
commit_id="${1}"
kubectl set image -n "${namespace}" "deployment/dbscale-ui" dbscale-ui="bsg-dbscale-docker.pkg.coding.net/dbscale-kube/images/dbscale-ui:${branch}-${commit_id}"
