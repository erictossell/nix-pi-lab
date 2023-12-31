{ config, pkgs, hostName, address, SSID, SSIDpass, interface, ... }:
{
  age.secrets."wireless.env" = {
    file = ../../secrets/wireless.age;
    path = "/run/secrets/wireless.env";
  };

  networking = {
    inherit hostName;
    useDHCP = false;
    wireless = {
      enable = true;
      environmentFile = "/run/secrets/wireless.env";
      networks = { "@SSID@".psk = "@SSIDpass@"; };
    };
    interfaces.${interface}.ipv4.addresses = [{
      inherit address;
      prefixLength = 24;
    }];
    defaultGateway = {
      address = "10.0.0.1";
      inherit interface;
    };
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

}
