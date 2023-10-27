local opt = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>[', function() vim.cmd('Telescope git_files') end, opt)
vim.keymap.set('n', '<leader>p', function() vim.cmd('Telescope find_files') end, opt)
vim.keymap.set('n', '<leader>f', function() vim.cmd('Telescope live_grep') end, opt)


vim.keymap.set('n', '<leader>s', function() vim.cmd('BufferNext') end, opt)
vim.keymap.set('n', '<leader>a', function() vim.cmd('BufferPrevious') end, opt)
vim.keymap.set('n', '<leader>d', function() vim.cmd('bd | bprev') end, opt)
vim.keymap.set('n', '<leader>qs', function() 
		vim.cmd('SessPit') 
		print("Session Saved!")
end, opt)

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

-- Tab AutoComplete Lsp-zer

--for i=1, 9 do
--		local keymap = string.format('<leader>t%d', i)
--		vim.keymap.set('n', keymap, function () vim.cmd('tabnext 2') end, opt)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  })
})
