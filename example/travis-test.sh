#!/bin/bash
set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

## Install Ansible 1.9.4
ANSIBLE_VERSIONS[0]="1.9.4"
INSTALL_TYPE[0]="pip"
ANSIBLE_V1_PATH="${ANSIBLE_VERSIONS[0]}"    # v1

## Install Ansible stable-2.0 
ANSIBLE_VERSIONS[1]="stable-2.0"
PYTHON_REQUIREMNTS[1]="$DIR/python_requirements.txt"
INSTALL_TYPE[1]="git"
ANSIBLE_V2_PATH="${ANSIBLE_VERSIONS[2]}"  # v2

# Whats the default version
ANSIBLE_DEFAULT_VERSION="ANSIBLE_VERSIONS[0]"

## Create a temp dir
filename=$( echo ${0} | sed  's|/||g' )
my_temp_dir="$(mktemp -dt ${filename}.XXXX)"

## Get setup
curl -s https://raw.githubusercontent.com/AutomationWithAnsible/ansible-setup/master/setup.sh -o $my_temp_dir/$setup.sh

## Run the setup
. $my_temp_dir/$setup.sh
