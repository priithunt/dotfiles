return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    format_on_save = function(bufnr)
      return { timeout_ms = 1000, lsp_fallback = true }
    end,
    formatters_by_ft = {
      lua    = { "stylua" },
      python = { "isort", "black" },
      c      = { "clang_format" },
      cpp    = { "clang_format" },
      sh     = { "shfmt" },
      bash   = { "shfmt" },
      zsh    = { "shfmt" }, -- shfmt oskab ka zsh süntaksit üsna hästi
    },
  },
}

