-- This file is automatically loaded by lazyvim.plugins.config

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- harpoon
map("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Harpoon menu" })
map("n", "<leader>a", "<cmd>lua require('harpoon.mark').toggle_file()<cr>", { desc = "Harpoon toggle" })
--naviagtes to file 1
map("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Harpoon go to 1" })
map("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Harpoon go to 2" })
map("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Harpoon go to 3" })
map("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Harpoon go to 4" })
map("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Harpoon go to 5" })
map("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Harpoon go to 6" })
map("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", { desc = "Harpoon go to 7" })
map("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", { desc = "Harpoon go to 8" })
map("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", { desc = "Harpoon go to 9" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })


-- zen mode bindings
map("n", "<leader>zn", ":TZNarrow<CR>", { desc = "Remove" })
map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", { desc = "Remove" })
map("n", "<leader>zf", ":TZFocus<CR>", { desc = "Focus" })
map("n", "<leader>zm", ":TZMinimalist<CR>", { desc = "Minimalist" })
map("n", "<leader>za", ":TZAtaraxis<CR>", { desc = "Ataraxis" })


-- vw to viw
map("n", "vw", "viw", { desc = "Select word" })
-- execute viw and than gza in the normal mode
map("n", "vza", "viw<esc>gza", { desc = "Select word and fold" })

map("n", "<leader>r", ":%s//g<Left><Left>", { desc = "Search and replace" })


-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- vimtex
map("n", "<leader>kl", "<cmd>VimtexCompile<cr>", { desc = "Compile" })
map("n", "<leader>kv", "<cmd>VimtexView<cr>", { desc = "View" })
map("n", "<leader>kt", "<cmd>VimtexTocToggle<cr>", { desc = "Toggle TOC" })
map("n", "<leader>kq", "<cmd>VimtexQuickfixToggle<cr>", { desc = "Toggle Quickfix" })
map("n", "<leader>kc", "<cmd>VimtexClean<cr>", { desc = "Clean" })
map("n", "<leader>ks", "<cmd>VimtexStop<cr>", { desc = "Stop" })
map("n", "<leader>kf", "<cmd>VimtexFold<cr>", { desc = "Fold" })
map("n", "<leader>ku", "<cmd>VimtexInfo<cr>", { desc = "Info" })
map("n", "<leader>ka", "<cmd>VimtexCompileOutputToggle<cr>", { desc = "Toggle Output" })
map("n", "<leader>kr", "<cmd>VimtexCompileRefresh<cr>", { desc = "Refresh" })
map("n", "<leader>kd", "<cmd>VimtexCompileForce<cr>", { desc = "Force" })
map("n", "<leader>kL", "<cmd>VimtexCompileAsync<cr>", { desc = "Compile Async" })
map("n", "<leader>kV", "<cmd>VimtexViewAsync<cr>", { desc = "View Async" })
map("n", "<leader>kC", "<cmd>VimtexCleanAsync<cr>", { desc = "Clean Async" })
map("n", "<leader>kS", "<cmd>VimtexStopAsync<cr>", { desc = "Stop Async" })
map("n", "<leader>kF", "<cmd>VimtexFoldAsync<cr>", { desc = "Fold Async" })
map("n", "<leader>kU", "<cmd>VimtexInfoAsync<cr>", { desc = "Info Async" })
map("n", "<leader>kR", "<cmd>VimtexCompileRefreshAsync<cr>", { desc = "Refresh Async" })
map("n", "<leader>kD", "<cmd>VimtexCompileForceAsync<cr>", { desc = "Force Async" })


-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>ft", "", { desc = "Lazy", remap = true })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
  map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function()
  Util.toggle("relativenumber", true)
  Util.toggle("number")
end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
  { desc = "Toggle Conceal" })

-- lazygit
map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root() }) end,
  { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() Util.float_term({ "lazygit" }) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
map("n", "<leader>ft", function() Util.float_term(nil, { cwd = Util.get_root() }) end, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
