local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local home = os.getenv('HOME')
local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {}

config.root_dir = root_dir

config.cmd = { 'java-lsp.sh', workspace_folder }

config.settings = { 
  java = {
    signatureHelp = { enabled = true },
    saveActions = {
      organizeImports = true,
    },
  }
}

local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local pickers = require'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {}
  pickers.new(opts, {
    prompt_title = prompt,
    finder    = finders.new_table {
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end

require('jdtls').start_or_attach(config)

