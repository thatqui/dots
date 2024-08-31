vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    --if require('nvim-tree') then
      --vim.cmd('NvimTreeToggle')
    --end
  end
})
