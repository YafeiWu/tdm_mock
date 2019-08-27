#!/usr/bin/env bash

cp ~/.ssh/id_rsa id_rsa
sudo docker build --no-cache -t tdm_mock .
rm -f id_rsa
