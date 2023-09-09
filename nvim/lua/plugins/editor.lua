-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "nat-418/boole.nvim",
    config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
      })
    end

  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence"):setup({
        auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image          = "file",                     -- Main image display (either "neovim" or "file")
        client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
        log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number  = false,                      -- Displays the current line number instead of the current project
        blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time           = true,                       -- Show the timer

        -- Rich Presence text options
        editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = "Working on %s",      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      })
    end

  },
  {
    'ThePrimeagen/harpoon',
    global_settings = {
      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon", "nerdtree" },

      -- set marks specific to each git branch inside git repository
      mark_branch = false,

      -- enable tabline with harpoon marks
      tabline = true,
      tabline_prefix = "testing",
      tabline_suffix = "testing",
    }


  },
  {
    "windwp/nvim-ts-autotag"
  },
  {
    "Pocco81/true-zen.nvim",
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  {
    'lervag/vimtex',

  },

  {
    "mg979/vim-visual-multi"
  },


  {
    "zbirenbaum/copilot.lua",
    opts = {
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({})
      end,
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        md = false,
        rust = true,
      },
    },
  },
  -- add noice.nvim from folke
  -- disable mini.bufremove
  { "echasnovski/mini.bufremove", enabled = false },

  -- use bdelete instead
  {
    "famiu/bufdelete.nvim",
    -- stylua: ignore
    config = function()
      -- switches to Alpha dashboard when last buffer is closed
      local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = "BDeletePost*",
        group = alpha_on_empty,
        callback = function(event)
          local fallback_name = vim.api.nvim_buf_get_name(event.buf)
          local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
          local fallback_on_empty = fallback_name == "" and fallback_ft == ""
          if fallback_on_empty then
            require("neo-tree").close_all()
            vim.cmd("Alpha")
            vim.cmd(event.buf .. "bwipeout")
          end
        end,
      })
    end,
    keys = {
      { "<leader>bd", "<CMD>Bdelete<CR>",  desc = "Delete Buffer" },
      { "<leader>bD", "<CMD>Bdelete!<CR>", desc = "Delete Buffer (Force)" },
    },
  },

  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 25,
      },
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      filesystem = {
        follow_current_file = {
          enabled = true,
        },                                      -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true,                -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      },
    },
  },

  { "gbprod/substitute.nvim" },
  -- customize telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-project.nvim" },
      { "debugloop/telescope-undo.nvim" },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            preview_cutoff = 0.2,
            preview_height = 0.4
          },
          height = 0.9,
          width = 0.9
        },
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end
          },
          n = {
            ["j"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["k"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["gg"] = function(...)
              return require("telescope.actions").move_to_top(...)
            end,
            ["G"] = function(...)
              return require("telescope.actions").move_to_bottom(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end
          }
        },
      },
      extensions = {
        project = {
          base_dirs = {
            '~/coding'
          }
        },
        undo = {
          use_delta = true,
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.4,
          },
        },
      },
    },
    keys = {
      {
        "<leader>fp",
        "<CMD>Telescope project display_type=full<CR>",
        desc = "Find project"
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("dap")
      telescope.load_extension("fzf")
      telescope.load_extension("project")
      telescope.load_extension("undo")
    end,
  },

  -- which-key extensions
  {
    "folke/which-key.nvim",
    opts = function()
      require("which-key").register({
        ["<leader>d"] = { name = "+debug", mode = { "n", "v" } },
        ["<leader>ct"] = { name = "+test" },
      })
    end
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = function()
      local icons = require("lazyvim.config").icons
      require("symbols-outline").setup({
        symbols = {
          File = { icon = icons.kinds.File, hl = "TSURI" },
          Module = { icon = icons.kinds.Module, hl = "TSNamespace" },
          Namespace = { icon = icons.kinds.Namespace, hl = "TSNamespace" },
          Package = { icon = icons.kinds.Package, hl = "TSNamespace" },
          Class = { icon = icons.kinds.Class, hl = "TSType" },
          Method = { icon = icons.kinds.Method, hl = "TSMethod" },
          Property = { icon = icons.kinds.Property, hl = "TSMethod" },
          Field = { icon = icons.kinds.Field, hl = "TSField" },
          Constructor = { icon = icons.kinds.Constructor, hl = "TSConstructor" },
          Enum = { icon = icons.kinds.Enum, hl = "TSType" },
          Interface = { icon = icons.kinds.Interface, hl = "TSType" },
          Function = { icon = icons.kinds.Function, hl = "TSFunction" },
          Variable = { icon = icons.kinds.Variable, hl = "TSConstant" },
          Constant = { icon = icons.kinds.Constant, hl = "TSConstant" },
          String = { icon = icons.kinds.String, hl = "TSString" },
          Number = { icon = icons.kinds.Number, hl = "TSNumber" },
          Boolean = { icon = icons.kinds.Boolean, hl = "TSBoolean" },
          Array = { icon = icons.kinds.Array, hl = "TSConstant" },
          Object = { icon = icons.kinds.Object, hl = "TSType" },
          Key = { icon = icons.kinds.Key, hl = "TSType" },
          Null = { icon = icons.kinds.Null, hl = "TSType" },
          EnumMember = { icon = icons.kinds.EnumMember, hl = "TSField" },
          Struct = { icon = icons.kinds.Struct, hl = "TSType" },
          Event = { icon = icons.kinds.Event, hl = "TSType" },
          Operator = { icon = icons.kinds.Operator, hl = "TSOperator" },
          TypeParameter = { icon = icons.kinds.TypeParameter, hl = "TSParameter" },
        }
      })
    end
  },
}
