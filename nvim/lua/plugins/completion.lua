-- ============================================================
-- 代码补全配置 (nvim-cmp)
-- ============================================================
-- 提供智能代码补全，支持 LSP、缓冲区、路径、代码片段等多种来源
-- ============================================================

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",  -- 进入插入模式时加载
  dependencies = {
    -- LSP 补全源
    "hrsh7th/cmp-nvim-lsp",
    -- 当前缓冲区单词补全
    "hrsh7th/cmp-buffer",
    -- 文件路径补全
    "hrsh7th/cmp-path",
    -- 命令行补全
    "hrsh7th/cmp-cmdline",
    -- 代码片段引擎
    "L3MON4D3/LuaSnip",
    -- LuaSnip 补全源
    "saadparwaiz1/cmp_luasnip",
    -- 预定义代码片段集合
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    -- 加载 VSCode 格式的代码片段
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      -- 补全菜单选项：menu 显示菜单，menuone 单选项也显示，noinsert 不自动插入
      completion = { completeopt = "menu,menuone,noinsert" },
      -- 代码片段展开配置
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      -- 插入模式快捷键映射
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),   -- 向上滚动文档
        ["<C-f>"] = cmp.mapping.scroll_docs(4),    -- 向下滚动文档
        ["<C-Space>"] = cmp.mapping.complete(),    -- 手动触发补全
        ["<C-e>"] = cmp.mapping.abort(),           -- 取消补全
        ["<CR>"] = cmp.mapping.confirm({ select = false }),  -- 确认选择（不自动选中）
        -- Tab 键：在补全菜单中选择下一项 / 展开或跳转代码片段
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Shift+Tab：选择上一项 / 代码片段反向跳转
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            require("luasnip").jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- 补全来源配置
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP 补全
        { name = "luasnip" },   -- 代码片段
        { name = "buffer" },    -- 当前缓冲区单词
        { name = "path" },      -- 文件路径
      }),
      -- 补全项格式化显示
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- 使用 lspkind 显示图标
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "   (" .. (strings[2] or "") .. ")"
          return kind
        end,
      },
    })

    -- ============================================================
    -- 命令行补全
    -- ============================================================
    -- 搜索模式 (/) 补全：使用缓冲区单词
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })
    -- 命令模式 (:) 补全：使用路径和命令
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "path" }, { name = "cmdline" } },
    })
  end,
}
