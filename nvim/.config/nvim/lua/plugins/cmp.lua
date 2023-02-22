return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Treesitter
		"nvim-treesitter/nvim-treesitter",

		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",

		-- Snippets
		"L3MON4D3/LuaSnip",

		-- Emmet
		"dcampos/cmp-emmet-vim",
		"mattn/emmet-vim",

		-- Copilot
		"zbirenbaum/copilot.lua",
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		vim.opt.completeopt = "menu,menuone,noselect"

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			experimental = { ghost_text = true },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<M-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
				["<M-k>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.config.disable,
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = ({
						copilot = "[Copilot]",
						emmet_vim = "[Emmet]",
						luasnip = "[LuaSnip]",
						nvim_lsp = "[Lsp]",
						buffer = "[Buffer]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
			view = { entries = { name = "custom", selection_order = "near_cursor" } },
			sources = {
				{
					name = "emmet_vim",
					-- entry_filter = function()
					-- 	-- enable only in JSX context
					-- 	local context = require("cmp.config.context")
					-- 	return context.in_treesitter_capture("jsx_text")
					-- end,
				},
				{ name = "copilot" },
				{ name = "luasnip" },
				{ name = "nvim_lsp", keyword_length = 3 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
			},
		})

		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		require("copilot_cmp").setup({
			method = "getCompletionsCycling",
		})
	end,
}
