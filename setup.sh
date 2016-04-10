#!/bin/bash

docker_installed() {
  type docker
  return $?
}

install_docker() {
  # Steps following https://docs.docker.com/linux/step_one/
  sudo apt-get udpate -y
  sudo apt-get install curl vim -y
  curl -fsSL https://get.docker.com/ | sh
  sudo usermod -aG docker -y
  echo "Docker Installed."
}

put_dockerfile() {
  cp -p /Vagrant/Dockerfile ./
}

if [ docker_installed ]; then
  echo "Docker already installed."
  exit 0
else
  install_docker
fi

put_dockerfile
