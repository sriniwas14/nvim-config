require "plugins"
require("mason").setup()
require "ui"
require "keybindings"
require "lsp"
require "set"
require "appearance"

vim.opt.tabstop = 4          -- The width of a TAB is set to 4.
                            -- Still it is a \t. It is just that
                            -- Vim will interpret it to be having
                            -- a width of 4.

vim.opt.shiftwidth = 4      -- Indents will have a width of 4

vim.opt.softtabstop = 4     -- Sets the number of columns for a TAB

vim.opt.expandtab = true    -- Expand TABs to spaces

vim.opt.swapfile = false
