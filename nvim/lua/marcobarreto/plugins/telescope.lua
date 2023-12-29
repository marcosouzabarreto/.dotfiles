return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim', "debugloop/telescope-undo.nvim", },
      	config = function()
	      require("telescope").setup({
		extensions = {
			undo = {
			},
		},
		file_ignore_patterns = {
			"node_modules"
		}
	      })
	      require("telescope").load_extension("undo")
	end,
}
