#!/usr/bin/env bash
# Clean up a Kubernetes YAML resource manifest

# TODO: spec.clusterIP*

(
  cat | \
  yq d - 'metadata.annotations' | \
  yq d - 'metadata.creationTimestamp' | \
  yq d - 'metadata.finalizers' | \
  yq d - 'metadata.generation' | \
  yq d - 'metadata.namespace' | \
  yq d - 'metadata.resourceVersion' | \
  yq d - 'metadata.uid' | \
  yq d - 'spec.clusterIP*' | \
  yq d - 'spec.clusterIP' | \
  yq d - 'spec.host' | \
  yq d - 'spec.volumeName' | \
  yq d - 'status' | \
  cat
) 2>/dev/null

# Example
# oc get pvc etherpad -o yaml \
#   | yq d - metadata.annotations \
#   | yq d - metadata.creationTimestamp \
#   | yq d - metadata.namespace \
#   | yq d - metadata.finalizers \
#   | yq d - metadata.resourceVersion \
#   | yq d - metadata.uid \
#   | yq d - spec.volumeName \
#   | yq d - status \
#   > production/01-pvc.yml
