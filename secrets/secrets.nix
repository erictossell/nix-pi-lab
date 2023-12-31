let
  eriim = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBh6+743NINanzS+X6QUbhhj/XN2edYxiD7TrUNclQN1";
  users = [ eriim ];
  nixboard = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO9scH83gPs0dbiliNHvnRjZDo4hCwe3R0W26SN4f7Jb";
  nixbox = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAhKvn+by6FngLSbbTdXKPAirdEAaSHnK8IQGXyXF/jQ";
  nixcube = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAgy9a9W8cIxkyylPdq4uRZKGSmZfPWPu+lbhS4XdDQy";
  systems = [ nixboard nixbox nixcube ];
in
{
  "wireless.age".publicKeys = users ++ systems;
  "tailscale.age".publicKeys = users ++ systems;
}
