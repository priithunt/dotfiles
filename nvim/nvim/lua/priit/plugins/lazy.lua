local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- loeme pluginade tabeli failist lua/priit/plugins/spec/init.lua
local plugins = require("priit.plugins.spec")

require("lazy").setup(plugins, {
  checker = { enabled = true },
})

