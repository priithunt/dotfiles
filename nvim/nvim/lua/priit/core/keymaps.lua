vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- kiire salvestus/quit
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })

-- Telescope (tuleb pluginast)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

vim.keymap.set("i", "jk", "<ESC>", {desc = "liigub insertmode-st valja jk-ga"})

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Tyhjendab otsingu highlighti"})

