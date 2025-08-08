return {
    "kawre/leetcode.nvim",
    -- build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Leet",
    opts = {
      lang = "python3"
    },
}
