#!/usr/bin/env bash
set -xEeuo pipefail

trap cleanup SIGINT SIGTERM ERR EXIT

repo='devops'
tag='latest'
app_name="app"
epoch=''

cleanup() {
    # Cleanup routine
    trap - SIGINT SIGTERM ERR EXIT
}

print_disclaimer() {
    # Print a nice disclaimer
    printf "
    
   _____ _____  ______ 
  / ____|  __ \|  ____|
 | (___ | |__) | |__   
  \___ \|  _  /|  __|  
  ____) | | \ \| |____ 
 |_____/|_|  \_\______|
                       
                       
"
    printf "A new build just started... Stay tuned!\n"
    printf "EPOCH:%s""$epoch""\n"
}

get_epoch() {
    epoch=$(date +%s)

}

sed_deploy_value(){
    printf "Setting DEPLOYED_AT..."
    sed -i "s/__SED_STRING__/$epoch/g" "app.yaml"
}

get_docker_env() {
    printf "Getting docker env...\n"
    eval "$(minikube -p minikube docker-env)"
}

load_docker_image() {
    printf "Loading image...\n"
    minikube image load $repo:$tag
}

start_deploy() {
    printf "Applying yaml...\n"
    kubectl apply -f app.yaml
}

expose_app() {
    printf "Exposing service...\n"
    minikube service --url $app_name
}

main() {
    get_epoch
    print_disclaimer
    sed_deploy_value
    get_docker_env
    load_docker_image
    start_deploy
    expose_app
}

main "$@"
