#!/bin/bash
while getopts "u:p:e:t:" optname
  do
    case "$optname" in
      "t")
        tag=$OPTARG
        ;;
    esac
  done

make build-images git_sha="$tag"
