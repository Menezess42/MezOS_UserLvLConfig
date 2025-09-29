{config, pkgs, lib,...}:
{
	options = {
		zsh.enable = lib.mkEnableOption "Enable zsh config";
	};
	config = lib.mkIf config.zsh.enable{
		programs.zsh = {

			enable = true;
			enableCompletion = true;
			autosuggestion.enable = true;
			syntaxHighlighting.enable = true;
			defaultKeymap = "viins";
			history = {
				size = 10000;
				path = "${config.xdg.dataHome}/zsh/history";
			};
			autocd = true;
			shellAliases = {
				"ll" = "exa --icons";
				"la" = "exa --icons -a";
				"lt" = "exa --tree --icons --level=2";
				".." = "cd ..";
				"cls" = "clear";
				"d" = "/mnt/hdmenezess42/";
				"home" = "~/.config/home-manager/";
                "gp" = "/mnt/hdmenezess42/GitProjects/";
                "bh" = "home-manager switch --show-trace";
                "bn" = "sudo nixos-rebuild switch";
                "ngc" = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
                "mvimconf" = "~/.config/home-manager/MezVim";
                "electron" = "/nix/store/mb6bpapdxnryb4hhz35d492c1zkxcbmr-electron-unwrapped-37.4.0/libexec/electron/electron"
			};
			zplug={
				enable = true;
				plugins = [
				{name = "romkatv/powerlevel10k"; tags = [as:theme];}
				];
			};
#source ~/.p10k.zsh
				# source ${./.p10k.zsh}
initExtra = ''
  source ${config.home.homeDirectory}/.p10k.zsh
  eval "$(direnv hook zsh)"
  export PATH="$HOME/.config/home-manager/bashscript:$PATH"
'';
		};
	};
}
