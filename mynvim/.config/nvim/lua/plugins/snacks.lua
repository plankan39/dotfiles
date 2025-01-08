return {
  "folke/snacks.nvim",
  opts = {

    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true, style = "fancy" },
    scope = { enabled = true },
    scroll = { enabled = true },
    -- statuscolumn = { enabled = true }, -- we set this in options.lua
    -- toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },
  },
  -- stylua: ignore
  keys = {
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  },
}
