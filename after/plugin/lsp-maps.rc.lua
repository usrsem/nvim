--[[ local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc') ]]

local map = vim.api.nvim_set_keymap
-- Mappings.
local opts = { noremap=true, silent=true }
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- map('n', 'K', "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

-- Java specific
map("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)

map("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
map("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
map("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- map("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<leader>ca", "<Cmd>lua require('jdtls').code_action()<CR>", opts)
map("v", "<leader>ca", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>", opts)
map("n", "<leader>cA", "<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>", opts)
