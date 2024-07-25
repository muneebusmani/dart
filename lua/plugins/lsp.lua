-- if true then
--   return {}
-- end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      servers = {
        dartls = {},
      },
    },
  },
}
