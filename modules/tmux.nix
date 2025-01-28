{config, pkgs, lib, ... }:
{
  options = {
    tmux.enable = lib.mkEnableOption "Enable Tmux configuration";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true; # Habilita o Tmux no sistema
      extraConfig = ''
     # Alterar a tecla prefix padrão (C-b) para C-s
        # O prefix é necessário para executar comandos no Tmux.
        set -g prefix C-s

        # Ativar suporte ao mouse para facilitar uso em terminais modernos
        set -g mouse on

        # ----- Movimentação entre painéis (inspirado no Vim) -----
        # C-s + h: Move para o painel à esquerda
        bind-key h select-pane -L  
        # C-s + j: Move para o painel abaixo
        bind-key j select-pane -D  
        # C-s + k: Move para o painel acima
        bind-key k select-pane -U  
        # C-s + l: Move para o painel à direita
        bind-key l select-pane -R  

        # ----- Configuração visual baseada no Stylix -----
        # Configurações de cores inspiradas no tema Gruvbox com ajustes personalizados

        # Fundo da barra de status (azul profundo)
        set-option -g status-bg colour0a506e
        # Texto da barra de status (cinza claro)
        set-option -g status-fg coloure5dccb

        # Painéis inativos na barra de status (marrom escuro e cinza claro)
        set-window-option -g window-status-bg colour653b27
        set-window-option -g window-status-fg coloure5dccb

        # Painel ativo na barra de status (azul médio e texto claro)
        set-window-option -g window-status-current-bg colour66a1b8
        set-window-option -g window-status-current-fg coloure5dccb

        # ----- Outras configurações -----
        # Posicionar a barra de status na parte superior
        set-option -g status-position top
      '';
    };
  };
}
