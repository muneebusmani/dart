
-- vim.cmd([[
--   augroup LintAutogroup
--     autocmd!
--     autocmd BufWritePost *.dart lua require('lint').try_lint()
--   augroup END
-- ]])
-- Set up auto-commands for linting
vim.api.nvim_create_augroup("LintAutogroup", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = "*.dart",
  callback = function()
    require('lint').try_lint()
  end,
  group = "LintAutogroup",
})

-- Set up auto-commands for formatting
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = "*.dart",
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 1000)
  end,
})

