# Dotfiles

我的个人 Linux 桌面环境配置文件，基于 Hyprland 窗口管理器的 Arch Linux 桌面环境。

## 组件列表

### 🖥️ 窗口管理器
- **Hyprland** - 高性能 Wayland 合成器
  - 官方文档: [https://wiki.hyprland.org/](https://wiki.hyprland.org/)
  - `hypr/hyprland.conf` - 主配置文件
  - `hypr/hyprlock.conf` - 锁屏配置
  - `hypr/hypridle.conf` - 空闲配置
  - `hypr/monitors.conf` - 显示器配置
  - `hypr/themes/` - 主题配置

### 📱 终端
- **Kitty** - 快速、功能丰富的终端模拟器
  - 官方文档: [https://sw.kovidgoyal.net/kitty/](https://sw.kovidgoyal.net/kitty/)
  - `kitty/kitty.conf` - 主配置文件
  - `kitty/no-preference-theme.auto.conf` - 主题配置

### 📊 状态栏
- **Waybar** - Wayland 状态栏
  - 官方文档: [https://github.com/Alexays/Waybar](https://github.com/Alexays/Waybar)
  - `waybar/config.jsonc` - 主配置文件
  - `waybar/leftbar/` - 左侧栏配置
  - `waybar/style.css` - 样式文件

### 🔔 通知
- **Mako** - 轻量级 Wayland 通知管理器
  - 官方文档: [https://github.com/emersion/mako](https://github.com/emersion/mako)
  - `mako/config` - 通知配置

### 📝 编辑器
- **Neovim** - Vim 现代分支
  - 官方文档: [https://neovim.io/](https://neovim.io/)
  - 插件管理: [LazyVim](https://github.com/LazyVim/LazyVim)
  - `nvim/init.lua` - 主配置文件
  - `nvim/lua/` - Lua 配置目录
  - `nvim/lua/plugins/` - 插件配置
  - `nvim/lua/settings/` - 设置配置

## 引用和依赖

### 核心依赖
- **Hyprland** - Wayland 合成器
- **Kitty** - 终端模拟器
- **Waybar** - 状态栏
- **Mako** - 通知管理器
- **Neovim** - 文本编辑器

### 字体依赖
- **JetBrains Mono** - 等宽字体
- **DejaVu** - 等宽字体
- **Noto Fonts** - Unicode 字体

### 语言服务器
- **Lua Language Server** - Lua 语言支持
- **Python Language Server** - Python 语言支持

### 🖥️ 窗口管理器
- **Hyprland** - 高性能 Wayland 合成器
  - `hypr/hyprland.conf` - 主配置文件
  - `hypr/hyprlock.conf` - 锁屏配置
  - `hypr/hypridle.conf` - 空闲配置
  - `hypr/monitors.conf` - 显示器配置
  - `hypr/themes/` - 主题配置

### 📱 终端
- **Kitty** - 快速、功能丰富的终端模拟器
  - `kitty/kitty.conf` - 主配置文件
  - `kitty/no-preference-theme.auto.conf` - 主题配置

### 📊 状态栏
- **Waybar** - Wayland 状态栏
  - `waybar/config.jsonc` - 主配置文件
  - `waybar/leftbar/` - 左侧栏配置
  - `waybar/style.css` - 样式文件

### 🔔 通知
- **Mako** - 轻量级 Wayland 通知管理器
  - `mako/config` - 通知配置

### 📝 编辑器
- **Neovim** - Vim 现代分支
  - `nvim/init.lua` - 主配置文件
  - `nvim/lua/` - Lua 配置目录
  - `nvim/lua/plugins/` - 插件配置
  - `nvim/lua/settings/` - 设置配置

## 系统要求

- **操作系统**: Arch Linux
- **桌面环境**: Hyprland (Wayland)
- **Shell**: Bash
- **包管理器**: Pacman/Yay

### 推荐的额外工具
- **Yay** - AUR 包管理器
- **Paru** - 另一个 AUR 包管理器
- **Dunst** - 备用通知管理器
- **Rofi** - 应用启动器

## 安装说明

### 1. 克隆仓库
```bash
git clone https://github.com/ixianjia/dotfile.git ~/.config
```

### 2. 安装依赖
```bash
# Hyprland 相关
sudo pacman -S hyprland hyprlock hypridle hyprpaper

# 终端
sudo pacman -S kitty

# 状态栏和通知
sudo pacman -S waybar mako

# 编辑器
sudo pacman -S neovim python-lua-language-server

# 字体
sudo pacman -S ttf-jetbrains-mono ttf-dejavu noto-fonts
```

### 3. 安装 Neovim 插件
```bash
cd ~/.config/nvim
nvim --headless "+Lazy sync" +qa
```

### 4. 设置权限
```bash
chmod +x ~/.config/hypr/*.sh
chmod +x ~/.config/waybar/scripts/*
```

## 使用说明

### 启动 Hyprland
```bash
# 进入 Hyprland 会话
Hyprland
```

### 快捷键参考
- **Win + D**: 切换窗口焦点
- **Win + Shift + D**: 显示/隐藏桌面
- **Win + Q**: 关闭窗口
- **Win + Shift + Q**: 强制关闭窗口
- **Win + Space**: 切换输入法
- **Win + Enter**: 打开终端
- **Win + Shift + Enter**: 打开浮动终端

### Neovim 快捷键
- `Space + w`: 保存文件
- `Space + q`: 退出
- `Space + f`: 查找文件
- `Space + g`: 搜索文本

## 自定义配置

### 主题配置
- 所有主题文件位于 `hypr/themes/` 目录
- Waybar 颜色与 Hyprland 主题同步

### 窗口管理
- 显示器配置在 `hypr/monitors.conf`
- 窗口规则在 `hypr/hyprland.conf` 中定义

### 状态栏
- 左侧栏显示工作区和系统信息
- 右侧栏显示时间和系统状态

## 更新和维护

## 效果图


## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！

## 联系方式

- GitHub: [ixianjia](https://github.com/ixianjia)
- 邮箱: ixianjia@gmail.com
