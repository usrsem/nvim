if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
require("lspsaga").init_lsp_saga({
  use_saga_diagnostic_sign = true,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  code_action_prompt = {
      enable = false
  },
  dianostic_header_icon = '   ',
  -- code_action_icon = "",
  -- code_action_prompt = { enable = true, sign = true, sign_priority = 20, virtual_text = false },
  border_style = "round",
  -- finder_definition_icon = '  ',
  -- finder_reference_icon = '  ',
  -- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  -- rename_action_keys = {
  --   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  -- },
  -- definition_preview_icon = '  '
  -- border_style = "single" -- "single" "double" "round" "plus"
  -- rename_rompt_prefix = '➤',
  -- if you don't use nvim-lspconfig you must pass your server name ad
  -- the related filetypes into this table
  -- like server_filetype_map = {metals = {'sbt', 'scala'}}
  -- server_filetype_map = {jdtls = {'java'}}
})
EOF

" nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
