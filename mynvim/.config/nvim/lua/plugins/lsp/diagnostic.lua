local icons = require("config.icons")
vim.diagnostic.config {
  underline = false,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    prefix = function(diagnostic)
      for d, icon in pairs(icons.diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
          return icon
        end
      end
      return icons.file.modified
    end
  },
  severity_sort = true,
  signs = { text = { "▮", "▮", "▮", "▮" } },
}
