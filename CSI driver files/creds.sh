#!/bin/bash
openssl s_client -showcerts -connect 192.168.192.210:443 </dev/null 2>/dev/null | openssl x509 -outform PEM > ca_cert_0.pem
kubectl create secret generic unity-certs-0 --from-file=cert-0=ca_cert_0.pem -n unity
kubectl create secret generic unity-creds -n unity --from-file=config=secret.json
