# Arch Linux Ansible Runner

## Build 

docker build . -t ansible-runner --build-arg SSH_PRIVATE_KEY="$(cat ./secrets/key)" SSH_PUBLIC_KEY="$(cat ./secrets/key.pub)
