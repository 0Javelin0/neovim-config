local opts = { noremap = true }

-- Normal mode
vim.keymap.set('n', '<TAB>', 'vaB',		 opts)					 --[TAB] select all text between curly brackets.
vim.keymap.set('n', 'r',     'R',			 opts)					 --[r] normal mode to replace.
vim.keymap.set('n', 'R',     'r',			 opts)					 --[r] normal mode to replace.
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)					 --[Ctrl j] traverse down A buffer.
vim.keymap.set('n', '<c-h>', '<c-w>h', opts)					 --[Ctrl h] traverse left A buffer.
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)					 --[Ctrl k] traverse up A buffer.
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)				 	 --[Ctrl l] traverse right A buffer.
vim.keymap.set('n', '<c-e>', ':ter<CR> <BAR> i', opts) --[Ctrl e] open terminal in new buffer.

-- Insert mode
vim.keymap.set('i', '<c-g>', '<c-c>o', opts)					 --[ctrl-g] create a new line.
vim.keymap.set('i', '<c-l>', '<c-n>',  opts)					 --[Ctrl d] scroll down one auto-completion.

-- Visual mode
vim.keymap.set('v', '<TAB>', 'di', opts)							 --[TAB] Deletes & copies selected text, & enters insert mode w/ 1 space added.

-- Plugin
vim.keymap.set('n', '<c-a>', ':SFMToggle<CR> <BAR> :vertical resize 26<CR>', opts) --[Ctrl a] Open file tree and resize it smaller.
vim.keymap.set('n', '<c-t>', ':Telescope<CR>', opts)															 --[Ctrl t] Opens Telescope.
vim.keymap.set('n', '=', ':BufferNext<CR>', opts)																	 --[=] Next tab
vim.keymap.set('n', '-', ':BufferPrevious<CR>', opts)															 --[-] Previous tab
vim.keymap.set('n', '<c-x>', ':BufferClose<CR>', opts)

