-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- { 'mg979/vim-visual-multi' },
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { 'mfussenegger/nvim-jdtls' },
  -- {
  --   'mfussenegger/nvim-jdtls',
  --   -- config = {
  --   --   settings = {
  --   --     java = {
  --   --       format = {
  --   --         enabled = true,
  --   --       },
  --   --     },
  --   --   },
  --   -- },
  -- },
  -- interface FormatOption {
  --         comments?: EnabledOption;
  --         enabled?: boolean;
  --         insertSpaces?: boolean;
  --         onType?: EnabledOption;
  --         settings?: FormatSettingsOption;
  --         tabSize?: number;
  -- }

  -- {
  --   'ThePrimeagen/harpoon',
  --   branch = 'harpoon2',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  -- },

  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end,
  },

  -- { -- Autocompletion
  --   'hrsh7th/nvim-cmp',
  --   event = 'InsertEnter',
  --   dependencies = {
  --     -- Snippet Engine & its associated nvim-cmp source
  --     {
  --       'L3MON4D3/LuaSnip',
  --       build = (function()
  --         -- Build Step is needed for regex support in snippets.
  --         -- This step is not supported in many windows environments.
  --         -- Remove the below condition to re-enable on windows.
  --         if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
  --           return
  --         end
  --         return 'make install_jsregexp'
  --       end)(),
  --       dependencies = {
  --         -- `friendly-snippets` contains a variety of premade snippets.
  --         --    See the README about individual language/framework/plugin snippets:
  --         --    https://github.com/rafamadriz/friendly-snippets
  --         -- {
  --         --   'rafamadriz/friendly-snippets',
  --         --   config = function()
  --         --     require('luasnip.loaders.from_vscode').lazy_load()
  --         --   end,
  --         -- },
  --       },
  --     },
  --     'saadparwaiz1/cmp_luasnip',
  --
  --     -- Adds other completion capabilities.
  --     --  nvim-cmp does not ship with all sources by default. They are split
  --     --  into multiple repos for maintenance purposes.
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --   },
  --   config = function()
  --     -- See `:help cmp`
  --     local cmp = require 'cmp'
  --     local luasnip = require 'luasnip'
  --     luasnip.config.setup {}
  --
  --     cmp.setup {
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --
  --       -- apoulos modify drop down list to not show parameters
  --       -- from: https://www.youtube.com/watch?v=uDPZ2yJS6os
  --       formatting = {
  --         expandable_indicator = true,
  --         fields = { 'kind', 'abbr', 'menu' },
  --         format = function(entry, vim_item)
  --           -- vim_item.kind = " " .. (icons[vim_item.kind] or "")
  --           -- vim_item.menu = "-> " .. icons[entry.source.name]
  --           -- vim_item.kind = vim_item
  --           vim_item.menu = '' -- entry.source.name
  --
  --           local function trim(text)
  --             local max = 30
  --             if text and text:len() > max then
  --               text = text:sub(1, max) .. '...'
  --             end
  --             return text
  --           end
  --
  --           vim_item.abbr = trim(vim_item.abbr)
  --           return vim_item
  --         end,
  --       },
  --
  --       --   expandable_indicator = false,
  --       --   fields = { 'abbr' },
  --       --   format = function(_, vim_item)
  --       --     vim_item.abbr = vim_item.abbr:match '[^(]+'
  --       --     return vim_item
  --       --   end,
  --       -- },
  --
  --       -- view = {
  --       --   entries = { name = 'custom', selection_order = 'near_cursor' },
  --       --   -- entries = 'custom', -- can be "custom", "wildmenu" or "native"
  --       -- },
  --
  --       completion = { completeopt = 'menu,menuone,noinsert' },
  --
  --       -- apoulos
  --       window = {
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --       view = {
  --         docs = { auto_open = true },
  --         entries = {
  --           name = 'custom',
  --           -- selection_order = 'near_cursor',
  --         },
  --       },
  --
  --       -- For an understanding of why these mappings were
  --       -- chosen, you will need to read `:help ins-completion`
  --       --
  --       -- No, but seriously. Please read `:help ins-completion`, it is really good!
  --       mapping = cmp.mapping.preset.insert {
  --         -- apoulos
  --         ['K'] = cmp.mapping(function(fallback)
  --           if cmp.visible_docs() then
  --             cmp.close_docs()
  --           elseif cmp.visible() then
  --             cmp.open_docs()
  --           else
  --             fallback()
  --           end
  --         end),
  --         -- Select the [n]ext item
  --         ['<C-n>'] = cmp.mapping.select_next_item(),
  --         -- Select the [p]revious item
  --         ['<C-p>'] = cmp.mapping.select_prev_item(),
  --
  --         -- Scroll the documentation window [b]ack / [f]orward
  --         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --
  --         -- Accept ([y]es) the completion.
  --         --  This will auto-import if your LSP supports it.
  --         --  This will expand snippets if the LSP sent a snippet.
  --         ['<C-y>'] = cmp.mapping.confirm { select = true },
  --
  --         -- If you prefer more traditional completion keymaps,
  --         -- you can uncomment the following lines
  --         -- ['<CR>'] = cmp.mapping.confirm { select = true },
  --         -- ['<Tab>'] = cmp.mapping.select_next_item(),
  --         -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  --         -- apoulos
  --         ['<Tab>'] = cmp.mapping.confirm { select = true },
  --
  --         -- Manually trigger a completion from nvim-cmp.
  --         --  Generally you don't need this, because nvim-cmp will display
  --         --  completions whenever it has completion options available.
  --         ['<C-Space>'] = cmp.mapping.complete {},
  --
  --         -- Think of <c-l> as moving to the right of your snippet expansion.
  --         --  So if you have a snippet that's like:
  --         --  function $name($args)
  --         --    $body
  --         --  end
  --         --
  --         -- <c-l> will move you to the right of each of the expansion locations.
  --         -- <c-h> is similar, except moving you backwards.
  --         ['<C-l>'] = cmp.mapping(function()
  --           if luasnip.expand_or_locally_jumpable() then
  --             luasnip.expand_or_jump()
  --           end
  --         end, { 'i', 's' }),
  --         ['<C-h>'] = cmp.mapping(function()
  --           if luasnip.locally_jumpable(-1) then
  --             luasnip.jump(-1)
  --           end
  --         end, { 'i', 's' }),
  --
  --         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
  --         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  --       },
  --       sources = {
  --         {
  --           name = 'lazydev',
  --           -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
  --           group_index = 0,
  --         },
  --         { name = 'nvim_lsp' },
  --         { name = 'luasnip' },
  --         { name = 'path' },
  --       },
  --     }
  --   end,
  -- },

  -- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  -- { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },

  -- from: https://github.com/folke/flash.nvim
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  -- from: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          move = {
            enable = true,
            set_jumps = true,             -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@function.outer", -- apoulos was m
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
              --
              -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
              -- ["]o"] = "@loop.*",
              -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
              --
              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              -- ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
              -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            -- goto_next = {
            --   ["]d"] = "@conditional.outer",
            -- },
            -- goto_previous = {
            --   ["[d"] = "@conditional.outer",
            -- }
          },
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>c"] = "@parameter.inner", -- { query = "@parameter.inner", desc = "Swap parameters" } -- apoulos was a
            },
            swap_previous = {
              ["<leader>C"] = "@parameter.inner", -- apoulos was A
            },
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
        },
      })
    end
  },

  -- from: https://github.com/abecodes/tabout.nvim
  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true,            -- shift content if tab out is not possible
        act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>',  -- reverse shift default action,
        enable_backwards = true,      -- well ...
        completion = false,           -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp"
    },
    opt = true,              -- Set this to true if the plugin is optional
    event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },

  -- from: https://github.com/Wansmer/treesj
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>b' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup({ --[[ your config ]] })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  -- from: https://github.com/nvim-treesitter/nvim-treesitter-context
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { "nvim-treesitter" },
    config = function()
      require("treesitter-context").setup({
        enable = true,          -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false,    -- Enable multiwindow support.
        max_lines = 0,          -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',   -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',        -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,   -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end
  },
}
