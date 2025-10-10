return {
	-- Conform: gofumpt + goimports + format-on-save
	{
		"stevearc/conform.nvim",
		-- NB: init jookseb varem kui opts → lisame PATH-i nii, et nvim näeks ~/go/bin
		init = function()
			local go_bin = vim.fn.expand("$HOME/go/bin")
			if not string.find(vim.env.PATH or "", go_bin, 1, true) then
				vim.env.PATH = (vim.env.PATH or "") .. ":" .. go_bin
			end
		end,
		opts = function(_, opts)
			return vim.tbl_deep_extend("force", opts or {}, {
				-- ütle Conformile täpsed käsud, kui $PATH ka hilineb
				formatters = {
					gofumpt = { command = vim.fn.expand("$HOME/go/bin/gofumpt") },
					goimports = { command = vim.fn.expand("$HOME/go/bin/goimports") },
				},
				formatters_by_ft = {
					go = { "gofumpt", "goimports" },
				},
				format_on_save = {
					timeout_ms = 3000,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- Delve debug Go jaoks (dap-go lisamugavused testideks)
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup()
		end,
	},

	-- DAP (Delve) baas-konf Go jaoks – Debug file/package/workspace
	{
		"mfussenegger/nvim-dap",
		ft = "go",
		config = function()
			local dap = require("dap")
			dap.adapters.go = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.expand("$HOME/go/bin/dlv"),
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}
			dap.configurations.go = {
				{ name = "Debug file", type = "go", request = "launch", program = "${file}" },
				{ name = "Debug package", type = "go", request = "launch", program = "${fileDirname}" },
				{ name = "Debug workspace", type = "go", request = "launch", program = "${workspaceFolder}" },
			}
		end,
	},
}
