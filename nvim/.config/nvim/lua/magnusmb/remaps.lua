-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate tabs
keymap("n", "L", ":tabnext<CR>", opts)
keymap("n", "H", ":tabprevious<CR>", opts)
remap("n", "<leader>t", ":tabnew<CR>", opts, "New tab")

-- Clear highlights
remap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts, "Remove highlight")

-- Comment
remap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts, "Comment line")
remap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', {},
  "Comment line")

remap({ "n", "v" }, "<leader>y", [["+y]], {}, "Yank to clipboard")
remap("n", "<leader>Y", [["+Y]], {}, "Yank line to clipboard")
