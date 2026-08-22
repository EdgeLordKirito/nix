# modules/hosts/rotom/config/fonts.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      ...
    }:
    {
      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
      ];

      fonts.fontconfig.useEmbeddedBitmaps = true;
    };
}
