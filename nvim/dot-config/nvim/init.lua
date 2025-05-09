local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("keybindings")
require("lazy").setup("plugins",{
   git = {
     throttle = {
       enabled = true, -- not enabled by default
       -- max 2 ops every 5 seconds
       rate = 2,
       duration = 2 * 1000, -- in ms
     },
   }
   })
