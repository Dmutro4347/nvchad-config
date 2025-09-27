require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- === General Editor Settings ===
vim.opt.updatetime = 100              -- Time in ms to trigger CursorHold events
vim.opt.number = true                 -- Show absolute line numbers
-- vim.opt.relativenumber = true      -- Show relative line numbers
vim.opt.scrolloff = 7                 -- Keep 7 lines visible above/below cursor
vim.opt.wrap = false                  -- Disable line wrapping
vim.opt.cursorline = true             -- Highlight the current line
vim.opt.clipboard = "unnamedplus"     -- Use system clipboard
vim.opt.termguicolors = true          -- Enable true color support
vim.opt.swapfile = false              -- Disable swapfile creation

-- === Indentation ===
vim.opt.autoindent = true             -- Copy indent from current line
vim.opt.smartindent = true            -- Smart auto-indenting for C-like programs
vim.opt.smarttab = true
vim.opt.expandtab = true              -- Convert tabs to spaces
vim.opt.shiftwidth = 2                -- Number of spaces for each step of autoindent
vim.opt.tabstop = 2                   -- Number of spaces that a <Tab> counts for

-- === Mouse ===
vim.opt.mouse = "a"                   -- Enable mouse support in all modes

