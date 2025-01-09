return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local ts = require("telescope.builtin")
		return {
			{ "<leader>ff", ts.find_files, desc = "Find Files" },
			{ "<leader><leader>", "<leader>ff", desc = "Find Files", remap = true },
			{ "<leader>fh", ts.help_tags, desc = "Find Help" },
			{ "<leader>fb", ts.buffers, desc = "Find Buffers" },
			{ "<leader>fg", ts.live_grep, desc = "Find with grep" },
		}
	end,
}
