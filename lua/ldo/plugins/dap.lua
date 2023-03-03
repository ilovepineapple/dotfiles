local setup, dap = pcall(require, "dap")

if not setup then
  return
end

dap.adapters.firefox = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/vscode/vscode-firefox-debug/dist/adapter.bundle.js" },
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/vscode/vscode-chrome-debug/out/src/chromeDebug.js" },
}

dap.configurations.javascript = {
  {
    name = "Debug with Chrome",
    type = "chrome",
    request = "attach",
    -- program = "${file}",
    -- cwd = vim.fn.getcwd(),
    trace = true,
    sourceMaps = true,
    -- protocol = "inspector",
    port = 9222,
    -- url = "http://localhost:8080",
    webRoot = "${workspaceFolder}",
  },
}

local dap_breakpoint = {
  error = {
    text = "🔴",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "⭐️",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
