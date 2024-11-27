return {
  "nvim-lualine/lualine.nvim",

  opts = {
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },

    sections = {
      lualine_a = { { "mode", separator = { left = "", right = "" } } },
      lualine_b = {},
      lualine_x = {
          -- {
          --   function() return require("noice").api.status.command.get() end,
          --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          --   color = function() return LazyVim.ui.fg("Statement") end,
          -- },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return LazyVim.ui.fg("Constant") end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return LazyVim.ui.fg("Debug") end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return LazyVim.ui.fg("Special") end,
          },
          -- stylua: ignore
          {
            "branch",
            color = function() return LazyVim.ui.fg("Constant") end,
          },
        {
          "diff",
          symbols = {
            added = LazyVim.config.icons.git.added,
            modified = LazyVim.config.icons.git.modified,
            removed = LazyVim.config.icons.git.removed,
          },
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
      lualine_y = {
        {
          "progress",
          padding = { left = 1, right = 0 },
          -- separator = { left = "", right = "" },
          separator = " ",
        },
        {
          "location",
          padding = { left = 0, right = 1 },
          separator = { right = "" },
        },
      },
      lualine_z = {
        -- function()
        --   return " " .. os.date("%R")
        -- end,
      },
    },
  },
}
