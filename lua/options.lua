vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.number = true
vim.o.numberwidth = 1
vim.o.relativenumber = true
vim.o.tags = './.tags;,.tags'

vim.api.nvim_exec([[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]], false)
