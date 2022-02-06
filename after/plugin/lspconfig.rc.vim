if !exists('g:lspconfig')
  finish
endif

lua << EOF
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

nvim_lsp.diagnosticls.setup {
  capabilities = coq.lsp_ensure_capabilities(),
  -- capabilities = capabilities,
  filetypes = { 'java', 'kotlin', 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc', 'python' },
  init_options = {}
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    },
    update_in_insert = false,
  }
)

EOF
