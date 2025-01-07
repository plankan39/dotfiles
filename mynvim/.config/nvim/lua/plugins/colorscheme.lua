return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() 
      -- require("catppuccin").setup({})
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = ...,
  },
}
