return { -- LSP
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",

		"themaxmarchuk/tailwindcss-colors.nvim",
	},
	config = function()
		vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons

		local lsp = require("lsp-zero")

		lsp.ensure_installed({
			"tsserver",
			"eslint",
			"rust_analyzer",
			"tailwindcss",
			-- "sumneko_lua",
		})

		lsp.set_preferences({
			suggest_lsp_servers = true,
			setup_servers_on_start = true,
			set_lsp_keymaps = false,
			configure_diagnostics = true,
			cmp_capabilities = true,
			manage_nvim_cmp = false,
			call_servers = "local",
			sign_icons = {
				error = "‼",
				warn = "!",
				hint = "?",
				info = "•",
			},
		})

		lsp.on_attach(function(client, bufnr)
			require("tailwindcss-colors").buf_attach(bufnr)

			local opts = { buffer = bufnr, remap = false }

			Remap("n", "gd", vim.lsp.buf.definition, opts)
			Remap("n", "K", vim.lsp.buf.hover, opts)
			Remap("n", "[d", vim.diagnostic.goto_next, opts)
			Remap("n", "]d", vim.diagnostic.goto_prev, opts)
			Remap("i", "<C-h>", vim.lsp.buf.signature_help, opts)

			Map_category("<leader>l", "Lsp")
			Remap("n", "<leader>la", vim.lsp.buf.code_action, opts, "Code action")
			Remap("n", "<leader>ld", vim.diagnostic.open_float, opts, "Diagnostics (floating window)")
			Remap("n", "<leader>lr", vim.lsp.buf.rename, opts, "Rename")
			Remap("n", "<leader>gr", vim.lsp.buf.references, opts, "References")
		end)

		lsp.nvim_workspace()
		lsp.setup()
	end,
}
