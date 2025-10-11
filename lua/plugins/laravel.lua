return {
  -- Laravel/Blade support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "php",
          "blade",
          "html",
          "javascript",
          "css",
        })
      end
    end,
  },

  -- Blade syntax highlighting
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- Alpine.js and Livewire snippets
  {
    "rafamadriz/friendly-snippets",
    dependencies = { "L3MON4D3/LuaSnip" },
  },

  -- Emmet for HTML/Blade (works with Alpine & Livewire attributes)
  {
    "mattn/emmet-vim",
    ft = { "html", "blade", "php" },
    init = function()
      vim.g.user_emmet_settings = {
        blade = {
          extends = "html",
        },
        php = {
          extends = "html",
        },
      }
      -- Enable for blade files
      vim.g.user_emmet_install_global = 0
    end,
  },

  -- Laravel specific features
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      {
        "<leader>ll",
        function()
          Laravel.pickers.laravel()
        end,
        desc = "Laravel: Open Laravel Picker",
      },
      {
        "<c-g>",
        function()
          Laravel.commands.run("view:finder")
        end,
        desc = "Laravel: Open View Finder",
      },
      {
        "<leader>la",
        function()
          Laravel.pickers.artisan()
        end,
        desc = "Laravel: Open Artisan Picker",
      },
      {
        "<leader>lt",
        function()
          Laravel.commands.run("actions")
        end,
        desc = "Laravel: Open Actions Picker",
      },
      {
        "<leader>lr",
        function()
          Laravel.pickers.routes()
        end,
        desc = "Laravel: Open Routes Picker",
      },
      {
        "<leader>lh",
        function()
          Laravel.run("artisan docs")
        end,
        desc = "Laravel: Open Documentation",
      },
      {
        "<leader>lm",
        function()
          Laravel.pickers.make()
        end,
        desc = "Laravel: Open Make Picker",
      },
      {
        "<leader>lc",
        function()
          Laravel.pickers.commands()
        end,
        desc = "Laravel: Open Commands Picker",
      },
      {
        "<leader>lo",
        function()
          Laravel.pickers.resources()
        end,
        desc = "Laravel: Open Resources Picker",
      },
      {
        "<leader>lp",
        function()
          Laravel.commands.run("command_center")
        end,
        desc = "Laravel: Open Command Center",
      },
      {
        "gf",
        function()
          local ok, res = pcall(function()
            if Laravel.app("gf").cursorOnResource() then
              return "<cmd>lua Laravel.commands.run('gf')<cr>"
            end
          end)
          if not ok or not res then
            return "gf"
          end
          return res
        end,
        expr = true,
        noremap = true,
      },
    },
    event = { "VeryLazy" },
    config = true,
  },

  -- PHPActor LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          filetypes = { "php", "blade" },
          init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
          },
        },
      },
    },
  },

  -- Disable intelephense (using phpactor instead)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          enabled = false,
        },
      },
    },
  },

  -- Conform.nvim for formatting (LazyVim default)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint" },
        blade = { "blade-formatter" },
      },
      formatters = {
        ["blade-formatter"] = {
          command = "blade-formatter",
          args = { "--write", "$FILENAME", "--wrap-attributes", "force-aligned-multiline" },
          stdin = false,
        },
      },
    },
  },

  -- nvim-lint for linting with Larastan
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
      linters = {
        phpstan = {
          cmd = "vendor/bin/phpstan",
          args = {
            "analyze",
            "--error-format=json",
            "--no-progress",
            "--memory-limit=2G",
          },
        },
      },
    },
  },
}
