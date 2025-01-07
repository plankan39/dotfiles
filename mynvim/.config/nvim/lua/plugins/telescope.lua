local builtin = require("telescope.builtin")

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", builtin.find_files, desc = "Find Files" },
    { "<leader>fh", builtin.help_tags,  desc = "Find Help" },
    { "<leader>fb", builtin.buffers,    desc = "Find Buffers" },
    { "<leader>fg", builtin.live_grep,  desc = "Find with grep" },
  }
}
