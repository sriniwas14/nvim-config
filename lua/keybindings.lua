local opt = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>[', function() vim.cmd('Telescope git_files') end, opt)
vim.keymap.set('n', '<leader>p', function() vim.cmd('Telescope find_files') end, opt)
vim.keymap.set('n', '<leader>]', function()
	-- TODO
	vim.fn.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>c', function() vim.cmd('Telescope colorscheme') end, opt)

vim.keymap.set('n', '<leader>r', function() 
	vim.cmd('so $MYVIMRC') 
	print("Reloaded Vim Config!")
end)
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set('n', '<leader>g', vim.cmd.Git)

-- Nvim Tree
vim.keymap.set('n', 't', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', 'z', '<C-w>w', {noremap = true, silent = true })

-- ToggleTerm
vim.keymap.set('n', 'tt', vim.cmd.ToggleTerm)
