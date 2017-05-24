#!/bin/sh

sed -i 's/\$CLUSTER_NAME/'"$CLUSTER_NAME"'/g' /config/.kube/config
sed -i 's#\$CLUSTER_SERVER#'"$CLUSTER_SERVER"'#g' /config/.kube/config
sed -i 's/\$CLUSTER_CA/'"$CLUSTER_CA"'/g' /config/.kube/config
sed -i 's/\$CLUSTER_USER/'"$CLUSTER_USER"'/g' /config/.kube/config
sed -i 's/\$CLUSTER_TOKEN/'"$CLUSTER_TOKEN"'/g' /config/.kube/config
sed -i 's/\$CLUSTER_CLIENT_KEY/'"$CLUSTER_CLIENT_KEY"'/g' /config/.kube/config
sed -i 's/\$CLUSTER_CLIENT_CA/'"$CLUSTER_CLIENT_CA"'/g' /config/.kube/config

exec /usr/local/bin/kubectl  "$@"