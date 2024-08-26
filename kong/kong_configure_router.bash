#/bin/bash
kubectl apply -f - <<EOF
apiVersion: configuration.konghq.com/v1
kind: KongIngress
metadata:
  name: devops-route
route:
  paths:
  - /devops
  strip_path: false 
  preserve_host: false
  protocols:
  - http
  - https
  service:
    name: devops-server 
    port: 80
EOF