{ config, pkgs, lib, ... }:
{
  options = {
    tmux.enable = lib.mkEnableOption "Enable Tmux configuration";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true; # Habilita o Tmux no sistema
      #defaultTerminal = "screen-256color"; # Define o terminal padrão para suportar 256 cores
      extraConfig = ''
        # Define o prefixo padrão do Tmux (Ctrl+A)
        set -g prefix C-Space
        bind C-Space send-prefix

        # Facilita alternar entre os painéis (splits)
        bind | split-window -h # Divisão horizontal
        bind - split-window -v # Divisão vertical
        bind h select-pane -L # Mover para o painel à esquerda
        bind l select-pane -R # Mover para o painel à direita
        bind j select-pane -D # Mover para o painel abaixo
        bind k select-pane -U # Mover para o painel acima

        # Configuração do histórico do scrollback
        set-option -g history-limit 10000

        # Ativa o modo mouse
        set-option -g mouse on

        # Melhor visualização de status
        # set-option -g status-bg black
        # set-option -g status-fg green
        set-option -g status-interval 5

        # Renomear a janela automaticamente com base no processo em execução
        set-option -g automatic-rename on

        # Melhor suporte a copiar e colar no terminal
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"

        # Atalhos adicionais para gerenciar janelas
        bind c new-window # Criar uma nova janela
        bind w choose-window # Listar janelas abertas
        bind n next-window # Alternar para a próxima janela
        bind p previous-window # Alternar para a janela anterior
      '';
    };
  };
}
