local lint = require("lint")

lint.linters_by_ft = {
	python = { "ruff" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	nix = { "statix" },
}

-- кастомні команди (якщо треба)
lint.linters.ruff = {
	cmd = "ruff",
	args = {
		"--select=E,F,UP,N,I,ASYNC,S,PTH",
		"--ignore=E112",
		"--line-length=79",
		"--respect-gitignore",
		"--target-version=py311",
	},
	stdin = true,
}
-- lint.linters.eslint_d = { cmd = "eslint_d" }
-- lint.linters.luacheck = { cmd = "luacheck" }
-- lint.linters.statix = { cmd = "statix" }
--
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
