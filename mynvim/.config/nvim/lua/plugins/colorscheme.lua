return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      color_overrides = {
        all = {
          rosewater = "#f5e0dc",
          flamingo = "#f2cdcd",
          pink = "#b294bb", -- #c397d8
          mauve = "#cba6f7",
          red = "#cc6666",  -- #d54e53
          maroon = "#eba0ac",
          peach = "#fab387",
          yellow = "#f0c674", --#e7c547
          green = "#b5bd68",  --#b9ca4a
          teal = "#8abeb7",   -- #70c0b1
          sky = "#89dceb",
          sapphire = "#74c7ec",
          blue = "#81a2be", -- #7aa6da
          lavender = "#b4befe",
          text = "#cdd6f4",
          subtext1 = "#c5c8c6",
          subtext0 = "#eaeaea",
          overlay2 = "#9399b2",
          overlay1 = "#7f849c",
          overlay0 = "#6c7086",
          surface2 = "#666666",
          surface1 = "#2a2b36",
          -- surface1 = "#1d1f21",
          surface0 = "#313244",
          base = "#1e1e1e",
          -- mantle = "#181825",
          mantle = "#353749",
          crust = "#11111b",
        },
      },

      -- palette0 = "#45475a",
      -- palette1 = "#f38ba8",
      -- palette2 = "#a6e3a1",
      -- palette3 = "#f9e2af",
      -- palette4 = "#89b4fa",
      -- palette5 = "#f5c2e7",
      -- palette6 = "#94e2d5",
      -- palette7 = "#bac2de",
      -- palette8 = "#585b70",
      -- palette9 = "#f38ba8",
      -- palette10 = "#a6e3a1",
      -- palette11 = "#f9e2af",
      -- palette12 = "#89b4fa",
      -- palette13 = "#f5c2e7",
      -- palette14 = "#94e2d5",
      -- palette15 = "#a6adc8",
      -- background = "1e1e2e",
      -- foreground = "cdd6f4",
      -- cursor_color = "f5e0dc",
      -- selection_background = "353749",
      -- selection_foreground = "cdd6f4",
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = ...,
  },
}
