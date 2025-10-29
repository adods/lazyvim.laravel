return {
  -- Better UI for notifications and messages
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },

  -- Better quickfix/location list
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
    },
  },

  -- Snacks.nvim for better UI components (explorer disabled, using neo-tree instead)
  {
    "folke/snacks.nvim",
    keys = {
      -- Disable snacks explorer keybindings
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
    },
  },

  -- File explorer (Neo-tree) - Enabled as reliable alternative
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle<cr>",
        desc = "Explorer (Neo-tree)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
        end,
        desc = "Explorer (cwd)",
      },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Show all filtered items
          hide_dotfiles = false, -- Don't hide dotfiles
          hide_gitignored = false, -- Don't hide gitignored files
          hide_by_name = {
            "node_modules",
            ".git",
            ".DS_Store",
          },
          never_show = {}, -- Clear never_show list
        },
      },
    },
  },
}
