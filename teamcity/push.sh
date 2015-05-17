#!/bin/bash
set -e
set -o pipefail

while getopts "u:p:e:t:" optname
  do
    case "$optname" in
      "u")
        username=$OPTARG
        ;;
      "p")
        password=$OPTARG
        ;;
      "e")
        email=$OPTARG
        ;;
      "t")
        tag=$OPTARG
        ;;
    esac
  done


docker login --username="$username" --password="$password" --email="$email" \
  quay.io

make push-images git_sha="$tag"
