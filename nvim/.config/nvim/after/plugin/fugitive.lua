-- local function FloatingFugitive()
-- 	-- get the editor's max width and height
-- 	local width = vim.api.nvim_get_option("columns")
-- 	local height = vim.api.nvim_get_option("lines")
--
-- 	-- create a new, scratch buffer
-- 	local buf = vim.api.nvim_create_buf(false, true)
-- 	-- vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
-- 	vim.api.nvim_buf_call(buf, function()
-- 		vim.cmd("Gedit :")
-- 	end)
--
-- 	-- if the editor is big enough
-- 	if width > 150 or height > 35 then
-- 		-- fzf's window height is 3/4 of the max height, but not more than 30
-- 		-- local win_height = math.min(math.ceil(height * 3 / 4), 30)
-- 		local win_height = math.ceil(height * 3 / 4)
-- 		local win_width = math.ceil(width * 0.9)
-- 		-- local win_width
--
-- 		local opts = {
-- 			border = "rounded",
-- 			relative = "editor",
-- 			width = win_width,
-- 			height = win_height,
-- 			row = math.ceil((height - win_height) / 2),
-- 			col = math.ceil((width - win_width) / 2),
-- 		}
--
-- 		vim.api.nvim_buf_set_keymap(buf, "n", "gq", ":close<CR>", { silent = true, nowait = true, noremap = true })
-- 		-- create a new floating window, centered in the editor
-- 		local win = vim.api.nvim_open_win(buf, true, opts)
-- 		vim.api.nvim_create_autocmd("BufLeave", {
-- 			callback = function()
-- 				vim.api.nvim_win_close(win, 0)
-- 				return true
-- 			end,
-- 		})
-- 	end
-- end

map_category("<leader>g", "Git")
remap("n", "<leader>gs", ":Git<CR>", {}, "Status")
remap("n", "<leader>gb", ":Git blame<CR>", {}, "Blame")
-- remap("n", "<leader>fb", builtin.buffers, {}, "Buffers")
-- remap("n", "<leader>fh", builtin.help_tags, {}, "Help tags")
-- remap("n", "<leader>fr", builtin.oldfiles, {}, "Recent files")
