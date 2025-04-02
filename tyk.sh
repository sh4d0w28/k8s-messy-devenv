helm repo add tyk-helm https://helm.tyk.io/public/helm/charts/
helm repo update
helm show values tyk-helm/tyk-oss > values.yaml
helm install tyk-oss tyk-helm/tyk-oss -n tyk --create-namespace -f values.yaml

kubectl port-forward svc/gateway-svc-tyk-oss-tyk-gateway 8080:8079 -n tyk > logs/tyk.log 2>&1 &
