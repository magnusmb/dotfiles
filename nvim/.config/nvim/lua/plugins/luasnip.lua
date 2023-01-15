return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")
		-- press <Tab> to expand or jump in a snippet. These can also be mapped separately
		-- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.

		-- vim.keymap.set({ "i", "s" }, "<Tab>", function()
		-- 	if ls.expand_or_jumpable() then
		-- 		ls.expand()
		-- 	end
		-- end)

		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.jumpable() then
				ls.jump(1)
			end
		end)

		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if ls.jumpable() then
				ls.jump(-1)
			end
		end)

		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)

		vim.keymap.set({ "i", "s" }, "<C-h>", function()
			if ls.choice_active() then
				ls.change_choice(-1)
			end
		end)

		-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
		-- -1 for jumping backwards.
		-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
		--
		-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
		-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
		--
		-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
		-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
		-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
	end,
}
