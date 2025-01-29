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
# ----- Tecla prefix padrão -----
# Ativar suporte ao mouse
                    set -g mouse on
                    set -g default-terminal "tmux-256color"
                    set-option -ga terminal-overrides ",xterm-256color:Tc"

# ----- Movimentação entre painéis (inspirado no Vim) -----
                    bind-key h select-pane -L  # Move para o painel à esquerda
                    bind-key j select-pane -D  # Move para o painel abaixo
                    bind-key k select-pane -U  # Move para o painel acima
                    bind-key l select-pane -R  # Move para o painel à direita

                    bind-key u split-window -v
                    bind-key o split-window -h



# ----- Outras configurações -----
# Posicionar a barra de status na parte superior
                    set-option -g status-position top


                    set -g status-style bg=default


# ----- Configuração visual baseada no Stylix -----
# Configuração de bordas dos painéis
                    set -g pane-active-border-style fg="#e35b22"  # Laranja vibrante (ativo)
                    set -g pane-border-style fg="#653b27"        # Marrom escuro (inativo)

# Barra de status
                    set -g status-style bg="#0a506e"             # Fundo escuro (azul profundo)
                    set -g status-style fg="#cc8f62"             # Texto principal (cinza claro)

# Configuração dos painéis na barra de status
                    set -g window-status-format "#I #W"         # Formato: índice + nome
                    set -g window-status-style bg="#585f62"     # Cinza mais escuro
                    set -g window-status-style fg="#cc8f62"     # Texto claro

# Painel ativo na barra de status
                    set -g window-status-current-style bg="#e35b22"  # Laranja vibrante
                    set -g window-status-current-style fg="#84dcd4"  # Fundo escuro

# Indicadores adicionais na barra de status
                    set -g status-left "#[bg=#66a1b8,fg=#000000] #S #[bg=#66a1b8,fg=#84dcd4]"  # Nome da sessão
                    set -g status-right "#[fg=#cc8f62] %Y-%m-%d #[fg=#84dcd4] %H:%M #[default]"
                    '';
        };
    };
}
