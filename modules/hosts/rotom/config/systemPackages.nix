# modules/hosts/rotom/config/systemPackages.nix
{
  flake.modules.nixos.rotom =
    {
      pkgs,
      unstable,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        obsidian
        element-desktop
        krita
        kitty
        wget
        git
        git-lfs
        yazi
        killall
        stow
        wl-clipboard
        unzip
        starship
        dig
        kdePackages.filelight
        ansible
        rofi
        hello
        zip
        file
        openssl
        #cisco-packet-tracer_9
      ];
    };
}
