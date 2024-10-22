#! /bin/bash
nixos-generate-config --root /mnt
cp ./configuration.nix /mnt/etc/nixos/configuration.nix