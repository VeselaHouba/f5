#!/usr/bin/env bash
mkdir -p ~/.ansible
echo "token: ${ANSIBLE_GALAXY_TOKEN}" > ~/.ansible/galaxy_token
ansible-galaxy import VeselaHouba f5_ansible
