return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
		"ziontee113/syntax-tree-surfer",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "vim" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = false,
					node_incremental = false,
					node_decremental = false,
					scope_incremental = false,
				},
			},
			indent = {
				enable = true,
			},
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		})
		-- Syntax Tree Surfer
		require("syntax-tree-surfer").setup({})

		-- local opts = { silent = true, expr = true }
		--
		-- -- Normal Mode Swapping:
		-- -- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
		-- Remap("n", "vU", function()
		-- 	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
		-- 	return "g@l"
		-- end, opts, "Backward swap master node")
		-- Remap("n", "vD", function()
		-- 	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
		-- 	return "g@l"
		-- end, opts, "Forward swap master node")
		--
		-- -- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
		-- Remap("n", "vd", function()
		-- 	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
		-- 	return "g@l"
		-- end, opts, "Backwards swap current node")
		-- Remap("n", "vu", function()
		-- 	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
		-- 	return "g@l"
		-- end, opts, "Forward swap current node")

		local opts = { noremap = true, silent = true }
		--> If the mappings above don't work, use these instead (no dot repeatable)
		-- Remap("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
		-- Remap("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
		-- Remap("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
		-- Remap("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)

		-- Visual Selection from Normal Mode
		Remap("n", "gs", "<cmd>STSSelectCurrentNode<cr>", opts, "Select current node")
		Remap("n", "gS", "<cmd>STSSelectMasterNode<cr>", opts, "Select master node")

		-- Select Nodes in Visual Mode
		Remap("x", "H", "<cmd>STSSelectPrevSiblingNode<cr>", opts, "Select previous sibling")
		Remap("x", "L", "<cmd>STSSelectNextSiblingNode<cr>", opts, "Select next sibling")
		Remap("x", "<C-n>", "<cmd>STSSelectParentNode<cr>", opts, "Select parent node")
		Remap("x", "<C-p>", "<cmd>STSSelectChildNode<cr>", opts, "Select child node")

		-- Swapping Nodes in Visual Mode
		Remap("x", "<C-j>", "<cmd>STSSwapNextVisual<cr>", opts, "Forward swap master node")
		Remap("x", "<C-k>", "<cmd>STSSwapPrevVisual<cr>", opts, "Backward swap master node")
	end,
}
