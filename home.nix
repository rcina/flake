{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rob";
  home.homeDirectory = "/home/rob";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

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
    htop
    libreoffice-qt
    gimp-with-plugins
    inkscape
    audacity
    hexchat
    keepassxc
    vscode-with-extensions
    kitty
    texlive.combined.scheme-full
    calibre
    vlc
    jetbrains-mono
    iosevka
    w3m
    sqlite
    texmaker 
    texstudio
    racket
    llvmPackages_16.clang-unwrapped
    ruby
    mitscheme
    jdk17
    emacsPackages.pdf-tools
    nano
    ansible
    spotify
    codeblocks
    jetbrains.pycharm-community
    filezilla
    hugo
    skypeforlinux
    clisp
    ghc
    subversion
    mercurial
    libsForQt5.kdenlive
    darktable
    krita
    mutt
    libsForQt5.kcalc
    qalculate-qt
    spyder
    ffmpeg_6-full
    yt-dlp
    mpv
    mpg123
    unetbootin
    jetbrains.idea-community
    nodejs_20
    nodenv
    anki
    sage
    pari
    gap-full
    thunderbird
    lua
    erlang
    smlnj
    ocaml
    rstudio
    pencil
    scribus
    xsane
    wireshark
    nmap
    dig
    digikam
    rustc
    rustfmt
    go
    coreutils-prefixed
    util-linux
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".emacs.d" = {
	source = pkgs.fetchFromGitHub {
		owner = "rcina";
		repo = "dotemacs";
		rev = "d085999";
		hash = "sha256-oPTpOfvy+EWgeAhd6fUGyAB3finhTvbKO2MGuVnk0t8";

	};
	recursive = true;
      };
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rob/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
