return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = true,
			default_integrations = true,
			auto_integrations = false,
			integrations = {
				fzf = true,
				harpoon = true,
				mason = true,
				notify = true,
				snacks = {
					enabled = true,
				},
				telescope = {
					enabled = true,
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
