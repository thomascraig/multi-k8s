docker build -t vacaccdevops/multi-client:latest -t vacaccdevops/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vacaccdevops/multi-server:latest -t vacaccdevops/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vacaccdevops/multi-worker:latest -t vacaccdevops/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push vacaccdevops/multi-client:latest
docker push vacaccdevops/multi-server:latest
docker push vacaccdevops/multi-worker:latest
docker push vacaccdevops/multi-client:$SHA
docker push vacaccdevops/multi-server:$SHA
docker push vacaccdevops/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=vacaccdevops/multi-server:$SHA
kubectl set image deployments/client-deployment client=vacaccdevops/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=vacaccdevops/multi-worker:$SHA