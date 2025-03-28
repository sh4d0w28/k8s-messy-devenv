kubectl apply -f namespaces.yaml

# deploy es
kubectl apply -f elastic-statefulset.yaml  
kubectl apply -f elastic-service.yaml  

# deploy kafka
kubectl apply -f kafka-statefulset.yaml
kubectl apply -f kafka-ui-deployment.yaml

# deploy dbs
kubectl apply -f mysql.yaml
kubectl apply -f postgres.yaml

# deploy redis
kubectl apply -f redis.yaml

