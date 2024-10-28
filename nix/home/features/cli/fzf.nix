{ config, lib, ... }:
with lib; let
  cfg = config.features.cli.fzf;
  in {
      options.features.cli.fzf.enable = mkEnableOption "Enable fuzzy finder";

      config = mkIf cfg.enable {
        programs.fzf = {
          enable = true;
          enableFishIntegration = true;
          enableZshIntegration = true;
          enableBashIntegration = true;
        };
      };
  }
