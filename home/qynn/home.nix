{
  config,
  pkgs,
  pkgs-kicad-7_0_10,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "qynn";
  home.homeDirectory = "/home/qynn";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    mtr
    traceroute
    pciutils
    usbutils
    conda
    nil
    obsidian
    telegram-desktop
    krita
    headsetcontrol
    headset-charge-indicator
    xournalpp
    pdfarranger
    libreoffice
    onlyoffice-bin
    vesktop
    ckan
    gnome-calculator
    ungoogled-chromium
    zoom-us
    kicad
  ];

  # Create tray target for syncthingtray
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  programs.git = {
    enable = true;

    userName = "Ethan Kessel";
    userEmail = "eqkessel@gmail.com";
  };

  programs.vscode = {
    enable = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".local/share/applications/firefox_eqkessel.desktop".source = ../../resources/firefox_profiles/firefox_eqkessel.desktop;
    ".local/share/applications/firefox_spacekobold.desktop".source = ../../resources/firefox_profiles/firefox_spacekobold.desktop;
    ".local/share/applications/ff_eqkessel128.png".source = ../../resources/firefox_profiles/ff_eqkessel128.png;
    ".local/share/applications/ff_spacekobold128.png".source = ../../resources/firefox_profiles/ff_spacekobold128.png;

    ".XCompose".source = ../../resources/.XCompose;

    ".bashrc".source = ../../resources/.bashrc;
    ".bash".source = ../../resources/.bash;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  services.syncthing = {
    enable = true;
    tray.enable = true;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/qynn/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
