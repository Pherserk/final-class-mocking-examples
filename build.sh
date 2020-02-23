#!/usr/bin/env bash

# SETTINGS
set -o nounset -o pipefail -o errexit

IFS=$'\t\n'

sudo true

# VARIABLES

APT_UPDATED=false
DOCKER_COMPOSE_DESTINATION_PATH=/usr/local/bin/docker-compose
DOCKER_COMPOSE_VERSION=1.24.1
PROVISIONING_PATH=provisioning

# FUNCTIONS

# ensure apt-get update ran at least one time if any software installation is needed
conditional_apt_update () {
  if [ "${APT_UPDATED}" = false ]; then
    echo "Updating apt"

    sudo apt-get update -y

    $APT_UPDATED=true
  fi
}

# install Docker runtime if not available on host
conditional_install_docker_ce_runtime () {
  if [ -x "$(command -v docker)" ]; then
    echo "Docker is installed on system already"
  else
    conditional_apt_update

    echo "Installing Docker"

    sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
  fi
}

# install docker compose if not available on host
conditional_install_docker_compose()
{
  if [ -x "$(command -v docker-compose)" ]; then
    echo "docker-compose is installed on system already"
  else
    conditional_apt_update

    echo "Installing docker-compose"

    sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o "${DOCKER_COMPOSE_DESTINATION_PATH}"

    sudo chmod +x "${DOCKER_COMPOSE_DESTINATION_PATH}"
  fi
}

# INSTRUCTIONS

conditional_install_docker_ce_runtime

conditional_install_docker_compose

(cd "${PROVISIONING_PATH}" && docker-compose build && docker-compose run --rm --name=final-class-mocking-example-test-runner php-cli bash -c 'composer install;vendor/bin/phpunit -c .')
