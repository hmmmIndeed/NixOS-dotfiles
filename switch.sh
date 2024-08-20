#!/bin/bash

echo -e '\e[1;34m── nix flake update\e[0m';
nix flake update
#echo -e '\e[1;34m  ── home-manager switch -b backup\e[0m';
#home-manager switch -b backup
echo -e '\e[1;34m  ── rm /home/asulk/.config/fcitx5/profile\e[0m';
rm /home/asulk/.config/fcitx5/profile
echo -e '\e[1;34m── home-manager switch --flake .\e[0m';
home-manager switch --flake .
echo -e '\e[1;34m── sudo nixos-rebuild switch --flake .\e[0m';
sudo nixos-rebuild switch --flake .
