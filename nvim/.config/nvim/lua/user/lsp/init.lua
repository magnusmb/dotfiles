local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nvim-lsp-installer").setup({})

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
