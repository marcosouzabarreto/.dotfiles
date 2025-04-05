return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    servers = {
      eslint = {},
      tailwindcss = {},
      gopls = {},
      lua_ls = {
        cmd = { "lua-language-server" },
        settings = {
          Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
              globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            }
          }
        }
      },
      pyright = {},
      nil_ls = {},
      rust_analyzer = {},
      ts_ls = {},
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')

    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end
}
