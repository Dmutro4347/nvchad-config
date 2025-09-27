-- File: ~/.config/nvim/lua/custom/configs/treesitter.lua

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  ensure_installed = {
    "python",
    "lua",
    "json",
    "html",
    "css",
    "javascript",
    "bash",
    "cpp",
    "nix",
  },
}

