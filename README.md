# App minikube
This repo contains the required resources to deploy an app into a minicluster

## Deployment

```shell
./deploy.sh 

    
   _____ _____  ______ 
  / ____|  __ \|  ____|
 | (___ | |__) | |__   
  \___ \|  _  /|  __|  
  ____) | | \ \| |____ 
 |_____/|_|  \_\______|
                       
                       
A new build just started... Stay tuned!
EPOCH:1669848172
Getting docker env...
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.49.2:2376"
export DOCKER_CERT_PATH=".minikube/certs"
export MINIKUBE_ACTIVE_DOCKERD="minikube"

# To point your shell to minikube's docker-daemon, run:
# eval $(minikube -p minikube docker-env)
Loading image...
Applying yaml...
deployment.apps/app configured
service/app unchanged
Exposing service...
http://192.168.49.2:31124
```