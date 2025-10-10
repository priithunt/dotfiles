return {
	-- Solarized Osaka (välja kommenteeritud)
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("solarized-osaka").setup({
	-- 			transparent = false,
	-- 			terminal_colors = true,
	-- 			styles = {
	-- 				floats = "transparent",
	-- 				sidebars = "dark",
	-- 				comments = { italic = true },
	-- 			},
	-- 			on_highlights = function(hl, c)
	-- 				local prompt = "#2d3149"
	-- 				hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
	-- 				hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
	-- 				hl.TelescopePromptNormal = { bg = prompt }
	-- 				hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
	-- 				hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
	-- 				hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
	-- 				hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
	-- 			end,
	-- 		})
	-- 		vim.cmd([[colorscheme solarized-osaka]])
	-- 	end,
	-- },

	-- Tokyonight (aktiivne)
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night", -- saad valida: "storm", "night", "moon", "day"
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- Gruber Darker (jätan näidisena sisse, aga välja kommenteeritud)
	-- {
	-- 	"blazkowolf/gruber-darker.nvim",
	-- 	opts = {
	-- 		bold = true,
	-- 		invert = {
	-- 			signs = false,
	-- 			tabline = false,
	-- 			visual = false,
	-- 		},
	-- 		italic = {
	-- 			strings = true,
	-- 			comments = true,
	-- 			operators = false,
	-- 			folds = true,
	-- 		},
	-- 		undercurl = true,
	-- 		underline = true,
	-- 	},
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruber-darker")
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "#121212" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#121212" })
	-- 		vim.api.nvim_set_hl(0, "Comment", { fg = "#888888" })
	-- 		vim.api.nvim_set_hl(0, "LineNr", { fg = "#444444" })
	-- 		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e1e1e" })
	-- 	end,
	-- },
}
