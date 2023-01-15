return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")

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
	end,
}
