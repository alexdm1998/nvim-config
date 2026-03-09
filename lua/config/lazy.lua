local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)



-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
-- Visual width of a tab character
vim.opt.tabstop = 4
-- Number of spaces for auto-indent
vim.opt.shiftwidth = 4
-- How many spaces a <Tab> inserts
vim.opt.softtabstop = 4
-- Show line number
vim.opt.number = true
-- Use spaces instead of real tabs? false = real tabs, true = spaces
vim.opt.expandtab = true


-- Setup lazy.nvim
require("lazy").setup({spec = { import = "plugins" }}, {})
