{config, pkgs, lib, ... }:
{
  options = {
    tmux.enable = lib.mkEnableOption "Enable Tmux configuration";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true; # Habilita o Tmux no sistema
      extraConfig = ''
# ----- Tecla prefix padrão -----
# Alterar a tecla prefix de C-b para C-s
      set -g prefix C-s

# Ativar suporte ao mouse
      set -g mouse on

set -g default-terminal "tmux-256color"
set-option -ga terminal-overrides ",xterm-256color:Tc"
set -g status-style bg=default

# ----- Movimentação entre painéis (inspirado no Vim) -----
      bind-key h select-pane -L  # Move para o painel à esquerda
      bind-key j select-pane -D  # Move para o painel abaixo
      bind-key k select-pane -U  # Move para o painel acima
      bind-key l select-pane -R  # Move para o painel à direita


# ----- Outras configurações -----
# Posicionar a barra de status na parte superior
      set-option -g status-position top
      '';
    };
  };
}
