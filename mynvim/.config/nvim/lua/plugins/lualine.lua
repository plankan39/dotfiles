return {
  "nvim-lualine/lualine.nvim",
  -- enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/snacks.nvim", "LazyVim/LazyVim" },
  opts = {
    options = {
      icons_enabled = true,
      -- theme = 'catppuccin',
      theme = "auto",
      component_separators = "",
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = {
        "branch",
        {
          "diff",
          symbols = require("config.icons").git,
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict

            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
      lualine_c = {
        require("lazyvim.util").lualine.root_dir(),
        { "diagnostics" },
        { "filetype",   icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        require("lazyvim.util").lualine.pretty_path(),
      },
      lualine_x = {
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = function() return { fg = require("snacks").util.color("Debug") } end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return { fg = require("snacks").util.color("Special") } end,
        },
      },
      lualine_y = { "progress" },
      lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "neo-tree", "fzf", "lazy" },
  },
}
