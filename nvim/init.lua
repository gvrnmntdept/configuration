-- Minimal sane defaults
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Theme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      -- pick one: "tokyonight", "tokyonight-night", "tokyonight-storm", "tokyonight-moon", "tokyonight-day"
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Optional icons (Oil will use them if available)
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- File browser
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        view_options = { show_hidden = true },
      })
      vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
})
