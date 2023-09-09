return {
  { 'ZhiyuanLck/smart-pairs' },
  {
    "echasnovski/mini.surround",
    opts = {

      mappings = {
        add = "gza"
      }
    }
  },
  -- extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local luasnip = require("luasnip")
      local cmp = require('cmp')


      --disable documentation after completion

      opts.formatting = {
        format = function(entry, vim_item)
          vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            buffer = "[BUF]",
            luasnip = "[LuaSnip]",
            nvim_treesitter = "[TS]",
            path = "[Path]",
            cmp_tabnine = "[TN]",
            emoji = "[Emoji]",
            spell = "[Spell]",
            calc = "[Calc]",
            vsnip = "[VSnip]",
            ultisnips = "[UltiSnip]",
            treesitter = "[TS]",
            snippets_nvim = "[Snip]",
            latex_symbols = "[Latex]",
          })[entry.source.name]
          return vim_item
        end,
      }


      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
          "i",
          "s",
          "n",
          "v",
        }),
        ["CR"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
          "s",
          "n",
          "v",
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- scopes
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    config = true
  },

  -- editor config support
  {
    "editorconfig/editorconfig-vim",
    event = "VeryLazy",
  },

  -- tidy

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "astro",
        "bash",
        "comment",
        "diff",
        "dockerfile",
        "dot",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "hcl",
        "http",
        "jq",
        "julia",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "python",
        "prisma",
        "regex",
        "sql",
        "vim",
        "yaml",
        "typescript",
        "json",
        "javascript",
        "rust",
        "go",
      }
    }
  },

}
