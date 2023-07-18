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
		"windwp/nvim-autopairs",

		-- Snippets
		"L3MON4D3/LuaSnip",

		-- Emmet
		"dcampos/cmp-emmet-vim",
		"mattn/emmet-vim",

		-- Tailwind
		"roobert/tailwindcss-colorizer-cmp.nvim",

		-- Copilot
		"zbirenbaum/copilot.lua",
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		vim.opt.completeopt = "menu,menuone,noselect"

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- require("tailwindcss-colorizer-cmp").setup({
		-- 	color_square_width = 1,
		-- })

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
				["<Tab>"] = cmp.mapping.confirm({ behvior = cmp.ConfirmBehavior.Replace, select = true }),
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

					local tail_col_cmp_ok, tailwindcss_colorizer_cmp = pcall(require, "tailwindcss-colorizer-cmp")
					if tail_col_cmp_ok then
						vim_item.before = tailwindcss_colorizer_cmp.formatter(entry, vim_item)
					end
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
			sorting = {
				priority_weight = 2,
				comparators = {
					require("copilot_cmp.comparators").prioritize,
					require("copilot_cmp.comparators").score,

					-- Below is the default comparitor list and order for nvim-cmp
					cmp.config.compare.offset,
					-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})

		require("copilot_cmp").setup({
			method = "getCompletionsCycling",
		})
	end,
}
