{ pkgs ? import(fetchTarball("https://github.com/NixOS/nixpkgs/archive/d51f8579f03a76718d643dd184ae964e6f0dd751.tar.gz")) {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    vim
    neovim
    vim-language-server
    vim-vint
  ];
}
