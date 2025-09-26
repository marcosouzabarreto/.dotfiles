require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" ,"gofmt" },
    python = { "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "eslint_d", "prettier" },
    typescript = { "eslint_d", "prettier" },
    javascriptreact = { "eslint_d", "prettier" },
    typescriptreact = { "eslint_d", "prettier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
})
