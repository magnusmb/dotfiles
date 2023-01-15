return { -- LSP
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"folke/which-key.nvim",

		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons
		vim.opt.completeopt = "menu,menuone,noselect"

		local lsp = require("lsp-zero")

		lsp.ensure_installed({
			"tsserver",
			"eslint",
			"sumneko_lua",
		})

		lsp.set_preferences({
			suggest_lsp_servers = true,
			setup_servers_on_start = true,
			set_lsp_keymaps = true,
			configure_diagnostics = true,
			cmp_capabilities = true,
			manage_nvim_cmp = true,
			call_servers = "local",
			sign_icons = {
				error = "‼",
				warn = "!",
				hint = "?",
				info = "•",
			},
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-space>"] = cmp.mapping.complete(),
		})

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
			experimental = {
				ghost_text = true,
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			-- if client.name == "eslint" then
			--   vim.cmd.LspStop("eslint")
			--   return
			-- end

			Remap("n", "gd", vim.lsp.buf.definition, opts)
			Remap("n", "K", vim.lsp.buf.hover, opts)
			Remap("n", "[d", vim.diagnostic.goto_next, opts)
			Remap("n", "]d", vim.diagnostic.goto_prev, opts)
			Remap("i", "<C-h>", vim.lsp.buf.signature_help, opts)

			Map_category("<leader>l", "Lsp")
			Remap("n", "<leader>la", vim.lsp.buf.code_action, opts, "Code action")
			Remap("n", "<leader>ld", vim.diagnostic.open_float, opts, "Diagnostics (floating window)")
			Remap("n", "<leader>lr", vim.lsp.buf.references, opts, "References")
			Remap("n", "<leader>lR", vim.lsp.buf.rename, opts, "Rename")

			Map_category("<leader>lw", "Workspace")
			Remap("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts, "Workspace")
		end)

		lsp.nvim_workspace()
		lsp.setup()

		-- vim.diagnostic.config({
		--     virtual_text = true,
		-- })
	end,
}
