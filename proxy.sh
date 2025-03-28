# enable ES
touch logs/elastic.log
nohup kubectl port-forward svc/elasticsearch 9200:9200 -n elastic > logs/elastic.log 2>&1 &

# enable kafka
touch logs/kafka.log
touch logs/kafka-ui.log
nohup kubectl port-forward svc/kafkasrv 9092:9092 -n kafka > logs/kafka.log 2>&1 &
nohup kubectl port-forward svc/kafka-ui 8080:8080 -n kafka > logs/kafka-ui.log 2>&1 &

# enable db
touch logs/mysql.log
touch logs/postgres.log
nohup kubectl port-forward svc/mysql 3306:3306 -n db > logs/mysql.log 2>&1 &
nohup kubectl port-forward svc/postgres 5432:5432 -n db > logs/postgres.log 2>&1 &

# enable redis
touch logs/redis.log
nohup kubectl port-forward svc/redis 6379:56379 -n redis > logs/redis.log 2>&1 &
