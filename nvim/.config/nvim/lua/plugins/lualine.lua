return {
  "nvim-lualine/lualine.nvim",

  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "", right = "" } } },
        lualine_b = {},

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          Snacks.profiler.status(),
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = function() return { fg = Snacks.util.color("Statement") } end,
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = function() return { fg = Snacks.util.color("Constant") } end,
        },
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = function() return { fg = Snacks.util.color("Debug") } end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return { fg = Snacks.util.color("Special") } end,
        },
          { "branch" },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
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

          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 }, separator = { left = "", right = "" } },
        },
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    return opts
  end,
  -- opts = {
  --   options = {
  --     section_separators = { left = "", right = "" },
  --     component_separators = { left = "", right = "" },
  --   },
  --
  --   -- sections = {
  --   --   lualine_a = { { "mode", separator = { left = "", right = "" } } },
  --   --   lualine_b = {},
  --   --   lualine_x = {
  --   --       -- {
  --   --       --   function() return require("noice").api.status.command.get() end,
  --   --       --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
  --   --       --   color = function() return LazyVim.ui.fg("Statement") end,
  --   --       -- },
  --   --       -- stylua: ignore
  --   --       {
  --   --         function() return require("noice").api.status.mode.get() end,
  --   --         cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
  --   --         color = function() return LazyVim.ui.fg("Constant") end,
  --   --       },
  --   --       -- stylua: ignore
  --   --       {
  --   --         function() return "  " .. require("dap").status() end,
  --   --         cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
  --   --         color = function() return LazyVim.ui.fg("Debug") end,
  --   --       },
  --   --       -- stylua: ignore
  --   --       {
  --   --         require("lazy.status").updates,
  --   --         cond = require("lazy.status").has_updates,
  --   --         color = function() return LazyVim.ui.fg("Special") end,
  --   --       },
  --   --       -- stylua: ignore
  --   --       {
  --   --         "branch",
  --   --         color = function() return LazyVim.ui.fg("Constant") end,
  --   --       },
  --   --     {
  --   --       "diff",
  --   --       symbols = {
  --   --         added = LazyVim.config.icons.git.added,
  --   --         modified = LazyVim.config.icons.git.modified,
  --   --         removed = LazyVim.config.icons.git.removed,
  --   --       },
  --   --       source = function()
  --   --         local gitsigns = vim.b.gitsigns_status_dict
  --   --         if gitsigns then
  --   --           return {
  --   --             added = gitsigns.added,
  --   --             modified = gitsigns.changed,
  --   --             removed = gitsigns.removed,
  --   --           }
  --   --         end
  --   --       end,
  --   --     },
  --   --   },
  --   --   lualine_y = {
  --   --     {
  --   --       "progress",
  --   --       padding = { left = 1, right = 0 },
  --   --       -- separator = { left = "", right = "" },
  --   --       separator = " ",
  --   --     },
  --   --     {
  --   --       "location",
  --   --       padding = { left = 0, right = 1 },
  --   --       separator = { right = "" },
  --   --     },
  --   --   },
  --   --   lualine_z = {
  --   --     -- function()
  --   --     --   return " " .. os.date("%R")
  --   --     -- end,
  --   --   },
  --   -- },
  -- },
}
