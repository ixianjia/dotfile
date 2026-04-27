-- ============================================================
-- Lualine 状态栏配置
-- ============================================================
-- 替换 Neovim 默认状态栏，提供更美观和信息丰富的显示
-- 显示模式、分支、差异、诊断、文件名、编码、文件类型等
-- ============================================================

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },  -- 文件类型图标
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,  -- 启用图标
        theme = "auto",        -- 自动匹配当前主题
        component_separators = { left = "|", right = "|" },  -- 组件分隔符
        section_separators = { left = "", right = "" },      -- 区域分隔符（无）
        disabled_filetypes = { "lazy", "neo-tree" },         -- 在这些文件类型中禁用
        always_divide_middle = true,  -- 始终在中间分割
      },
      -- 状态栏区域配置（从左到右）
      sections = {
        lualine_a = { "mode" },                          -- A 区：当前模式
        lualine_b = { "branch", "diff", "diagnostics" }, -- B 区：Git 分支、差异、诊断
        lualine_c = { { "filename", path = 1 } },        -- C 区：文件名（带相对路径）
        lualine_x = { "encoding", "fileformat", "filetype" },  -- X 区：编码、文件格式、文件类型
        lualine_y = { "progress" },                      -- Y 区：进度百分比
        lualine_z = { "location" },                      -- Z 区：光标位置（行:列）
      },
    })
  end,
}
