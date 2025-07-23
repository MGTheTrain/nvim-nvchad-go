return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
        'leoluz/nvim-dap-go',
        ft = 'go',
        dependencies = 'mfussenegger/nvim-dap',
        config = function(_, opts)
            require('dap-go').setup(opts)
        end,
    },
    {
        'ray-x/go.nvim',
        dependencies = {
           'ray-x/guihua.lua',
           'neovim/nvim-lspconfig',
           'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('go').setup()
        end,
        event = {'CmdlineEnter'},
        ft = {'go', 'gomod'},
        build = ':lua require("go.install").update_all_sync()'
    },
}
