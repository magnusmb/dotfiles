return {
	"windwp/nvim-autopairs",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")

		npairs.setup({
			autotag = { enable = true },
			enable_check_bracket_line = false,
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
		})

		local ts_conds = require("nvim-autopairs.ts-conds")

		-- press % => %% only while inside a comment or string
		npairs.add_rules({
			Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
			Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
		})

		local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
		npairs.add_rules({
			Rule(" ", " "):with_pair(function(opts)
				local pair = opts.line:sub(opts.col - 1, opts.col)
				return vim.tbl_contains({
					brackets[1][1] .. brackets[1][2],
					brackets[2][1] .. brackets[2][2],
					brackets[3][1] .. brackets[3][2],
				}, pair)
			end),
		})
		for _, bracket in pairs(brackets) do
			npairs.add_rules({
				Rule(bracket[1] .. " ", " " .. bracket[2])
					:with_pair(function()
						return false
					end)
					:with_move(function(opts)
						return opts.prev_char:match(".%" .. bracket[2]) ~= nil
					end)
					:use_key(bracket[2]),
			})
		end

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp, err = pcall(require, "cmp")
		if not err then
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end
	end,
}
