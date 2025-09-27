require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers
-- local lspconfig = vim.lsp.config
-- local lspconfig = require "lspconfig"

-- typos-lsp
vim.lsp.config("typos_lsp", {
  init_options = {
    diagnosticSeverity = "Hint",
  },
})
vim.lsp.enable "typos-lsp"

-- pyright
vim.lsp.config("pyright", {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" }, -- Ruff бере на себе lint
      },
    },
  },
})
vim.lsp.enable "pyright"

-- clangd
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
    "--header-insertion=iwyu",
    "--background-index",
    "--clang-tidy",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
    "-j=6",
  },
  on_attach = function(_, bufnr)
    vim.keymap.set(
      "n",
      "gh",
      "<cmd>ClangdSwitchSourceHeader<CR>",
      { desc = "Switch Source/Header (C/C++)", buffer = bufnr }
    )
  end,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
})
vim.lsp.enable "clangd"

-- cssls
vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    less = { validate = true },
    scss = { validate = true },
  },
})
vim.lsp.enable "cssls"

vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
})
vim.lsp.enable "html"

-- vim.lsp.config("emmet_language_server", {
--   cmd = { "emmet-language-server", "--stdio" },
--   filetypes = { "html" },
-- })

vim.lsp.config("tsserver", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = vim.fs.dirname(
    vim.fs.find({ "package.json", "tsconfig.json", "jsconfig.json", ".git" }, { upward = true })[1]
  ),
})
vim.lsp.enable "tsserver"

-- Nix LSP (nixd або nil_ls, залежно від того, що ти ставиш)
vim.lsp.enable("nixd", {
  cmd = { "nixd" },
  filetypes = { "nix" },
})

-- Shell LSP (bashls)
vim.lsp.enable("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
})

-- JSON LSP
vim.lsp.enable("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
})

-- Dockerfile LSP
vim.lsp.enable("dockerls", {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
})

-- keymaps
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- inlay hints (Neovim 0.10+)
if vim.lsp.inlay_hint then
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end
    end,
  })
end
