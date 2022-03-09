local nvim_lsp = require('lspconfig')

local protocol = require'vim.lsp.protocol'

local coq = require "coq"


nvim_lsp.pyright.setup{
}

nvim_lsp.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" }
}

nvim_lsp.kotlin_language_server.setup{
}

nvim_lsp.clangd.setup{}

nvim_lsp.r_language_server.setup{}

nvim_lsp.diagnosticls.setup {
  capabilities = coq.lsp_ensure_capabilities(),
  capabilities = capabilities,
  filetypes = { 'java', 'kotlin', 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc', 'python' },
  init_options = {
  }
}


-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    --[[ virtual_text = {
     spacing = 4,
      prefix = ''
    }, ]]
    virtual_text = false,
    update_in_insert = false,
  }
)

local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

