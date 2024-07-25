-- if true then
--   return {}
-- end
return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      dockerfile = { "hadolint" },
      markdown = { "markdownlint-cli2" },
      dart = { "dartanalyzer" },
    },
    linters = {
      dart_analyze = {
        cmd = "dart", -- Command to run
        stdin = false,
        args = { "analyze" }, -- Arguments to pass
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics = {}
          local lines = vim.split(output, "\n")

          for _, line in ipairs(lines) do
            local _, _, filename, line, col, severity, code, message =
              string.find(line, "^[^:]+:([^:]+):(%d+):(%d+): (%a+)%[%w+%]: (.*)$")
            if filename and line and col and severity and message then
              table.insert(diagnostics, {
                bufnr = bufnr,
                lnum = tonumber(line) - 1,
                col = tonumber(col) - 1,
                severity = vim.lsp.protocol.DiagnosticSeverity[severity:upper()],
                source = "dartanalyzer",
                message = message,
                code = code,
              })
            end
          end

          return diagnostics
        end,
      },
    },
  },
}
