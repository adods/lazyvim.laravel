return {
  -- Mason - Package manager for LSP/DAP/linters/formatters
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- PHP
        "phpactor",
        "phpstan",
        "pint",
        "blade-formatter",
        -- HTML/CSS/JS
        "emmet-ls",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        -- Lua
        "stylua",
        "lua-language-server",
        -- Shell
        "shellcheck",
        "shfmt",
      },
    },
  },

  -- Telescope - Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fp", false }, -- Disable default find plugin files
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "vendor",
          ".git/",
          "storage/",
          "bootstrap/cache/",
        },
      },
    },
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },
}
