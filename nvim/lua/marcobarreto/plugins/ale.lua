return {
  "dense-analysis/ale",
  event = "VeryLazy", -- Load ALE when needed
  config = function()
    vim.g.ale_disable_lsp = 1

    vim.g.ale_use_neovim_diagnostics_api = 1

    vim.g.ale_completion_enabled = 0

    vim.g.ale_linters = {
      python = {'flake8'},
    }

    vim.g.ale_fixers = {
      python = {'black'},
    }

  end,
}
