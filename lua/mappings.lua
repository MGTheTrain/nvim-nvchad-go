require "nvchad.mappings"  -- Load existing mappings

-- add yours here

local map = vim.keymap.set

-- Debugging
map('n', '<Leader>dc', ':DapContinue<CR>', { noremap = true, silent = true, desc = "Start or continue debugging" })
map('n', '<Leader>do', ':DapStepOver<CR>', { noremap = true, silent = true, desc = "Step over" })
map('n', '<Leader>di', ':DapStepInto<CR>', { noremap = true, silent = true, desc = "Step into" })
map('n', '<Leader>db', ':DapToggleBreakpoint<CR>', { noremap = true, silent = true, desc = "Toggle breakpoint" })
map('n', '<Leader>dt', ':DapTerminate<CR>', { noremap = true, silent = true, desc = "Stop debugging" })

map('n', '<Leader>dr', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { noremap = true, silent = true, desc = "Print stack trace" })

map('n', '<Leader>dv', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, { noremap = true, silent = true, desc = "Inspect variable under cursor" })

map('n', '<leader>ds', function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
end, { desc = 'Open debugging sidebar' })

-- Telescope mappings
map('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true, desc = "Find files" })
map('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true, desc = "Live grep" })
map('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true, desc = "List open buffers" })
map('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true, desc = "Find help tags" })
