return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.0",
	-- or                            , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim", "folke/which-key.nvim" },
	config = function()
		local ts = require("telescope")
		ts.load_extension("projects")
		local extensions = ts.extensions

		local builtin = require("telescope.builtin")

		Map_category("<leader>f", "Find")
		Remap("n", "<leader>ff", builtin.find_files, {}, "Files")
		Remap("n", "<leader>fF", builtin.live_grep, {}, "Text")
		Remap("n", "<leader>fb", builtin.buffers, {}, "Buffers")
		Remap("n", "<leader>fh", builtin.help_tags, {}, "Help tags")
		Remap("n", "<leader>fr", builtin.oldfiles, {}, "Recent files")
		Remap("n", "<leader>fp", extensions.projects.projects, {}, "Recent files")

		Remap("n", "<leader>gb", builtin.git_branches, {}, "Branches")
		Remap("n", "<leader>gc", builtin.git_commits, {}, "Branches")
	end,
}
