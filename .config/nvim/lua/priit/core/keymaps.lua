vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", {desc = "liigub insertmode-st valja jk-ga"}) -- Loogika on see, et esimene t2ht on mode, teine klahvikombinatsioon ja kolmas, mida see keymap teeb

keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Tyhjendab otsingu highlighti"})

keymap.set("n", "<leader>=", "<C-a>", {desc = "Suurendab numbrit yhe v6rra"})
keymap.set("n", "<leader>-", "<C-x>", {desc = "V2hendab numbrit yhe v6rra"})

--Akende manageerimine
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Jagab akna vertikaalselt"})
keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Jagab akna horisontaalselt"})
keymap.set("n", "<leader>se", "<C-w>=", {desc = "Jagab akna vordseks suuruseks"})
keymap.set("n", "<leader>sx", "<Cmd>close<CR>", {desc = "Sulgeb aktiivse akna"})

keymap.set("n", "<leader>to", "<Cmd>tabnew<CR>", {desc = "Avab uue tab-i"})
keymap.set("n", "<leader>tx", "<Cmd>tabclose<CR>", {desc = "Sulgeb aktiivse tab-i"})
keymap.set("n", "<leader>tn", "<Cmd>tabn<CR>", {desc = "Liigub j2rgmisesse tab-i"})
keymap.set("n", "<leader>tp", "<Cmd>tabp<CR>", {desc = "Liigub eelnevasse tab-i"})
keymap.set("n", "<leader>tf", "<Cmd>tabnew %<CR>", {desc = "Avab olemasoleva faili uues tab-s"})

