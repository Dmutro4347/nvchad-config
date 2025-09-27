-- === Keymaps ===
vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })

-- === Neo-tree Setup ===
require("neo-tree").setup {
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "document_symbols",
  },

  add_blank_line_at_top = false,

  filesystem = {
    bind_to_cwd = false,
    follow_current_file = {
      enabled = true,
    },
  },

  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = "󰅂",
      expander_expanded = "󰅀",
      expander_highlight = "NeoTreeExpander",
    },
    git_status = {
      symbols = {
        added = " ",
        conflict = "󰩌 ",
        deleted = "󱂥",
        ignored = " ",
        modified = " ",
        renamed = "󰑕",
        staged = "󰩍",
        unstaged = "",
        untracked = " ",
      },
    },
  },
}
