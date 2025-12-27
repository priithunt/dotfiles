return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      -- plugin pole veel runtimepath'is; ära crashi ja ära spämmi
      return
    end

    configs.setup({
      ensure_installed = { "c", "lua", "python", "bash" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

