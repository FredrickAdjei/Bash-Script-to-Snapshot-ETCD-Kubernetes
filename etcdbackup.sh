#! /bin/bash

# Check if the snapshot file name argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <snapshot_filename>"
  exit 1
fi

# Set the etcdctl API version
ETCDCTL_API=3

# Set the etcdctl binary path (if it's not in your PATH)
ETCDCTL_BINARY="/path/to/etcdctl"

# Set the snapshot directory
SNAPSHOT_DIR="/path/to/snapshot/directory"

# Get the snapshot file name from the command-line argument
SNAPSHOT_FILE="$1"

# Set etcd endpoint and authentication details
ETCD_ENDPOINT="https://127.0.0.1:2379"
ETCD_CACERT="/etc/kubernetes/pki/etcd/ca.crt"
ETCD_CERT="/etc/kubernetes/pki/etcd/server.crt"
ETCD_KEY="/etc/kubernetes/pki/etcd/server.key"

# Create the snapshot directory if it doesn't exist
mkdir -p "$SNAPSHOT_DIR"

# Create the etcd snapshot
"$ETCDCTL_BINARY" --endpoints="$ETCD_ENDPOINT" \
  --cacert="$ETCD_CACERT" \
  --cert="$ETCD_CERT" \
  --key="$ETCD_KEY" \
  snapshot save "$SNAPSHOT_DIR/$SNAPSHOT_FILE"

