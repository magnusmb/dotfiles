return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.elm_format,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.diagnostics.eslint_d.with({
					-- ignore prettier warnings from eslint-plugin-prettier
					filter = function(diagnostic)
						return diagnostic.code ~= "prettier/prettier"
					end,
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
			debug = true,
		})
	end,
}
