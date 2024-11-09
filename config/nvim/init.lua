-- Tab indent behavior
vim.opt.autoindent = true       -- align new line with previous line
vim.opt.smarttab = true         -- stop softtabstop from applying at line start
vim.opt.expandtab = true        -- converts tabs into spaces
-- Spaces to equal a tab
local indent = 4
vim.opt.tabstop = indent        -- number of spaces for a tab
vim.opt.shiftwidth = indent     -- autoindent width
vim.opt.softtabstop = indent    -- spaces to equal a tabstop

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse behavior
vim.opt.mouse = 'a'

-- Search behavior
vim.opt.showmatch = true        -- highlight pair symbol, e.g. () {}
vim.opt.ignorecase = true       -- case-insensitive search
vim.opt.hlsearch = true         -- highlight search
vim.opt.incsearch = true        -- pans to search as it is typed

-- Styling
vim.opt.syntax = 'on'           -- enable syntax highlighting
vim.opt.cc = '80'               -- show pep-8 line limit
vim.api.nvim_command('filetype plugin on')  -- filetype overrides style guide
vim.api.nvim_command('filetype indent indent on')

-- Command mode
vim.opt.wildmode = { 'longest', 'list' }    -- show command matches like bash

-- Speedup scrolling
vim.opt.ttyfast = true

-- Line length limit set to pep-8 80
-- vim.api.nvim_set_hl(0, "CursorColumn", { ctermbg = 0 })
-- autocmd({'BufRead'}, {
--     pattern = '*',
--     callback = function ()
--         vim.fn.matchadd('ColorColumn', '\\%81v\\s*\\zs\\S', 100)
--     end
-- })
