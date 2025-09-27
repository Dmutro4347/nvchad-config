-- lua/config/lint.lua
local lint = require "lint"

lint.linters_by_ft = {
  -- Python
  python = { "ruff" },

  -- Web
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  css = { "stylelint" },
  html = { "htmlhint" },

  -- DevOps
  dockerfile = { "hadolint" },
  sh = { "shellcheck" },

  -- Infra
  nix = { "statix" },

  -- Lua
  lua = { "luacheck" },

  -- C/C++
  cpp = { "clangtidy" },
  cmake = { "cmakelint" },

  -- JSON
  json = { "jsonlint" },
}

-- 🔧 Конфіги для конкретних лінтерів
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

lint.linters.eslint_d = {
  cmd = "eslint_d",
  args = { "--stdin", "--stdin-filename", "%", "--format", "json" },
  stdin = true,
}

lint.linters.stylelint = {
  cmd = "stylelint",
  args = { "--stdin", "--stdin-filename", "%" },
  stdin = true,
}

lint.linters.htmlhint = {
  cmd = "htmlhint",
  args = { "--format", "unix" },
  stdin = true,
}

lint.linters.hadolint = {
  cmd = "hadolint",
  args = { "-" },
  stdin = true,
}

lint.linters.shellcheck = {
  cmd = "shellcheck",
  args = { "--format=gcc", "-" },
  stdin = true,
}

lint.linters.statix = {
  cmd = "statix",
  args = { "check", "--stdin" },
  stdin = true,
}

lint.linters.luacheck = {
  cmd = "luacheck",
  args = { "--formatter=plain", "--codes", "--ranges", "--filename", "%" },
  stdin = true,
}

lint.linters.clangtidy = {
  cmd = "clang-tidy",
  args = {},
  stdin = false,
}

lint.linters.cmakelint = {
  cmd = "cmake-lint",
  args = {},
  stdin = true,
}

lint.linters.jsonlint = {
  cmd = "jsonlint",
  args = { "--compact" },
  stdin = true,
}

-- 🚀 Автолінт після збереження
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
