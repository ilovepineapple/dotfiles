local setup, dap = pcall(require, "dap")

if not setup then
  return
end

dap.adapters.firefox = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/vscode/vscode-firefox-debug/dist/adapter.bundle.js" },
}

dap.configurations.typescript = {
  {
    name = "Debug with Firefox",
    type = "firefox",
    request = "launch",
    reAttach = true,
    url = "http://localhost:3000",
    webRoot = "${workspaceFolder}",
    firefoxExecutable = "/usr/bin/firefox",
    firefoxExecutablePath = "/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox-bin",
  },
}

local dap_breakpoint = {
  error = {
    text = "●",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "○",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "◆",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
