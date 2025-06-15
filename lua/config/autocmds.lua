-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function tableContains(table, value)
  for i = 1, #table do
    if table[i] == value then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "EslintFixAll on write",

  group = vim.api.nvim_create_augroup("eslintOnSave", { clear = true }),
  callback = function(opts)
    local filetypes = { "typescript", "javascript", "vue" }
    if tableContains(filetypes, vim.bo[opts.buf].filetype) then
      vim.cmd("EslintFixAll")
    end
  end,
})
