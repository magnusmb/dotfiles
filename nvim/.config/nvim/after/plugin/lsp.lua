vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons

local lsp = require("lsp-zero")
lsp.preset("recommended")

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
})

lsp.set_preferences({
	sign_icons = {},
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

	remap("n", "gd", vim.lsp.buf.definition, opts)
	remap("n", "K", vim.lsp.buf.hover, opts)
	remap("n", "[d", vim.diagnostic.goto_next, opts)
	remap("n", "]d", vim.diagnostic.goto_prev, opts)
	remap("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	map_category("<leader>l", "Lsp")
	remap("n", "<leader>la", vim.lsp.buf.code_action, opts, "Code action")
	remap("n", "<leader>ld", vim.diagnostic.open_float, opts, "Diagnostics (floating window)")
	remap("n", "<leader>lr", vim.lsp.buf.references, opts, "References")
	remap("n", "<leader>lR", vim.lsp.buf.rename, opts, "Rename")

	map_category("<leader>lw", "Workspace")
	remap("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts, "Workspace")
end)

lsp.setup()

-- vim.diagnostic.config({
--     virtual_text = true,
-- })
