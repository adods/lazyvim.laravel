return {
  -- Auto-save and auto-load sessions based on current directory
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      log_level = "error",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      auto_session_use_git_branch = false,
      bypass_session_save_file_types = { "alpha", "dashboard" },
    },
  },

  -- Better folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
  },
}
