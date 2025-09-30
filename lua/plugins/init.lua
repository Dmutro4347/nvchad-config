return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		lazy = false,
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- icons
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("configs.neotree")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.lint")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp", -- LSP completion (від nvchad)
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPost",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")

			local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"ruff", -- python linter
					"eslint_d", -- js linter
					"clangd",
					"cmake",
					"cssls",
					"dockerls",
					"bashls",
					"jsonls",
					"lua_ls",
					"pyright",
					"tsserver",
					"html",
					"emmet_language_server",
					"nixd",
				},
			})
		end,
	},

	-- test new blink
	-- { import = "nvchad.blink.lazyspec" },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"python",
				"json",
				"javascript",
				"cpp",
				"nix",
				"html",
				"css",
			},
			build = ":TSUpdate",
			-- config = function()
			-- 	require("custom.configs.treesitter")
			-- end,
		},
	},
}
