-- ============================================================
-- Indent Blankline 缩进参考线配置
-- ============================================================
-- 显示垂直缩进参考线，帮助识别代码块层级
-- 支持当前作用域高亮，方便阅读嵌套代码
-- ============================================================

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",  -- 插件主模块
  opts = {
    indent = {
      char = "|",           -- 缩进线字符
      tab_char = "|",       -- Tab 缩进字符
      highlight = "IblIndent",  -- 缩进线高亮组
    },
    scope = {
      enabled = true,       -- 启用当前作用域高亮
      show_start = true,    -- 显示作用域起始标记
      show_end = false,     -- 不显示作用域结束标记
      highlight = "IblScope",  -- 作用域高亮组
    },
    exclude = {
      -- 在以下文件类型中禁用缩进线
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
