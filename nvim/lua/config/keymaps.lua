--[[
  键盘快捷键配置
  https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

  前缀说明：
  - <Space> -  leader 前缀键
  - <C>     -  Ctrl 键
  - <A>     -  Alt 键
  - <S>     -  Shift 键
  - <Leader> 默认是空格键
--]]

-- 禁用箭头键，强制使用 hjkl
vim.keymap.set("n", "<up>", "<nop>", { noremap = true })
vim.keymap.set("n", "<down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<right>", "<nop>", { noremap = true })

-- 保存文件
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>write<CR>", { desc = "保存文件" })

-- 退出（不保存）
vim.keymap.set("n", "<C-q>", "<cmd>q!<CR>", { desc = "强制退出" })

-- 窗口导航
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "切换到左侧窗口" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "切换到下方窗口" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "切换到上方窗口" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "切换到右侧窗口" })

-- 窗口大小调整
vim.keymap.set("n", "<C-up>", ":resize +2<CR>", { desc = "增加窗口高度" })
vim.keymap.set("n", "<C-down>", ":resize -2<CR>", { desc = "减少窗口高度" })
vim.keymap.set("n", "<C-left>", ":vertical resize -2<CR>", { desc = "减少窗口宽度" })
vim.keymap.set("n", "<C-right>", ":vertical resize +2<CR>", { desc = "增加窗口宽度" })

-- 标签页操作
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "新建标签页" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "关闭其他标签页" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "关闭当前标签页" })
vim.keymap.set("n", "<leader>tm", "<cmd>tabmove<CR>", { desc = "移动标签页" })
vim.keymap.set("n", "<leader>tj", "<cmd>tabnext<CR>", { desc = "下一个标签页" })
vim.keymap.set("n", "<leader>tk", "<cmd>tabprevious<CR>", { desc = "上一个标签页" })

-- 文本对象操作
-- 复制选中内容
vim.keymap.set("v", "<C-c>", '"+y', { desc = "复制选中内容到系统剪贴板" })
-- 粘贴
vim.keymap.set("n", "<C-v>", '"+p', { desc = "从系统剪贴板粘贴" })
vim.keymap.set("i", "<C-v>", '<C-r>"', { desc = "从系统剪贴板粘贴" })

-- 移动选中文本
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "向下移动选中行" })
vim.keymap.set("v", "K", ":m '-2<CR>gv=gv", { desc = "向上移动选中行" })

-- 居中搜索
vim.keymap.set("n", "n", "nzzzv", { desc = "搜索下一个（居中）" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "搜索上一个（居中）" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "合并行（保持光标位置）" })

-- 删除内容并进入插入模式
vim.keymap.set("n", "cc", "ccO", { desc = "清空当前行并开始编辑" })

-- 交换光标位置
vim.keymap.set("n", "<leader>ss", "gW", { desc = "交换光标位置的单词" })

-- 格式化和组织import
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "格式化代码" })

-- LSP 跳转到定义
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳转到定义" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "跳转到声明" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "跳转到实现" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "查找引用" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "跳转到类型定义" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "显示悬停信息" })

-- 重命名
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "重命名" })

-- 折叠
vim.keymap.set("n", "zR", "zMzz", { desc = "展开所有折叠" })
vim.keymap.set("n", "zM", "zRzz", { desc = "折叠所有" })

-- bufferline 导航
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "跳转到 buffer 1" })
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "跳转到 buffer 2" })
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "跳转到 buffer 3" })
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "跳转到 buffer 4" })
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "跳转到 buffer 5" })
vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "跳转到 buffer 6" })
vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "跳转到 buffer 7" })
vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "跳转到 buffer 8" })
vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "跳转到 buffer 9" })

-- 关闭 buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bp<bar>bd#<CR>", { desc = "关闭当前 buffer" })