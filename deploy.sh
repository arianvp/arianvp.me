#!/bin/bash

mkdir -p ./keys
test -e ./keys/dhparam.pem || openssl dhparam 2048 -out ./keys/dhparam.pem

nixops deploy -I $HOME/.nix-defexpr/channels/nixos
