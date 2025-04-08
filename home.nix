{config, pkgs, lib,...}:
{
  home.username = "menezess42";
  home.homeDirectory = "/home/menezess42";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree=true;
  imports = [
    ./modules/zsh.nix
    ./modules/tmux.nix
  ];
  zsh.enable=true;
  tmux.enable=true;
  home.packages = with pkgs; [
  # neovim
  xclip
  libreoffice
	  wl-clipboard
    lua-language-server
    eza
    bat
    cmatrix
    direnv
    terminator
    chromium
    discord
    nvtopPackages.full
    lshw
    thunderbird
    emacs
    neofetch
    btop
    pavucontrol
    arandr
    xfce.thunar
    xfce.tumbler
    mupdf
    spotify
    gcc
    ripgrep
    networkmanagerapplet
    grimblast
    obsidian
    qalculate-gtk
    git
    thefuck

  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  stylix ={
    enable=true;
    image = ./dfw_new.png;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    override = {
      base00 = "0a506e";  # Fundo escuro (azul profundo)
      base01 = "585f62";  # Cinza mais escuro para contraste sutil
      base02 = "653b27";  # Marrom escuro para elementos menos destacados
      base03 = "cc8f62";  # Comentários (marrom claro)
      base04 = "66a1b8";  # Azul médio para variáveis
      base05 = "e5dccb";  # Texto principal (cinza claro)
      base06 = "58c5cd";  # Azul ciano para destaques leves
      base07 = "548851";  # Verde suave para pequenos destaques
      base08 = "e35b22";  # Laranja vibrante (palavras-chave)
      base09 = "d19742";  # Funções (laranja suave)
      base0A = "cc8f62";  # Tipos (mesmo dos comentários)
      base0B = "84dcd4";  # Strings (ciano claro)
      base0C = "58c5cd";  # Constantes e built-in
      base0D = "66a1b8";  # Variáveis (azul médio)
      base0E = "653b27";  # Palavras-chave secundárias (marrom escuro)
      base0F = "66a1b8";  # Debug ou informativo
    };
    autoEnable = true;
  };
  MezVim = {
  enable = true;
  packageNames = ["MezVim"];
  };
}
