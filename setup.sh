#!/bin/bash
set -xe pipefail

# As root
./scripts/packages.sh
./scripts/services.sh

useradd -m -G wheel,docker dev 
./scripts/shell.sh

# As User
su - dev
  ./scripts/omzsh.sh
  exit 0

exit 0 

