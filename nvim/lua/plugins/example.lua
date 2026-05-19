--[[
  自定义插件配置
  在这里添加、修改或禁用插件
--]]

return {
  -- 添加 gruvbox 主题（可选）
  { "ellisonleao/gruvbox.nvim" },

  -- 配置 LazyVim 使用 tokyonight 主题
  {
    "LazyVim/LazyVim",
    opts = {
      -- 可选主题：tokyonight, gruvbox, kanagawa, catppuccin
      colorscheme = "tokyonight",
    },
  },

  -- 配置 LSP 服务器（会自动安装）
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 自动安装的 LSP 服务器
      servers = {
        -- Python (需要 pyright)
        pyright = {},
        -- TypeScript/JavaScript (需要 ts_ls)
        ts_ls = {},
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        -- Go
        gopls = {},
        -- JSON/YAML
        jsonls = {},
        -- Markdown
        markdown_od = {},
        -- Bash
        bashls = {},
        -- HTML/CSS
        html = {},
        -- CSS
        cssls = {},
        -- Vue
        volar = {},
        -- Rust
        rust_analyzer = {},
      },
    },
  },

  -- 配置 Mason（安装 LSP 服务器、格式化器、Linter）
  {
    "mason-org/mason.nvim",
    opts = {
      -- 自动安装的工具
      ensure_installed = {
        -- 格式化器
        "stylua",      -- Lua 格式化
        "shfmt",       -- Shell 格式化
        "prettier",     -- JS/TS 格式化
        "black",       -- Python 格式化
        "isort",       -- Python import 排序
        -- LSP 服务器
        "pyright",     -- Python LSP
        "ts_ls",       -- TypeScript LSP
        "lua_ls",      -- Lua LSP
        "gopls",       -- Go LSP
        "jsonls",      -- JSON LSP
        "markdown-od", -- Markdown LSP
        "html",        -- HTML LSP
        "cssls",       -- CSS LSP
        "volar",       -- Vue LSP
        "rust_analyzer", -- Rust LSP
        -- Linter
        "shellcheck",  -- Shell Linter
        "flake8",      -- Python Linter
        "eslint",       -- JS/TS Linter
      },
    },
  },

  -- 配置 Treesitter（语法高亮）
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- 自动安装的语法解析器
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },

  -- 配置 Trouble（显示 LSP 诊断、Todo 等）
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
    },
  },

  -- 配置conform（代码格式化）
  {
    "stevearc/conform.nvim",
    opts = {
      -- 格式化器配置
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
    },
  },

  -- 添加 Telescope 快捷键
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- 查找文件
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "查找文件",
      },
      -- 搜索内容
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "搜索内容",
      },
      -- 打开缓冲区
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "打开缓冲区",
      },
      -- 帮助文档
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "帮助文档",
      },
      -- 跳转定义
      {
        "<leader>fd",
        function()
          require("telescope.builtin").lsp_definitions()
        end,
        desc = "跳转到定义",
      },
      -- 跳转引用
      {
        "<leader>fr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = "跳转到引用",
      },
    },
  },

  -- 添加 WhichKey 快捷键提示
  {
    "folke/which-key.nvim",
    opts = {
      -- 定义快捷键组
      groups = {
        -- LSP 组
        l = {
          name = "LSP",
          d = { "跳转到定义", mode = "n" },
          D = { "跳转到声明", mode = "n" },
          i = { "跳转到实现", mode = "n" },
          r = { "跳转到引用", mode = "n" },
          t = { "跳转到类型定义", mode = "n" },
          f = { "格式化代码", mode = "n" },
          rn = { "重命名", mode = "n" },
        },
        -- 文件组
        f = {
          name = "文件",
          f = { "查找文件", mode = "n" },
          g = { "搜索内容", mode = "n" },
          b = { "打开缓冲区", mode = "n" },
          h = { "帮助文档", mode = "n" },
          d = { "跳转到定义", mode = "n" },
          r = { "跳转到引用", mode = "n" },
        },
        -- 窗口组
        w = {
          name = "窗口",
          h = { "水平分割", mode = "n" },
          v = { "垂直分割", mode = "n" },
          q = { "关闭窗口", mode = "n" },
        },
        -- Buffer 组
        b = {
          name = "Buffer",
          d = { "关闭当前 buffer", mode = "n" },
          n = { "下一个 buffer", mode = "n" },
          p = { "上一个 buffer", mode = "n" },
          ["1"] = { "跳转到 buffer 1", mode = "n" },
          ["2"] = { "跳转到 buffer 2", mode = "n" },
          ["3"] = { "跳转到 buffer 3", mode = "n" },
          ["4"] = { "跳转到 buffer 4", mode = "n" },
          ["5"] = { "跳转到 buffer 5", mode = "n" },
          ["6"] = { "跳转到 buffer 6", mode = "n" },
          ["7"] = { "跳转到 buffer 7", mode = "n" },
          ["8"] = { "跳转到 buffer 8", mode = "n" },
          ["9"] = { "跳转到 buffer 9", mode = "n" },
        },
        -- 标签页组
        t = {
          name = "标签页",
          n = { "新建标签页", mode = "n" },
          o = { "关闭其他标签页", mode = "n" },
          c = { "关闭当前标签页", mode = "n" },
          m = { "移动标签页", mode = "n" },
          j = { "下一个标签页", mode = "n" },
          k = { "上一个标签页", mode = "n" },
        },
      },
    },
  },

  -- 配置 Comment（注释插件）
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", desc = "注释当前行", mode = "n" },
      { "gc", desc = "注释选中区域", mode = "v" },
      { "gco", desc = "添加注释", mode = "n" },
      { "gcA", desc = "在行尾添加注释", mode = "n" },
      { "gcO", desc = "在上一行添加注释", mode = "n" },
      { "gcu", desc = "取消注释", mode = "n" },
    },
  },

  -- 配置 Autopairs（自动配对括号）
  {
    "windwp/nvim-autopairs",
    opts = {
      -- 快速输入配置
      fast_wrap = {},
    },
  },

  -- 配置 GitSigns（Git 集成）
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- 显示 Git 状态
      signs = {
        add = { text = "│" },
        change = { text = "┋" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┿" },
      },
      -- 在当前行显示 git diff
      current_line_blame = true,
    },
  },

  -- 配置 indent-blankline（缩进线）
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      -- 缩进字符
      char = "│",
      -- 禁用空行的缩进线
      show_end_of_line = false,
      -- 空格替代缩进线
      space_char_blankline = " ",
    },
  },

  -- 添加 NeoTree（文件浏览器）
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree reveal<CR>",
        desc = "打开文件浏览器",
      },
    },
  },

  -- 配置.vim.gin（Git 提交信息编辑）
  {
    "tpope/vim-fugitive",
    keys = {
      { "G", desc = "Git 命令", mode = "n" },
    },
  },
}