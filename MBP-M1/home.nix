{ config, pkgs, ... }:

{
  # # 注意修改这里的用户名与用户目录
  # home.username = "chikejian";
  # home.homeDirectory = "/home/chikejian";

  home.packages = with pkgs;[
    nixpkgs-fmt
    devenv
    nil

    # Development environment
    nodePackages.pnpm
    nodePackages.npm
    git-lfs

    #Dev Tools
    android-tools
    binutils
    protobuf


    iterm2
    # Useful tools
    rectangle

    #GUI App
    vscode
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "chiichen";
    userEmail = "chiichen@qq.com";
  };
  programs.direnv.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  home.sessionPath = [

  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
