return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- Põhikeeled
				"gopls", -- Go
				"pyright", -- Python
				"clangd", -- C/C++
				"bashls", -- Bash
				"ts_ls", -- TypeScript / JavaScript
				"jsonls", -- JSON
				"yamlls", -- YAML
				"dockerls", -- Dockerfile
				"lua_ls", -- Lua (Neovim configideks)
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters & linters
				"black", -- Python formatter
				"isort", -- Python importide sorteerija
				"pylint", -- Python linter
				"stylua", -- Lua formatter
			},
		})
	end,
}
