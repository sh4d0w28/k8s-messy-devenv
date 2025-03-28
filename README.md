minikube start --memory=7923 --cpus=4 

## Deploy k8s pods
```sh
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
```

## Proxy pods to local

```sh
# enable ES
nohup kubectl port-forward svc/elasticsearch 9200:9200 -n elastic > logs/elastic.log 2>&1 &

# enable kafka
nohup kubectl port-forward svc/kafkasrv 9092:9092 -n kafka > logs/kafka.log 2>&1 &
nohup kubectl port-forward svc/kafka-ui 8080:8080 -n kafka > logs/kafka-ui.log 2>&1 &

# enable db
nohup kubectl port-forward svc/mysql 3006:3006 -n db > logs/mysql.log 2>&1 &
nohup kubectl port-forward svc/postgres 5432:5432 -n db > logs/postgres.log 2>&1 &

# enable redis
nohup kubectl port-forward svc/redis 6379:56379 -n redis > logs/redis.log 2>&1 &
```
