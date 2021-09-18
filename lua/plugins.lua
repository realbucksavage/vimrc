vim.cmd [[packadd packer.nvim]]

local packer = require'packer'

return packer.startup(function()
    use 'wbthomason/packer.nvim'

    use 'chr4/nginx.vim'
    use 'tpope/vim-surround'
    use 'preservim/nerdcommenter'
    use 'tpope/vim-repeat'
    use 'tpope/vim-endwise'
    use 'tpope/vim-sleuth'
    use 'sickill/vim-pasta'
    use 'airblade/vim-gitgutter'
    use 'jiangmiao/auto-pairs'

    use {
        'whatyouhide/vim-gotham',
        setup = function()
            vim.cmd [[ colorscheme gotham ]]
        end
    }
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require 'components.lualine'
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'components.tree'
        end
    }

    use 'ctrlpvim/ctrlp.vim'
    use 'tpope/vim-fugitive'

    use 'mboughaba/i3config.vim'

    use 'fatih/vim-go'

    use 'cespare/vim-toml'
    use 'rust-lang/rust.vim'

    use {
        'mfussenegger/nvim-dap',
        config = function()
            require 'components.dap'
        end
    }
    use {
        'rcarriga/nvim-dap-ui',
        requires = 'mfussenegger/nvim-dap',
        setup = function()
            vim.g.dap_virtual_text = true
        end,
        config = function()
            require'dapui'.setup()
        end
    }
    use 'theHamsta/nvim-dap-virtual-text'

    use 'mfussenegger/nvim-jdtls'
    use 'scalameta/nvim-metals'

    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'components.bufferline'
        end
    }
    use 'SirVer/ultisnips'

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require 'components.lspclient'
        end
    }
    use 'nvim-lua/lsp_extensions.nvim'

    use {
        'nvim-lua/completion-nvim',
        config = function()
            vim.g.completion_sorting = 'none'
            vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
            vim.g.completion_enable_snippet = 'UltiSnips'
            vim.g.completion_enable_auto_paren = 1
            vim.g.completion_popup_border='rounded'
        end
    }

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'components.trouble'
        end
    }
end)


