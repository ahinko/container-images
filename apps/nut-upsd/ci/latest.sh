#!/usr/bin/env bash
version=$(curl -sX GET "https://api.github.com/repos/networkupstools/nut/releases/latest" | jq --raw-output '.tag_name')
version="${version#*v}"
version="${version%-*}"
printf "%s" "${version}"