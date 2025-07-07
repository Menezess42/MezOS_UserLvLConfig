{config, pkgs, lib,...}:
{
  home.username = "menezess42";
  home.homeDirectory = "/home/menezess42";
  home.stateVersion = "25.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree=true;
  imports = [
    ./modules/zsh.nix
    ./modules/tmux.nix
  ];
  zsh.enable=true; tmux.enable=true;
  home.packages = with pkgs; [
  # neovim
  xclip
  libreoffice
  libresprite
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
    gvfs
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
  unzip
  # Emacs Vterm
    cmake
  gnumake
  libtool
  automake
  pkg-config
  libvterm
  # pandoc
  pandoc
  python311Packages.pandocfilters # (opcional, explicado abaixo)
  vscode
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  stylix ={
    enable=true;
    image = ./wall.png;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    override = {
 base00 = "22303c";  # Fundo acinzentado azulado, confortável
  base01 = "2e3c48";  # Cinza escuro para status bars
  base02 = "3b4a56";  # Cinza médio para linhas ou blocos secundários
  base03 = "56636f";  # Comentários (cinza mais visível)
  base04 = "81a1c1";  # Azul claro (constantes, destaque leve)
  base05 = "d8dee9";  # Texto principal
  base06 = "e5e9f0";  # Brancos suaves, para negrito ou títulos
  base07 = "eceff4";  # Branco mais puro (não muito usado)
  base08 = "bf616a";  # Vermelho suave (erros, palavras-chave)
  base09 = "d08770";  # Laranja queimado (funções)
  base0A = "ebcb8b";  # Amarelo desaturado (tipos, avisos)
  base0B = "a3be8c";  # Verde suave (strings)
  base0C = "88c0d0";  # Ciano claro (built-in, números)
  base0D = "81a1c1";  # Azul para variáveis
  base0E = "b48ead";  # Roxo suave (keywords secundárias)
  base0F = "5e81ac";  # Azul escuro (debug, outros)
    };
    autoEnable = true;
  };
}
