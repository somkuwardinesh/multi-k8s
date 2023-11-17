docker build -t dineshdocker3246/multi-client-k8s:latest -t dineshdocker3246/multi-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t dineshdocker3246/multi-server-k8s:latest -t dineshdocker3246/multi-server-k8s:$SHA -f ./server/Dockerfile ./server
docker build -t dineshdocker3246/multi-worker-k8s:latest -t dineshdocker3246/multi-worker-k8s:$SHA -f ./worker/Dockerfile ./worker

docker push dineshdocker3246/multi-client-k8s:latest
docker push dineshdocker3246/multi-server-k8s:latest
docker push dineshdocker3246/multi-worker-k8s:latest

docker push dineshdocker3246/multi-client-k8s:$SHA
docker push dineshdocker3246/multi-server-k8s:$SHA
docker push dineshdocker3246/multi-worker-k8s:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=dineshdocker3246/multi-server-k8s:$SHA
kubectl set image deployments/client-deployment client=dineshdocker3246/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=dineshdocker3246/multi-worker-k8s:$SHA
