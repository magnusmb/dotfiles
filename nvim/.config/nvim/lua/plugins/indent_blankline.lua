return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup({
			char = "┊",
			show_current_context = true,
			show_trailing_blankline_indent = false,
		})
	end,
}
-- See `:help indent_blankline.txt`
