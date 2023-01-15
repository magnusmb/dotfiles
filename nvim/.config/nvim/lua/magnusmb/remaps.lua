-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Ignore line wraps when going up or down a line
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Shift lines in visual mode
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
Remap("n", "<leader>t", ":tabnew<CR>", opts, "New tab")

-- Clear highlights
Remap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts, "Remove highlight")

-- Comment
Remap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts, "Comment line")
Remap(
	"x",
	"<leader>/",
	'<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>',
	{},
	"Comment line"
)

-- Yank to system clipboard
Remap({ "n", "v" }, "<leader>y", [["+y]], {}, "Yank to clipboard")
Remap("n", "<leader>Y", [["+Y]], {}, "Yank line to clipboard")
