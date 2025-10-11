-- Load custom snippets for Livewire and Alpine.js
-- This runs after LuaSnip is loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local ok, ls = pcall(require, "luasnip")
    if not ok then
      return
    end

    local ok_vscode, vscode_loader = pcall(require, "luasnip.loaders.from_vscode")
    if ok_vscode then
      -- Load friendly-snippets
      vscode_loader.lazy_load()

      -- Load custom snippets from ~/.config/nvim/snippets
      vscode_loader.lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
    end

    -- Setup snippet expansion for blade files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "blade",
      callback = function()
        -- Make blade files use html + blade snippets
        ls.filetype_extend("blade", { "html", "php" })
      end,
    })
  end,
})

return {}
