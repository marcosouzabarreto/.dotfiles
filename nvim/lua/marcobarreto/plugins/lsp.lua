return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		"j-hui/fidget.nvim",
	},

	config = function()
		local notify = vim.notify
		vim.notify = function(msg, ...)
			if msg:match("lspconfig.*deprecated") then
				return
			end
			notify(msg, ...)
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		require("lspconfig").gdscript.setup({})

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"pyright",
				"eslint",
				"ts_ls",
				"clangd",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["gdtoolkit"] = function()
					require("lspconfig").gdtoolkit.setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = {
										"bit",
										"vim",
										"it",
										"describe",
										"before_each",
										"after_each",
									},
								},
							},
						},
					})
				end,

				["eslint"] = function()
					require("lspconfig").eslint.setup({
						capabilities = capabilities,
						settings = {
							codeActionOnSave = { enable = true, mode = "all" },
						},
						on_attach = function(_, bufnr)
							vim.api.nvim_create_autocmd("BufWritePre", {
								buffer = bufnr,
								command = "EslintFixAll",
							})
						end,
					})
				end,
			},
		})

		-- Diagnostics display
		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
