return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "catppuccin" } },
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
      end,
      fallback = "light",
    },
  },
  {
    "akinsho/bufferline.nvim",
    -- optional = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      end
    end,
  },
  {
    "Mofiqul/adwaita.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
}
