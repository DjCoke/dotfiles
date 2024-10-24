{
  config,
  lib,
  pkgs,
  ...
}: {
  home.stateVersion = "24.05";

  programs.git = {
    enable = true;
    userName = "DjCoke";
    userEmail = "erwin.vd.glind@me.com";
  };
}
