{ config, pkgs, lib, ... }:
{
  options = {
    tmux.enable = lib.mkEnableOption "Enable Tmux configuration";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true; # Habilita o Tmux no sistema
      extraConfig = ''
        # Change leader key
      set -g prefix C-s 

        # Activate mouse
      set -g mouse on

        # Change moviment from arrowkeys to vim motions
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g status-position top 
      '';
    };
  };
}
