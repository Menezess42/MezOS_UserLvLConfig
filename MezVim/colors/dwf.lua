-- My custom Neovim theme
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "dwf"

-- Definição de paleta de cores
local bg_colors  = {
	"#1496c8", "#16a4da", "#18b2ec", "#1ac0fe", "#3ccfff", "#5edeff",
	"#0c5e80", "#0e6c92", "#107aa4", "#1288b6", "#0a506e", "#094763",
	"#083e58", "#07354d", "#062c42", "#052337", "#041a2c", "#031121",
	"#020816", "#01030b", "#000000",
}

local colors = {
	base00 = bg_colors[11], -- Fundo escuro
	base01 = "#585f62", -- Cinza escuro
	base02 = "#653b27", -- Marrom escuro
	base03 = "#cc8f62", -- Comentários
	base04 = "#66a1b8", -- Azul médio (variáveis)
	base05 = "#e5dccb", -- Texto principal
	base06 = "#58c5cd", -- Azul ciano
	base07 = "#548851", -- Verde suave
	base08 = "#e35b22", -- Laranja (palavras-chave)
	base09 = "#d19742", -- Laranja suave (funções)
	base0A = "#cc8f62", -- Tipos
	base0B = "#84dcd4", -- Strings
	base0C = "#58c5cd", -- Constantes
	base0D = "#66a1b8", -- Azul médio (variáveis)
	base0E = "#653b27", -- Palavras-chave secundárias
	base0F = "#66a1b8", -- Debug/informativo
}

-- Destaques gerais
local base_highlight_groups = {
	Normal = { fg = colors.base05, bg = colors.base00 },
	Comment = { fg = colors.base03, italic = true },
	Constant = { fg = colors.base0C },
	String = { fg = colors.base0B },
	Function = { fg = colors.base09 },
	Keyword = { fg = colors.base08, bold = true },
	Type = { fg = colors.base0A },
	Variable = { fg = colors.base0D },
	Error = { fg = colors.base08, bg = colors.base00, bold = true },
	Debug = { fg = colors.base0F },
}

-- Destaques específicos de plugins (exemplo: which-key)
local plugin_highlight_groups = {
	WhichKey = { fg = colors.base06, bg = colors.base00 },
	WhichKeyGroup = { fg = colors.base0B },
	WhichKeySeparator = { fg = colors.base03 },
	WhichKeyDesc = { fg = colors.base08 },
	WhichKeyFloat = { bg = colors.base00 },
	WhichKeyBorder = { fg = colors.base04 },
}

-- Aplicação dos destaques
local function apply_highlight(groups)
	for group, settings in pairs(groups) do
		local command = "highlight " .. group
		if settings.fg then command = command .. " guifg=" .. settings.fg end
		if settings.bg then command = command .. " guibg=" .. settings.bg end
		if settings.bold then command = command .. " gui=bold" end
		if settings.italic then command = command .. " gui=italic" end
		vim.cmd(command)
	end
end

-- Aplicar destaques
apply_highlight(base_highlight_groups)
apply_highlight(plugin_highlight_groups)


-- -- My custom Neovim theme
-- vim.cmd("highlight clear")
-- vim.cmd("syntax reset")
-- vim.g.colors_name = "dwf"
-- local bg_colors  = {
	-- "#1496c8",
	-- "#16a4da",
	-- "#18b2ec",
	-- "#1ac0fe",
	-- "#3ccfff",
	-- "#5edeff",
	-- "#0c5e80",
	-- "#0e6c92",
	-- "#107aa4",
	-- "#1288b6",
	-- "#0a506e",
	-- "#094763",
	-- "#083e58",
	-- "#07354d",
	-- "#062c42",
	-- "#052337",
	-- "#041a2c",
	-- "#031121",
	-- "#020816",
	-- "#01030b",
	-- "#000000", }
	-- local colors = {
		-- base00 = bg_colors[11]--[[ #0a506e --]], -- Fundo escuro (azul profundo)
		-- base01 = "#585f62", -- Cinza mais escuro para contraste sutil
		-- base02 = "#653b27", -- Marrom escuro para elementos menos destacados
		-- base03 = "#cc8f62", -- Comentários (marrom claro)
		-- base04 = "#66a1b8", -- Azul médio para variáveis
		-- base05 = "#e5dccb", -- Texto principal (cinza claro)
		-- base06 = "#58c5cd", -- Azul ciano para destaques leves
		-- base07 = "#548851", -- Verde suave para pequenos destaques
		-- base08 = "#e35b22", -- Laranja vibrante (palavras-chave)
		-- base09 = "#d19742", -- Funções (laranja suave)
		-- base0A = "#cc8f62", -- Tipos (mesmo dos comentários)
		-- base0B = "#84dcd4", -- Strings (ciano claro)
		-- base0C = "#58c5cd", -- Constantes e built-in
		-- base0D = "#66a1b8", -- Variáveis (azul médio)
		-- base0E = "#653b27", -- Palavras-chave secundárias (marrom escuro)
		-- base0F = "#66a1b8", -- Debug ou informativo
		-- }


		-- -- local highlight_groups = {
			-- --   Normal = { fg = colors.base05, bg = colors.base00 },
			-- --   NormalFloat = { fg = colors.base05, bg = colors.base00 }, -- Fundo das janelas flutuantes
			-- --   FloatBorder = { fg = colors.base0C, bg = colors.base00 }, -- Bordas
			-- --   WhichKey = { fg = colors.base06, bg = colors.base00 }, -- Texto principal
			-- --   WhichKeyGroup = { fg = colors.base0B }, -- Grupos como "[c]ode"
			-- --   WhichKeySeparator = { fg = colors.base03 }, -- Separadores
			-- --   WhichKeyDesc = { fg = colors.base08 }, -- Descrições dos atalhos
			-- --   WhichKeyFloat = { bg = colors.base00 }, -- Fundo flutuante
			-- --   WhichKeyBorder = { fg = colors.base04 }, -- Bordas
			-- -- }
			-- --
			-- -- for group, settings in pairs(highlight_groups) do
			-- --   local command = "highlight " .. group
			-- --   if settings.fg then command = command .. " guifg=" .. settings.fg end
			-- --   if settings.bg then command = command .. " guibg=" .. settings.bg end
			-- --   if settings.bold then command = command .. " gui=bold" end
			-- --   if settings.italic then command = command .. " gui=italic" end
			-- --   vim.cmd(command)
			-- -- end
			-- -- Define highlights
			-- local highlight_groups = {
				-- Normal = { fg = colors.base05, bg = colors.base00 }, 
				-- Comment = { fg = colors.base03, bg = "NONE", italic = true },
				-- Constant = { fg = colors.base0C },
				-- String = { fg = colors.base0B },
				-- Function = { fg = colors.base09 },
				-- Keyword = { fg = colors.base08, bold = true },
				-- Type = { fg = colors.base0A },
				-- Variable = { fg = colors.base0D },
				-- Error = { fg = colors.base08, bg = colors.base00, bold = true },
				-- Debug = { fg = colors.base0F },
				-- }

				-- for group, settings in pairs(highlight_groups) do
				-- local command = "highlight " .. group
				-- if settings.fg then command = command .. " guifg=" .. settings.fg end
				-- if settings.bg then command = command .. " guibg=" .. settings.bg end
				-- if settings.bold then command = command .. " gui=bold" end
				-- if settings.italic then command = command .. " gui=italic" end
				-- vim.cmd(command)
				-- end

