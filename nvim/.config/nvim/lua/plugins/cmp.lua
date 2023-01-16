return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",

		-- Emmet
		"dcampos/cmp-emmet-vim",
		"mattn/emmet-vim",
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
						emmet_vim = "[Emmet]",
						buffer = "[Buffer]",
						nvim_lsp = "[Lsp]",
						luasnip = "[LuaSnip]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
			view = { entries = { name = "custom", selection_order = "near_cursor" } },
			sources = {
				{ name = "emmet_vim" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})
	end,
}
