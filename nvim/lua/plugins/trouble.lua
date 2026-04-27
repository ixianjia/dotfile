-- ============================================================
-- Trouble 诊断列表配置
-- ============================================================
-- 提供美观的诊断信息列表界面
-- 替代默认的 Quickfix/Location List，显示错误、警告、引用等
-- ============================================================

return {
  "folke/trouble.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },  -- 文件类型图标
  opts = {
    focus = true,  -- 打开时自动聚焦到 Trouble 窗口
  },
  cmd = "Trouble",  -- 注册命令
  keys = {
    -- 快捷键映射
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },           -- 全局诊断
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },  -- 当前 Buffer 诊断
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },      -- 符号列表
    { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Definitions/References/... (Trouble)" },  -- LSP 引用/定义
    { "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },            -- 位置列表
    { "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },             -- Quickfix 列表
  },
}
