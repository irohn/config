local map = require("config.utils").keymap

map("n", "<leader>w", "<cmd>w | !$SHELL -c %<cr>", {
  buffer = true,
  desc = "source current file",
})

-- vim: ts=2 sts=2 sw=2 et