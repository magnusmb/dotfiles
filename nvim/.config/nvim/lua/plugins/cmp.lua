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
		"saadparwaiz1/cmp_luasnip",

		-- Emmet
		"mattn/emmet-vim",
		"dcampos/cmp-emmet-vim",

		-- Tailwind
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	config = function()
		Map_category("<leader>c", "Configs")
		Remap("n", "<leader>cs", "<cmd> lua require('luasnip.loaders').edit_snippet_files({})<CR>", {}, "Edit snippets")

		local cmp = require("cmp")
		local types = require("cmp.types")

		---

		local function limit_lsp_types(entry, ctx)
			local kind = entry:get_kind()
			local line = ctx.cursor.line
			local col = ctx.cursor.col
			local char_before_cursor = string.sub(line, col - 1, col - 1)
			local char_after_dot = string.sub(line, col, col)

			if char_before_cursor == "." and char_after_dot:match("[a-zA-Z]") then
				return kind == types.lsp.CompletionItemKind.Method
					or kind == types.lsp.CompletionItemKind.Field
					or kind == types.lsp.CompletionItemKind.Property
			elseif string.match(line, "^%s+%w+$") then
				return kind == types.lsp.CompletionItemKind.Function or kind == types.lsp.CompletionItemKind.Variable
			end

			return kind ~= types.lsp.CompletionItemKind.Snippet
		end

		---

		vim.opt.completeopt = "menu,menuone,noinsert"

		cmp.setup({
			preselect = "item",
			experimental = { ghost_text = true },
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			confirm_opts = {
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<M-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
				["<M-k>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.config.disable,
				["<Tab>"] = cmp.mapping.confirm({ behvior = cmp.ConfirmBehavior.Replace, select = true }),
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = ({
						path = "[Path]",
						luasnip = "[LuaSnip]",
						nvim_lsp = "[Lsp]",
						buffer = "[Buffer]",
						emmet_vim = "[Emmet]",
					})[entry.source.name]

					local tail_col_cmp_ok, tailwindcss_colorizer_cmp = pcall(require, "tailwindcss-colorizer-cmp")
					if tail_col_cmp_ok then
						vim_item.before = tailwindcss_colorizer_cmp.formatter(entry, vim_item)
					end
					return vim_item
				end,
			},
			sources = {
				{
					name = "nvim_lsp",
					keyword_length = 3,
					entry_filter = limit_lsp_types,
				},
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
				{
					name = "emmet_vim",
					keyword_length = 3,
					entry_filter = function(entry, ctx)
						-- enable only in JSX context
						-- local context = require("cmp.config.context")
						print(vim.inspect(entry))
						print(vim.inspect(ctx))
						print(entry:get_kind())
						-- require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]

						return ctx.in_treesitter_capture("jsx_text")
					end,
				},
			},
			sorting = {
				-- priority_weight = 1.0,
				comparators = {
					cmp.config.compare.exact,
					cmp.config.compare.locality,
					-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					-- cmp.config.compare.kind,
					cmp.config.compare.offset,
					cmp.config.compare.sort_text,
					-- cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			view = { entries = { name = "custom", selection_order = "near_cursor" } },
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
