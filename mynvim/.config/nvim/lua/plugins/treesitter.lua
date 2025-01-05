return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { 
      'go', 'lua', 'python', 'rust', 'c', 'typescript', 'regex', 
      'bash', 'markdown', 'markdown_inline', 'kdl', 'sql',
      'html', 'css', 'javascript', 'yaml', 'json', 'toml',
      'java',
    },
    sync_install = true,

    highlight = { enable = true },
    indent = { enable = true },
  }
}
