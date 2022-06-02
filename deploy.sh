docker build -t xadamus/docker-sandbox-client:latest -t xadamus/docker-sandbox-client:$SHA -f ./client/Dockerfile ./client
docker build -t xadamus/docker-sandbox-server:latest -t xadamus/docker-sandbox-server:$SHA -f ./server/Dockerfile ./server
docker build -t xadamus/docker-sandbox-worker:latest -t xadamus/docker-sandbox-worker:$SHA -f ./worker/Dockerfile ./worker

docker push xadamus/docker-sandbox-client:latest
docker push xadamus/docker-sandbox-server:latest
docker push xadamus/docker-sandbox-worker:latest
docker push xadamus/docker-sandbox-client:$SHA
docker push xadamus/docker-sandbox-server:$SHA
docker push xadamus/docker-sandbox-worker:$SHA

kubectl apply -f k8s/
kubectl set image deployments/server-deployment server=xadamus/docker-sandbox-server:$SHA
kubectl set image deployments/client-deployment client=xadamus/docker-sandbox-client:$SHA
kubectl set image deployments/worker-deployment worker=xadamus/docker-sandbox-worker:$SHA
