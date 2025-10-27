-- File: ~/.config/nvim/lua/custom/configs/treesitter.lua

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
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
})
