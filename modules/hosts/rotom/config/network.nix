# modules/hosts/rotom/config/network.nix
{
  flake.modules.nixos.rotom =
    {
      ...
    }:
    {
      networking.hostName = "rotom";
      # Enable networking
      networking.networkmanager.enable = true;
      # Use iwd instead of wpa_supplicant:
      # wpa_supplicant had connection failures with Wi-Fi 7 APs advertising
      # 6 GHz/MLO links (MT7925 + kernel 6.18). iwd reliably stays on the
      # compatible 5 GHz EHT link and avoids failed 6 GHz authentication attempts.
      networking.networkmanager.wifi.backend = "iwd";
      networking.wireless.iwd.enable = true;
    };
}
