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
      -- Override <leader><space> to show gitignored files
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files({
            hidden = true, -- Show hidden files
            no_ignore = true, -- Don't respect .gitignore
            no_ignore_parent = true, -- Don't respect parent .gitignore
            file_ignore_patterns = {
              "^%.git/",
              "^node_modules/",
              "%.DS_Store",
            },
          })
        end,
        desc = "Find Files (All)",
      },
      -- Override <leader>/ to use Telescope instead of snacks
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep({
            additional_args = function()
              return { "--hidden", "--no-ignore" }
            end,
            file_ignore_patterns = {
              "^%.git/",
              "^node_modules/",
              "%.DS_Store",
            },
          })
        end,
        desc = "Grep (Root Dir)",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            hidden = true, -- Show hidden files
            no_ignore = true, -- Don't respect .gitignore
            no_ignore_parent = true, -- Don't respect parent .gitignore
            file_ignore_patterns = {
              "^%.git/",
              "^node_modules/",
              "%.DS_Store",
            },
          })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({
            additional_args = function()
              return { "--hidden", "--no-ignore" }
            end,
            file_ignore_patterns = {
              "^%.git/",
              "^node_modules/",
              "%.DS_Store",
            },
          })
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
        -- Don't set file_ignore_patterns here, let individual commands handle it
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
