-- ============================================================
-- Treesitter 语法高亮与解析配置
-- ============================================================
-- Treesitter 提供基于语法树的精确高亮、代码折叠、文本对象等功能
-- 相比传统正则高亮，能更准确地理解代码结构
-- ============================================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- 每次更新插件时自动更新语法解析器
  lazy = false,         -- Treesitter 不能懒加载，必须立即加载
  dependencies = {
    -- Treesitter 文本对象扩展（用于选择函数、类等代码块）
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- 初始化 Treesitter，设置解析器安装目录
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- ============================================================
    -- 启用 Treesitter 语法高亮
    -- ============================================================
    -- 为所有文件类型启用 Treesitter 高亮
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- ============================================================
    -- 启用 Treesitter 缩进
    -- ============================================================
    -- 使用语法树进行更准确的缩进
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- ============================================================
    -- Treesitter 折叠
    -- ============================================================
    -- 使用语法树进行代码折叠（比传统折叠更智能）
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldmethod = "expr"
  end,
}
