-- ============================================================
-- Telescope 模糊搜索配置
-- ============================================================
-- 提供文件搜索、内容搜索、Buffer 切换、Git 集成等功能
-- 使用 fzf 模糊匹配算法提升搜索体验
-- ============================================================

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    -- plenary.nvim 是 Telescope 的依赖库
    "nvim-lua/plenary.nvim",
    -- fzf 模糊匹配扩展（需系统安装 make 命令）
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      -- 默认配置
      defaults = {
        path_display = { "smart" },  -- 智能显示文件路径（缩短父目录）
        mappings = {
          -- 插入模式快捷键
          i = {
            ["<C-k>"] = actions.move_selection_previous,  -- 上一项
            ["<C-j>"] = actions.move_selection_next,      -- 下一项
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,  -- 发送到 Quickfix
            ["<ESC>"] = actions.close,                    -- 关闭
          },
        },
        previewer = true,      -- 启用预览
        file_previewer = true, -- 启用文件预览
      },
      -- 搜索器特定配置
      pickers = {
        find_files = { hidden = true },  -- 搜索文件时包含隐藏文件
        live_grep = {
          additional_args = function(_)
            return { "--hidden", "--glob", "!.git/" }  -- 搜索内容时包含隐藏文件，排除 .git
          end,
        },
      },
      -- fzf 扩展配置
      extensions = {
        fzf = {
          fuzzy = true,                    -- 启用模糊匹配
          override_generic_sorter = true,  -- 使用 fzf 排序器
          override_file_sorter = true,
          case_mode = "smart_case",        -- 智能大小写匹配
        },
      },
    })

    -- 加载 fzf 扩展
    telescope.load_extension("fzf")

    -- ============================================================
    -- Telescope 快捷键映射
    -- ============================================================
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap.set

    keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })      -- 查找文件
    keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })        -- 全局搜索
    keymap("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })            -- 切换 Buffer
    keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })        -- 帮助标签
    keymap("n", "<leader>ft", builtin.builtin, { desc = "Telescope builtin" })  -- Telescope 内置命令
    keymap("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })  -- 文档符号
    keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })      -- 最近文件
    keymap("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })    -- Git 提交
    keymap("n", "<leader>gs", builtin.git_status, { desc = "Git status" })      -- Git 状态
    keymap("n", "<leader>fc", builtin.grep_string, { desc = "Find word under cursor" })  -- 查找光标下单词
  end,
}
