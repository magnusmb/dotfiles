return {
	{
		"rmehri01/onenord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("onenord")
		end,
	},

	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"findango/vim-mdx",
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
}
