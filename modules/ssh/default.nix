{ config, pkgs, user, ... }:
{
 
  users.users.${user} = {
	openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAETSTzRnvYIQsOwhdwcbVRyZVnP6/F3b+inurb9+RMu ${user}" ];
  };
  
  services.openssh = {
	enable = true;
	ports = [ 2973 ];
	settings.PasswordAuthentication = false;
	settings.KbdInteractiveAuthentication = false;
  };
}

