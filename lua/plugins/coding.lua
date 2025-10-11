return {
  -- Emmet support for HTML/Blade
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "blade",
          },
        },
      },
    },
  },

  -- Improved autocompletion with path sources
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "FelipeLema/cmp-async-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Add path and buffer sources
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources or {}, {
        { name = "async_path", priority = 250 },
        { name = "path", priority = 250 },
        { name = "buffer", priority = 500, keyword_length = 3 },
      }))

      -- Custom mappings
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      return opts
    end,
  },

  -- Surround text objects
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  -- Auto close tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      filetypes = {
        "html",
        "xml",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "blade",
      },
    },
  },
}
