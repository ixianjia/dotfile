--[[
  自动命令配置
  https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

  自动命令是 Neovim 在特定事件发生时自动执行的命令
--]]

-- 高亮当前行（仅在当前窗口）
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "TelescopePrompt" then
      vim.opt_local.cursorline = true
    end
  end,
  desc = "在当前窗口启用光标行高亮",
})

-- 退出插入模式时自动启用相对行号
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.relativenumber = false
  end,
  desc = "插入模式时禁用相对行号",
})

-- 退出插入模式时恢复相对行号
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.relativenumber = true
  end,
  desc = "退出插入模式时启用相对行号",
})

-- 保存时自动删除尾随空格
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  callback = function()
    local patterns = { "*.lua", "*.py", "*.js", "*.ts", "*.json", "*.yaml", "*.yml" }
    for _, pattern in ipairs(patterns) do
      if vim.fn.match(vim.bo.filetype, pattern:gsub("%", "%%")) ~= -1 then
        local curpos = vim.fn.getcurpos()
        vim.cmd [[silent! %s/\s\+$//e]]
        vim.fn.setcurpos(curpos)
        break
      end
    end
  end,
  desc = "保存时删除尾随空格",
})

-- 保存时自动更新 treesitter
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*",
  callback = function()
    require("nvim-treesitter.lang").status_printer()
  end,
  desc = "保存时更新 treesitter",
})

-- 打开 Telescope 时禁用光标行高亮
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "Telescope*",
  callback = function()
    vim.opt_local.cursorline = false
  end,
  desc = "Telescope 窗口禁用光标行高亮",
})

-- Python 文件设置 PEP 8 缩进
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
  desc = "Python 文件设置 4 空格缩进",
})

-- 终端窗口设置按键映射退出
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = true, desc = "退出终端插入模式" })
    vim.keymap.set("t", "<C-v><Esc>", "<Esc>", { buffer = true, desc = "退出终端插入模式" })
  end,
  desc = "终端配置",
})

-- 关闭 QuickFix 窗口时自动隐藏
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, desc = "关闭 QuickFix 窗口" })
  end,
  desc = "QuickFix 窗口 q 键关闭",
})

-- Gitcommit 文件类型设置
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "gitcommit,gitrebase",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  desc = "Git 提交文件启用拼写检查和自动换行",
})

-- Markdown 文件设置
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  desc = "Markdown 文件启用拼写检查和自动换行",
})

-- 保存文件时自动设置光标位置
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark("'", {})
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "重新打开文件时跳转到上次光标位置",
})