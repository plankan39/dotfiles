return {
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd("colorscheme adwaita")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme adwaita")
      end,
      fallback = "light",
    },
  },
}
