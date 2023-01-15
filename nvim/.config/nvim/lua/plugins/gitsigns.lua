return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Navigation
				Remap("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true }, "Next hunk")

				Remap("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true }, "Previous hunk")

				-- Actions
				Map_category("g", "Git")
				Remap({ "n", "v" }, "<leader>g-", ":Gitsigns stage_hunk<CR>", {}, "Stage hunk")
				Remap({ "n", "v" }, "<leader>gx", ":Gitsigns reset_hunk<CR>", {}, "Reset hunk")
				Remap("n", "<leader>gS", gs.stage_buffer, {}, "Stage buffer")
				Remap("n", "<leader>gu", gs.undo_stage_hunk, {}, "Undo stage buffer")
				Remap("n", "<leader>gX", gs.reset_buffer, {}, "Reset buffer")
				Remap("n", "<leader>gp", gs.preview_hunk, {}, "Preview hunk")
				Remap("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, {}, "Show blame")
				Remap("n", "<leader>gB", gs.toggle_current_line_blame, {}, "Toggle blame lines")
				Remap("n", "<leader>gd", gs.diffthis, {}, "Diff")
				Remap("n", "<leader>gD", function()
					gs.diffthis("~")
				end, {}, "Diff")
				Remap("n", "<leader>gk", gs.toggle_deleted, {}, "Toggle deleted lines")

				-- Text object
				Remap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", {}, "Inside hunk")
			end,
		})
	end,
}
