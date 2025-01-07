return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
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
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      local lsp_defaults = require('lspconfig').util.default_config
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local km = require("plugins.lsp.keymaps")
          for _, k in ipairs(km.keys) do
            k.buffer = event.buf
            k.desc = k.desc and 'LSP: ' .. k.desc or k.desc
            km.nmap(k)
          end
          -- Create a command `:Format` local to the LSP buffer
          vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
            if vim.lsp.buf.format then
              vim.lsp.buf.format()
            elseif vim.lsp.buf.formatting then
              vim.lsp.buf.formatting()
            end
          end, { desc = 'Format current buffer with LSP' })
        end,
      })
    end
  },
}
