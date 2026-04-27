# Neovim 快捷键配置手册

> **Leader 键**: `<Space>` (空格键)
>
> **注意**: 部分快捷键仅在特定文件类型（如 Go 文件）或 LSP 激活时生效。

## 1. 通用导航与窗口管理

| 快捷键 | 功能描述 | 模式 |
| :--- | :--- | :--- |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | 窗口聚焦移动 (左/下/上/右) | Normal |
| `<C-Up>` / `<C-Down>` | 调整窗口高度 (减小/增加) | Normal |
| `<C-Left>` / `<C-Right>` | 调整窗口宽度 (减小/增加) | Normal |
| `<S-h>` / `<S-l>` | 切换上一个/下一个 Buffer | Normal |
| `<C-s>` | 保存文件 | Normal/Insert |
| `<C-q>` | 退出当前窗口 | Normal |
| `<leader>x` | 关闭当前 Buffer | Normal |
| `<leader>tt` | 打开终端 | Normal |
| `<ESC>` | 退出终端模式 | Terminal |
| `<leader>tn` | 切换相对行号 | Normal |
| `<leader>h` | 清除搜索高亮 | Normal |

## 2. 文件搜索 (Telescope)

| 快捷键 | 功能描述 |
| :--- | :--- |
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 全局内容搜索 |
| `<leader>fb` | 切换 Buffer 列表 |
| `<leader>fr` | 最近打开的文件 |
| `<leader>fh` | 帮助文档搜索 |
| `<leader>ft` | Telescope 内置命令列表 |
| `<leader>fc` | 查找光标下的单词 |
| `<leader>gs` | Git 状态 |
| `<leader>gc` | Git 提交记录 |

## 3. LSP 智能提示与代码导航
> 适用于所有配置了 LSP 的语言 (Go, Python, Lua 等)

| 快捷键 | 功能描述 |
| :--- | :--- |
| `gd` | 跳转到定义 |
| `gi` | 跳转到实现 |
| `gr` | 查找引用 |
| `K` | 悬停显示文档 |
| `<leader>rn` | 重命名符号 |
| `<leader>ca` | 代码操作 (快速修复/重构) |
| `<leader>D` | 跳转到类型定义 |
| `<leader>ds` | 文档符号列表 |
| `<leader>wa` | 添加工作区文件夹 |
| `<leader>wr` | 移除工作区文件夹 |
| `<leader>wl` | 列出工作区文件夹 |

## 4. Go 开发
> **仅在 Go 文件中生效**

| 快捷键 | 功能描述 |
| :--- | :--- |
| `<leader>gr` | 运行 Go 程序 |
| `<leader>gt` | 运行测试 |
| `<leader>gT` | 运行当前函数测试 |
| `<leader>gA` | 运行所有测试 |
| `<leader>gc` | 编译测试 |
| `<leader>gg` | 运行 go generate |
| `<leader>gi` | 安装 (go install) |
| `<leader>gb` | 构建 (go build) |
| `<leader>gC` | 查看测试覆盖率 |
| `<leader>gf` | 格式化代码 |
| `<leader>gd` | 查看文档 (Go Doc) |
| `<leader>gtr` | 添加 Struct Tags |
| `<leader>gtR` | 移除 Struct Tags |
| `<leader>gfs` | 填充 Struct |

## 5. Python 开发

| 快捷键 | 功能描述 |
| :--- | :--- |
| `<leader>pv` | 选择 Python 虚拟环境 |
| `<leader>mp` | 格式化代码 (Black + Isort) |

## 6. 调试 (DAP)
> 支持 Go 和 Python 调试

| 快捷键 | 功能描述 |
| :--- | :--- |
| `<leader>db` | 切换断点 |
| `<leader>dB` | 添加条件断点 |
| `<leader>dc` | 继续运行 |
| `<leader>dn` | 单步跳过 |
| `<leader>di` | 单步进入 |
| `<leader>do` | 单步跳出 |
| `<leader>dq` | 终止调试 |
| `<leader>du` | 切换调试 UI 面板 |
| `<leader>dr` | 打开 REPL |
| `<leader>dl` | 运行上次调试配置 |

## 7. 诊断与问题列表 (Trouble)

| 快捷键 | 功能描述 |
| :--- | :--- |
| `<leader>cd` | 显示当前行诊断浮窗 |
| `[d` | 上一个诊断信息 |
| `]d` | 下一个诊断信息 |
| `<leader>q` | 将诊断信息加入 Location List |
| `<leader>xx` | 打开/切换全局诊断列表 |
| `<leader>xX` | 打开/切换当前 Buffer 诊断列表 |
| `<leader>cs` | 符号列表 |
| `<leader>cl` | LSP 引用/定义列表 |
| `<leader>xL` | Location List |
| `<leader>xQ` | Quickfix List |

## 8. Treesitter 文本对象
> 用于快速选择代码块

| 快捷键 | 功能描述 |
| :--- | :--- |
| `<C-space>` | 递增选择 (选中更大范围) |
| `<Backspace>` | 递减选择 (选中更小范围) |
| `af` | 选中整个函数 |
| `if` | 选中函数内部 |
| `ac` | 选中整个类 |
| `ic` | 选中类内部 |
| `]m` | 跳转到下一个函数开始 |
| `[m` | 跳转到上一个函数开始 |
| `]M` | 跳转到下一个函数结束 |
| `[M` | 跳转到上一个函数结束 |
| `]]` | 跳转到下一个类开始 |
| `[[` | 跳转到上一个类开始 |
| `][` | 跳转到下一个类结束 |
| `[]` | 跳转到上一个类结束 |

## 9. 其他常用操作

| 快捷键 | 功能描述 |
| :--- | :--- |
| `v` + `<A-j>` / `<A-k>` | 在可视模式下移动选中行 (下/上) |
| `v` + `<` / `>` | 在可视模式下调整缩进并保持选中 |
| `p` (可视模式) | 粘贴并保留被替换的内容到寄存器 |
