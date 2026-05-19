# Neovim 配置

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 模板的 Neovim 配置。

## 功能特性

- **插件管理**: lazy.nvim (自动加载插件)
- **主题**: TokyoNight
- **UI**: bufferline, lualine, which-key, neo-tree
- **LSP**: Mason (自动安装语言服务器)
- **补全**: nvim-cmp + blink.cmp
- **Treesitter**: 语法高亮
- **Telescope**: 文件/代码搜索
- **DAP**: 调试支持
- **Conform**: 代码格式化

## 安装

```bash
# 1. 克隆配置（如果还没有）
git clone https://github.com/LazyVim/starter ~/.config/nvim

# 2. 启动 nvim 并安装插件
nvim

# 3. 等待插件安装完成
```

## 快捷键

### 基本操作

| 快捷键 | 功能 |
|--------|------|
| `<C-s>` | 保存文件 |
| `<C-q>` | 强制退出 |
| `<leader>bd` | 关闭当前 buffer |

### 窗口

| 快捷键 | 功能 |
|--------|------|
| `<C-h/j/k/l>` | 切换窗口 |
| `<C-方向键>` | 调整窗口大小 |

### 标签页

| 快捷键 | 功能 |
|--------|------|
| `<leader>tn` | 新建标签页 |
| `<leader>tc` | 关闭标签页 |
| `<leader>tj/k` | 切换标签页 |

### Buffer 导航

| 快捷键 | 功能 |
|--------|------|
| `<leader>1-9` | 跳转到对应 buffer |

### 文件搜索 (Telescope)

| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 搜索内容 |
| `<leader>fb` | 打开缓冲区 |
| `<leader>fh` | 帮助文档 |

### LSP

| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gD` | 跳转到声明 |
| `gi` | 跳转到实现 |
| `gr` | 查找引用 |
| `K` | 显示悬停信息 |
| `<leader>rn` | 重命名 |
| `<leader>f` | 格式化代码 |

### 文件浏览器

| 快捷键 | 功能 |
|--------|------|
| `<leader>e` | 打开 NeoTree |

### 文本操作

| 快捷键 | 功能 |
|--------|------|
| `gcc` | 注释/取消注释行 |
| `gc` | 注释选中区域 |
| `J/K` | 上下移动选中行 |

## LSP 服务器

自动安装的 LSP 服务器：

- `pyright` - Python
- `ts_ls` - TypeScript/JavaScript
- `lua_ls` - Lua
- `gopls` - Go
- `jsonls` - JSON
- `markdown-lg` - Markdown
- `bashls` - Bash
- `html` - HTML
- `cssls` - CSS
- `volar` - Vue
- `rust_analyzer` - Rust

## 工具

自动安装的工具：

- **格式化器**: stylua, shfmt, prettier, black, isort
- **Linter**: shellcheck, flake8, eslint

## 自定义配置

编辑 `~/.config/nvim/lua/plugins/example.lua` 添加自定义插件。

## 更新插件

```bash
nvim +Lazy sync
```

## 问题排查

如果遇到问题，可以尝试：

```bash
# 1. 检查插件状态
nvim +Lazy

# 2. 重新安装插件
nvim +Lazy rebuild

# 3. 清理缓存
rm -rf ~/.local/share/nvim/lazy/* ~/.cache/nvim/*
```

## 更多信息

- [LazyVim 文档](https://lazyvim.github.io/)
- [Neovim 文档](https://neovim.io/doc/)
- [Mason](https://github.com/williamboman/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)