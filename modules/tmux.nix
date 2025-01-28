{ config, pkgs, lib, ... }:
{
  options = {
    tmux.enable = lib.mkEnableOption "Enable Tmux configuration";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true; # Habilita o Tmux no sistema
      defaultTerminal = "screen-256color"; # Define o terminal padrão para suportar 256 cores
      extraConfig = ''
      '';
    };
  };
}
