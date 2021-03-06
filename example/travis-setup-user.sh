#!/bin/bash
set -e
echo "Running travis travis-setup-user.sh"

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Use travis commit
SETUP_VERSION=${TRAVIS_COMMIT_RANGE##*...}

## Install Ansible 1.9.4
ANSIBLE_VERSIONS[0]="1.9.4"
INSTALL_TYPE[0]="pip"
ANSIBLE_V1_PATH="${ANSIBLE_VERSIONS[0]}"    # v1

## Install Ansible stable-2.0
ANSIBLE_VERSIONS[1]="stable-2.0"
INSTALL_TYPE[1]="git"
ANSIBLE_V2_PATH="${ANSIBLE_VERSIONS[1]}"  # v2

## Install Ansible stable-2.0
ANSIBLE_VERSIONS[2]="devel"
INSTALL_TYPE[2]="git"
ANSIBLE_DEV_PATH="${ANSIBLE_VERSIONS[2]}"  # devel

# Add user for test
sudo useradd -m -c "travis-setup" travis-setup -s /bin/bash
export SETUP_USER=travis-setup

# Whats the default version
ANSIBLE_DEFAULT_VERSION="v1"

## Create a temp dir
filename=$( echo ${0} | sed  's|/||g' )
my_temp_dir="$(mktemp -dt ${filename}.XXXX)"
## Get setup
curl -s https://raw.githubusercontent.com/AutomationWithAnsible/ansible-setup/$SETUP_VERSION/setup.sh -o $my_temp_dir/setup.sh
## Run the setup
. $my_temp_dir/setup.sh

