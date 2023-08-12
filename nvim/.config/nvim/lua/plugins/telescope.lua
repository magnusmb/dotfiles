return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ahmedkhalf/project.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local ts = require("telescope")
		ts.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
					},
				},
			},
		})

		ts.load_extension("project")
		local extensions = ts.extensions

		local function git_dir()
			return vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel"))
		end

		local builtin = require("telescope.builtin")

		Remap("n", "<leader>f", builtin.find_files, {}, "Find file")
		Remap("n", "<leader>F", builtin.live_grep, {}, "Grep text")

		Map_category("<leader>s", "Search")
		Remap("n", "<leader>sB", builtin.buffers, {}, "Buffers")
		Remap("n", "<leader>sh", builtin.help_tags, {}, "Help tags")
		Remap("n", "<leader>sr", function()
			builtin.oldfiles({ cwd = git_dir() })
		end, {}, "Recent files")
		Remap("n", "<leader>sk", builtin.keymaps, {}, "Keymaps")
		Remap("n", "<leader>sb", builtin.git_branches, {}, "Git branches")
		Remap("n", "<leader>sgc", builtin.git_branches, {}, "Git commits")
		Remap("n", "<leader>sgb", builtin.git_branches, {}, "Git commits for current buffer")
		Remap("n", "<leader>sp", extensions.project.project, {}, "Projects")

		Remap("n", "<leader>sB", builtin.git_branches, {}, "Branches")
		Remap("n", "<leader>sc", builtin.git_commits, {}, "Commits")
	end,
}
