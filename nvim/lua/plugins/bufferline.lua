-- ============================================================
-- Bufferline Buffer 标签页配置
-- ============================================================
-- 在顶部显示 Buffer 标签栏，类似 VSCode 的标签页
-- 方便在多个打开的文件之间切换
-- ============================================================

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "kyazdani42/nvim-web-devicons",  -- 文件类型图标
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",  -- 显示模式：buffers（缓冲区）或 tabs（标签页）
        -- 使用极简样式预设
        style_preset = require("bufferline").style_preset.minimal,
        numbers = "none",  -- 不显示序号
        close_command = "bdelete! %d",       -- 关闭按钮命令
        right_mouse_command = "bdelete! %d", -- 右键关闭
        left_mouse_command = "buffer %d",    -- 左键切换
        middle_mouse_command = nil,          -- 中键无操作
        indicator = { style = "icon" },      -- 指示器样式
        buffer_close_icon = "x",             -- 关闭图标
        modified_icon = "+",                 -- 修改标记
        close_icon = "",                     -- 关闭按钮图标
        left_trunc_marker = "",              -- 左侧截断标记
        right_trunc_marker = "",             -- 右侧截断标记
        max_name_length = 18,                -- 文件名最大长度
        max_prefix_length = 15,              -- 路径前缀最大长度
        tab_size = 18,                       -- 标签宽度
        diagnostics = "nvim_lsp",            -- 显示 LSP 诊断
        diagnostics_update_in_insert = false,  -- 插入模式下不更新诊断
        show_tab_indicators = true,          -- 显示标签指示器
        show_close_icon = false,             -- 不显示全局关闭图标
        persist_buffer_sort = true,          -- 保持 Buffer 排序
        separator_style = "thin",            -- 分隔符样式
        enforce_regular_tabs = false,        -- 不强制等宽标签
        always_show_bufferline = true,       -- 始终显示标签栏
        sort_by = "id",                      -- 按 ID 排序
      },
    })
  end,
}
