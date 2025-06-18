require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" ,"gofmt" },
    python = { "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettier" },
    typescript = { "prettier" },
  },
})
