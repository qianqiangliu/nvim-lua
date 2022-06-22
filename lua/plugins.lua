require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
     'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
  }
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'numToStr/FTerm.nvim'
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "ellisonleao/gruvbox.nvim"
  use "hrsh7th/nvim-cmp"

  -- setup
  require('lualine').setup()

  require('nvim-tree').setup()
  vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
          vim.cmd "quit"
        end
      end
    })

  require('aerial').setup({})
  require('nvim-treesitter').setup()

  require('FTerm').setup({
      border = 'double',
      dimensions  = {
          height = 0.9,
          width = 0.9,
      },
      auto_close = true,
      blend = 0,
  })

  require('telescope').setup()

  local servers = { 'pyright', 'clangd' }
  for _, lsp in pairs(servers) do
      require('lspconfig')[lsp].setup {
          on_attach = require("aerial").on_attach,
          flags = {
              debounce_text_changes = 150,
          }
      }
  end

  vim.cmd([[colorscheme gruvbox]])
end)
