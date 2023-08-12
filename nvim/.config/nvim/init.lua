vim.cmd('let $PATH = "/Users/magnus/.nvm/versions/node/v18.14.2/bin:" . $PATH')

Remap = function(mode, keys, command, opts, description)
	if description == nil then
		vim.keymap.set(mode, keys, command, opts)
		return
	end

	opts.desc = description
	vim.keymap.set(mode, keys, command, opts)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Needs to be loaded before Lazy so plugins use correct leader key
require("magnusmb.base")

require("lazy").setup("plugins", {
	install = { colorscheme = { "onenord" } },
	ui = {
		icons = {
			cmd = "cmd ",
			config = "config",
			event = "event",
			ft = "filetype",
			init = "init ",
			import = " ",
			keys = "keys ",
			lazy = " ",
			loaded = "●",
			not_loaded = "○",
			plugin = "plugin",
			runtime = " ",
			source = "source",
			start = "",
			task = "✓",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
	},
	change_detection = {
		notify = false,
	},
})
require("magnusmb.remaps")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})
