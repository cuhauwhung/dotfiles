vim.g.mapleader = " "

-- telescope
vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<s-f>", "<cmd>Telescope live_grep<CR>", {})
-- make telescope close with single esc in insert mode
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})

-- nvimtree
vim.api.nvim_set_keymap("n", "<c-b>", ":NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<c-f>", ":NvimTreeFindFile<CR>", {})
-- exit Vim if NERDTree is the only window left
vim.api.nvim_command([[
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])

-- remember last opened position
vim.api.nvim_command([[
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]])

-- Search and highlight but not jump
-- https://stackoverflow.com/a/49944815/6060420
vim.cmd([[
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
]])



