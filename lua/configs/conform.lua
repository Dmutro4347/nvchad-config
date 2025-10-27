require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		python = { "black" },
		nix = { "nixfmt" },
		json = { "prettier" },
		cpp = { "clang-format" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- ручне форматування через <leader>f
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file with conform" })
