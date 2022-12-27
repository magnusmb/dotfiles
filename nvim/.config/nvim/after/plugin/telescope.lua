local ts = require("telescope")
ts.load_extension("projects")
local extensions = ts.extensions

local builtin = require("telescope.builtin")

map_category("<leader>f", "Find")
remap("n", "<leader>ff", builtin.find_files, {}, "Files")
remap("n", "<leader>fF", builtin.live_grep, {}, "Text")
remap("n", "<leader>fb", builtin.buffers, {}, "Buffers")
remap("n", "<leader>fh", builtin.help_tags, {}, "Help tags")
remap("n", "<leader>fr", builtin.oldfiles, {}, "Recent files")
remap("n", "<leader>fp", extensions.projects.projects, {}, "Recent files")

remap("n", "<leader>gb", builtin.git_branches, {}, "Branches")
remap("n", "<leader>gc", builtin.git_commits, {}, "Branches")
