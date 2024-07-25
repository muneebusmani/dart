-- if true then
--   return {}
-- end
return {
  "stevearc/conform.nvim",
  ---@type conform.setupOpts
  ---
  opts = {
    formatters_by_ft = {
      dart = { "dart_format" },
    },
    formatters = {
      dart_format = {
        command = "dart",
        args = { "format", "$FILENAME" },
        -- stdin = false,
      },
    },
  },
}
