return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        theme = "cursor",
        shorten_path = true,
      })
    end,
  },
  { "nvim-pack/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf", build = "./install --bin" },
  },
}
