-- ============================================================
-- Nvim-Autopairs 自动括号补全配置
-- ============================================================
-- 自动补全括号、引号、引号对等
-- 输入 ( 时自动添加 )，输入 " 时自动添加 " 等
-- ============================================================

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",  -- 进入插入模式时加载
  config = function()
    require("nvim-autopairs").setup({
      -- 在以下文件类型中禁用自动补全
      disable_filetype = { "TelescopePrompt", "vim" },
    })
  end,
}
