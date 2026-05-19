--[[
  Neovim 编辑器选项配置
  https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--]]

-- 启用鼠标支持
vim.opt.mouse = "a"

-- 启用系统剪贴板
vim.opt.clipboard = "unnamedplus"

-- 启用增量搜索高亮
vim.opt.incsearch = true

-- 搜索时忽略大小写（智能大小写）
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 显示行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 缩进配置
vim.opt.expandtab = true        -- 使用空格代替制表符
vim.opt.shiftwidth = 2       -- 缩进宽度
vim.opt.tabstop = 2           -- 制表符宽度
vim.opt.softtabstop = 2
vim.opt.autoindent = true   -- 自动缩进

-- 搜索结果高亮
vim.opt.hlsearch = true

-- 启用折行
vim.opt.wrap = false

-- 启用虚拟光标（闪烁块）
vim.opt.guicursor = "a:blinkwait700-blinkon400-blinkoff400"

-- 启用命令行补全
vim.opt.wildmode = { "longest:full", "full" }

-- 启用轮询时间同步
vim.opt.updatetime = 200

-- 设置超时时间
vim.opt.timeout = true
vim.opt.timeoutlen = 500

-- 分割窗口方向
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 启用 QuickFix 窗口自动关闭
vim.opt.autoread = true

-- 启用自动写入
vim.opt.autowrite = false

-- 启用回绕行（显示长行）
vim.opt.linebreak = true

-- 光标行高亮
vim.opt.cursorline = true

-- 诊断信息显示
vim.opt.signcolumn = "auto"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- 启用文件类型检测
vim.cmd("filetype on")

-- 启用语法高亮
vim.opt.syntax = "enable"

-- 设置语言
vim.opt.langmenu = "zh_CN.UTF-8"