return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local alpha = require("alpha")

		local if_nil = vim.F.if_nil

		local dashboard = require("alpha.themes.dashboard")

		local leader = "SPC"

		--- @param sc string
		--- @param txt string
		--- @param keybind string? optional
		--- @param keybind_opts table? optional
		local function button(sc, txt, keybind, keybind_opts)
			local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

			local opts = {
				position = "center",
				shortcut = sc,
				cursor = 5,
				width = 50,
				align_shortcut = "left",
				hl_shortcut = "Keyword",
			}
			if keybind then
				keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_, keybind, keybind_opts }
			end

			local function on_press()
				local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
			end

			return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
			}
		end

		dashboard.section.header.val = {
			[[      ::::    ::: :::::::::: ::::::::  :::     ::: :::::::::::   :::   :::]],
			[[     :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:      :+:+: :+:+:]],
			[[    :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+]],
			[[   +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+ ]],
			[[  +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+  ]],
			[[ #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#   ]],
			[[###    #### ########## ########      ###     ########### ###       ###    ]],
		}

		dashboard.section.buttons.val = {
			button("f", "" .. " Find file", ":Telescope find_files <CR>"),
			button("e", "" .. " New file", ":ene <BAR> startinsert <CR>"),
			button("p", "" .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
			button("r", "" .. " Recent files", ":Telescope oldfiles <CR>"),
			button("t", "" .. " Find text", ":Telescope live_grep <CR>"),
			button("l", "" .. " Lazy", ":Lazy<CR>"),
			button("c", "" .. " Config", ":e $XDG_CONFIG_HOME/nvim/init.lua <CR>"),
			button("q", "" .. " Quit", ":qa<CR>"),
		}

		-- local function footer()
		--   return ""
		-- end
		--
		-- dashboard.section.footer.val = footer()
		--
		-- dashboard.section.footer.opts.hl = "Type"
		-- dashboard.section.header.opts.hl = "Include"
		-- dashboard.section.buttons.opts.hl = "Keyword"
		--
		-- dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)

		Remap("n", "<leader>a", ":Alpha<CR>", {}, "Alpha Dashboard")
	end,
}
