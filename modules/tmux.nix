{config, pkgs, lib, ... }:
{
    options = {
        tmux.enable = lib.mkEnableOption "Enable Tmux configuration";
    };

    config = lib.mkIf config.tmux.enable {
        programs.tmux = {
            enable = true; # Habilita o Tmux no sistema
            plugins = with pkgs.tmuxPlugins; [ 
            vim-tmux-navigator
            ];
                extraConfig = ''
# ----- Configuração Geral -----
                    set -g prefix C-d            # Alterar prefix para Ctrl + S
                    set -g mouse on              # Ativar suporte ao mouse
                    set -g default-terminal "tmux-256color"
                    set-option -ga terminal-overrides ",xterm-256color:Tc"

# ----- Movimentação entre painéis -----
                    bind-key h select-pane -L    # Painel à esquerda
                    bind-key j select-pane -D    # Painel abaixo
                    bind-key k select-pane -U    # Painel acima
                    bind-key l select-pane -R    # Painel à direita

# ----- Split de painéis -----
                    bind-key ~ split-window -h   # Split vertical
                    bind-key ; split-window -v   # Split horizontal

# ----- Gerenciamento de Janelas -----
                    bind-key r command-prompt "rename-window %%"   # Renomear janela
                    bind-key Tab last-window                       # Alternar para última janela
                    bind-key x kill-pane                           # Fechar painel
                    bind-key z resize-pane -Z                      # Alternar zoom

# ----- Aparência -----
                    set-option -g status-position top
                    set -g status-style bg=default
                    set -g pane-active-border-style fg="#e35b22"
                    set -g pane-border-style fg="#653b27"
                    set -g status-style bg="#0a506e" fg="#cc8f62"
                    set -g window-status-format "#I #W"
                    set -g window-status-style bg="#585f62" fg="#cc8f62"
                    set -g window-status-current-style bg="#e35b22" fg="#84dcd4"
                    set -g status-left "#[bg=#66a1b8,fg=#000000] #S #[bg=#66a1b8,fg=#84dcd4]"
                    set -g status-right "#[fg=#cc8f62] %Y-%m-%d #[fg=#84dcd4] %H:%M #[default]"
                    '';
        };
    };
}
