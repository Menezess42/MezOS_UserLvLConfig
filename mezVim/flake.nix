{
	description = "MezVim, my neovim configuration helped by the big brain of nixCats";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		nixCats.url = "github:BirdeeHub/nixCats-nvim";
	};
	outputs = { self, nixpkgs,  ... }@inputs: let
		inherit (inputs.nixCats) utils;
	luaPath = "${./.}";
	forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
	extra_pkg_config = {
		allowUnfree = true;
	};
	dependencyOverlays = /* (import ./overlays inputs) ++ */ [
		(utils.standardPluginOverlay inputs)
	];

	categoryDefinitions = { pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
		lspsAndRuntimeDeps = {
			general = with pkgs; [
                universal-ctags
                    ripgrep
                    fd
			];
			neonixdev = {
				inherit (pkgs) nix-doc lua-language-server nixd;
			};
		};
		startupPlugins = {
			debug=with pkgs.vimPlugins;[nvim-nio];
			gitPlugins = with pkgs.neovimPlugins; [ ];
			general = with pkgs.vimPlugins; {
                always = [ 
                no-neck-pain-nvim
                nvim-highlight-colors 
                lze 
                ];
                extra = [
                oil-nvim
                nvim-web-devicons
                ];
				};
		};
        optionalPlugins = {
            debug = with pkgs.vimPlugins; {
                default = [
                    nvim-dap
                        nvim-dap-ui
                        nvim-dap-virtual-text
                ];
            };
            lint = with pkgs.vimPlugins; [
                conform-nvim
            ];
            format = with pkgs.vimPlugins; [
                conform-nvim
            ];
            markdown = with pkgs.vimPlugins; [
                markdown-preview-nvim
            ];
            neonixdev = with pkgs.vimPlugins; [
                lazydev-nvim
            ];
            general = {
                cmp = with pkgs.vimPlugins; [
                nvim-cmp
                luasnip
                friendly-snippets
                cmp_luasnip
                cmp-buffer
                cmp-path
                cmp-nvim-lua
                cmp-nvim-lsp
                cmp-cmdline
                cmp-nvim-lsp-signature-help
                cmp-cmdline-history
                lspkind-nvim
                ];
                treesitter = with pkgs.vimPlugins; [
                nvim-treesitter-textobjects
                nvim-treesitter.withAllGrammars
                ];
                telescope = with pkgs.vimPlugins; [
                telescope-fzf-native-nvim
                telescope-ui-select-nvim
                telescope-nvim
                ];
                always = with pkgs.vimPlugins; [
                nvim-lspconfig
                lualine-nvim
                gitsigns-nvim
                vim-sleuth
                vim-fugitive
                vim-rhubarb
                nvim-surround
                no-neck-pain-nvim
                nvim-highlight-colors
                ];
            };
			# gitPlugins = with pkgs.neovimPlugins; [ ];
		};
		sharedLibraries = {
			general = with pkgs; [
# libgit2
			];
		};
		environmentVariables = {
			test = {
				CATTESTVAR = "It worked!";
			};
		};
		extraWrapperArgs = {
			test = [
				'' --set CATTESTVAR2 "It worked again!"''
			];
		};
		extraPython3Packages = {
			test = (_:[]);
		};
		extraLuaPackages = {
			test = [ (_:[]) ];
		};
	};

	packageDefinitions = {
		mezVim = {pkgs , ... }@misc: {
			settings = {
				aliases = ["mezvim" "mvim" "mvi" ];
				wrapRc = true;
				configDirName = "mezVim";
			};
			categories = {
				general = true;
				gitPlugins = true;
				customPlugins = true;
				test = true;
				example = {
					youCan = "add more than just booleans";
					toThisSet = [
						"and the contents of this categories set"
							"will be accessible to your lua with"
							"mezVim('path.to.value')"
							"see :help mezVim"
					];
				};
			};
		};
	};
	defaultPackageName = "mezVim";
	in
		forEachSystem (system: let
				nixCatsBuilder = utils.baseBuilder luaPath {
				inherit nixpkgs system dependencyOverlays extra_pkg_config;
				} categoryDefinitions packageDefinitions;
				defaultPackage = nixCatsBuilder defaultPackageName;
				pkgs = import nixpkgs { inherit system; };
				in
				{
				packages = utils.mkAllWithDefault defaultPackage;
				devShells = {
				default = pkgs.mkShell {
				name = defaultPackageName;
				packages = [ defaultPackage ];
				inputsFrom = [ ];
				shellHook = ''
				'';
				};
				};

				}) // (let
				nixosModule = utils.mkNixosModules {
					inherit defaultPackageName dependencyOverlays luaPath
						categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
				};
				homeModule = utils.mkHomeModules {
					inherit defaultPackageName dependencyOverlays luaPath
						categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
				};
				in {
					overlays = utils.makeOverlays luaPath {
						inherit nixpkgs dependencyOverlays extra_pkg_config;
					} categoryDefinitions packageDefinitions defaultPackageName;

					nixosModules.default = nixosModule;
					homeModules.default = homeModule;

					inherit utils nixosModule homeModule;
					inherit (utils) templates;
				});

}
