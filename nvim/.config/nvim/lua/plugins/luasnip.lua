return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")

		local snip_dir = "~/.config/nvim/snippets"

		-- require("luasnip.loaders").edit_snippet_files({
		-- 	format = function(file, source_name)
		-- 		if source_name == "lua" then
		-- 			return nil
		-- 		else
		-- 			return file:gsub(snip_dir, "snippets")
		-- 		end
		-- 	end,
		-- })

		require("luasnip.loaders.from_lua").lazy_load({ paths = snip_dir })

		ls.setup({
			load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
				typescriptreact = { "typescript", "tsx" },
				javacriptreact = { "javascript", "jsx" },
				-- Also load both lua and json when a markdown-file is opened,
				-- javascript for html.
				markdown = { "lua", "json" },
				html = { "javascript" },
				-- Other filetypes just load themselves.
			}),
		})

		Map_category("<leader>c", "Configs")
		Remap("n", "<leader>cs", ":lua require('luasnip.loaders').edit_snippet_files()<CR>", {}, "Edit snippets")

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
