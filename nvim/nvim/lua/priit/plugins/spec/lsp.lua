return {
  {
    -- Me ei kasuta enam nvim-lspconfig "frameworki".
    -- Neovim 0.11+ kasutab native API: vim.lsp.config + vim.lsp.enable
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- C / C++
      vim.lsp.config("clangd", {
        cmd = { "clangd" },
        capabilities = capabilities,
      })
      vim.lsp.enable("clangd")

      -- Python
      vim.lsp.config("pylsp", {
        capabilities = capabilities,
      })
      vim.lsp.enable("pylsp")

      -- LSP keymapid (buffer-local)
      local augroup = vim.api.nvim_create_augroup("PriitLspKeymaps", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
          end, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}

