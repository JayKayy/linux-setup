#!/usr/bin/env bash

set -e 

if ! (( $EUID == 0 )); then
  echo "You are not running as root. Exiting..."
  exit 1
fi

./scripts/packages.sh
./scripts/services.sh
./scripts/shell.sh

exit 0 

