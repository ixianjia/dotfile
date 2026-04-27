-- Neovim IDE 配置 - 面向 Go 和 Python 开发
-- 使用 lazy.nvim 作为插件管理器

-- ============================================================
-- 1. 引导 lazy.nvim 插件管理器
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", lazyrepo, lazypath })
  if vim.v.shellcode ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- 将 lazy.nvim 添加到运行时路径
vim.opt.rtp:prepend(lazypath)

-- ============================================================
-- 2. Leader 键配置
-- ============================================================
-- Leader 键是自定义快捷键的前缀，这里设置为空格键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================
-- 3. 加载基础设置
-- ============================================================
require("settings.options")  -- 编辑器选项（行号、缩进、搜索等）
require("settings.keymaps")  -- 全局快捷键映射

-- ============================================================
-- 4. 配置 lazy.nvim 插件列表
-- ============================================================
require("lazy").setup({
  spec = {
    -- 按功能模块导入插件配置
    { import = "plugins.colorscheme" },   -- 主题配色
    { import = "plugins.lsp" },           -- 语言服务器协议 (LSP)
    { import = "plugins.completion" },    -- 代码补全
    { import = "plugins.treesitter" },    -- 语法高亮与解析
    { import = "plugins.telescope" },     -- 模糊搜索
    { import = "plugins.lualine" },       -- 状态栏
    { import = "plugins.bufferline" },    -- Buffer 标签页
    { import = "plugins.indent" },        -- 缩进参考线
    { import = "plugins.autopairs" },     -- 自动补全括号
    { import = "plugins.comment" },       -- 代码注释
    { import = "plugins.trouble" },       -- 诊断列表
    { import = "plugins.whichkey" },      -- 快捷键提示
    { import = "plugins.debugger" },      -- 调试器 (DAP)
    { import = "plugins.formatting" },    -- 代码格式化
    { import = "plugins.go" },            -- Go 语言专用插件
    { import = "plugins.python" },        -- Python 专用插件
  },
  -- 自动检查插件更新
  checker = { enabled = true, notify = false },
  -- 禁用配置变更通知
  change_detection = { notify = false },
})
