{ config, nixpkgs, ... }: {
  imports = [
    ./starship
    ./hypr
    ./eww
    ./fish
    ./waybar
  ];
}
