{
  lib,
  pkgs,
  pwnvim,
  ...
}: {
  # Configuration Home Manager

  home = {
    stateVersion = "24.05";
    packages = [
      pkgs.ripgrep
      pkgs.fd
      pkgs.curl
      pkgs.less
      pwnvim.packages."aarch64-darwin".default
    ];
    sessionVariables = {
      PAGER = "less";
      CLICLOLOR = 1;
      EDITOR = "nvim";
    };
  };

  #Configuration of all our programs via Home Manager
  programs = {
    # Configuration of git
    git = {
      enable = true;
      userName = "DjCoke";
      userEmail = "erwin.vd.glind@me.com";
    };

    vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      mutableExtensionsDir = false;
      extensions = with pkgs.vscode-extensions; [
        yzhang.markdown-all-in-one
        ms-vscode-remote.remote-ssh
        mhutchie.git-graph
        jnoortheen.nix-ide
      ];

      #User Settings
      userSettings = {
        # General
        "editor.fontSize" = 16;
        "editor.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
        "window.zoomLevel" = 1;
        "workbench.startupEditor" = "none";
        "explorer.compactFolders" = false;
        # Whitespace
        "files.trimTrailingWhitespace" = true;
        "files.trimFinalNewlines" = true;
        "files.insertFinalNewline" = true;
        "diffEditor.ignoreTrimWhitespace" = false;
        # Git
        "git.enableCommitSigning" = true;
        "git-graph.repository.sign.commits" = true;
        "git-graph.repository.sign.tags" = true;
        "git-graph.repository.commits.showSignatureStatus" = true;
        # Styling
        "window.autoDetectColorScheme" = true;
        "workbench.preferredDarkColorTheme" = "Default Dark Modern";
        "workbench.preferredLightColorTheme" = "Default Light Modern";
        "workbench.iconTheme" = "material-icon-theme";
        "material-icon-theme.activeIconPack" = "none";
        "material-icon-theme.folders.theme" = "classic";
        # Other
        "telemetry.telemetryLevel" = "off";
        "update.showReleaseNotes" = false;
      };
    };

    # Replacement of cat
    bat = {
      enable = true;
      config.theme = "TwoDark";
    };

    # Configuration of the Fuzzy Finder
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    # Configuration of exa which is a ls replacement
    eza.enable = true;

    # Configutation of zsh
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {ls = "ls --color=auto -F";};
      history.size = 10000;
      history.share = true;
    };

    #Configuration of Starship
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    # Configuration of Alacritty
    alacritty = {
      enable = true;

      # Settings of Alacritty
      settings = {
        font = {
          normal.family = "MesloLGS Nerd Font Mono";
          size = 16;
        };

        window = {
          opacity = 1.0;
          padding = {
            x = 24;
            y = 24;
          };
        };
      };
    };
  };
}
