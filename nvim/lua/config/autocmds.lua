-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Fixes Autocomment
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-float",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-terminal",
  },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", { buffer = event.buf, silent = true })
  end,
})
