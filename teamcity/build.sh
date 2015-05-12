#!/bin/bash
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

#echo "$username $email"

docker login --username="$username" --password="$password" --email="$email" quay.io

GIT_SHA="$tag" make push-images
