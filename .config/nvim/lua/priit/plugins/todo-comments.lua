return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
-- TODO: add better comments here
--BUG: Nii saad Bugi maarata
--HACK: Nii saad Hacki maarata
--PERF: Koik okei
--NOTE: Siin saad note teha
--FIX: Siin saad paranduse lisada
--WARNING: Sedasi on voimalik hoiatus seada
