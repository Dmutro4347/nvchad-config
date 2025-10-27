return {
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		lazy = false,
		config = function()
			require("configs.conform")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		require("configs.lint")
	-- 	end,
	-- },
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
		config = function()
			require("configs.cmp")
		end,
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
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
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
      local mason_lspconfig = require("mason-lspconfig")

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

			local lsp_servers = {
				"pyright", -- Python
				"bashls", -- Bash
				"ts_ls", -- JavaScript / TypeScript
				"html", -- HTML
				"cssls", -- CSS
				"clangd" -- C / C++
			}

			-- Форматери
			local formatters = {
				"stylua", -- Lua
				"prettier", -- HTML / CSS / JS / JSON
				"black", -- Python
				"nixfmt", -- Nix
				"clang-format", -- C / C++
				"shfmt", -- Bash
			}

			mason_lspconfig.setup({
				ensure_installed = lsp_servers,
				automatic_installation = true,
			})

			mason_tool_installer.setup({
				ensure_installed = tools,
				auto_update = true,
				run_on_start = true,
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
