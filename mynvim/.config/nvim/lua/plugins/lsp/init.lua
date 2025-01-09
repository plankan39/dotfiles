return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      { 'neovim/nvim-lspconfig' },
    },
    opts = {
      ensure_installed = { "lua_ls" },
      handlers = require("plugins.lsp.handlers").handlers
    }
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      local lsp_defaults = require('lspconfig').util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('blink.cmp').get_lsp_capabilities()
      )
      require("plugins.lsp.diagnostic")
      require("plugins.lsp.autocmds")
    end
  },
}
