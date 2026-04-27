-- ============================================================
-- Python 虚拟环境选择器配置
-- ============================================================
-- 提供 Python 虚拟环境（venv/conda）的快速切换功能
-- 自动激活环境并配置 LSP 路径
-- ============================================================

return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",  -- 使用 Telescope 显示环境列表
    "mfussenegger/nvim-dap-python",
  },
  branch = "regexp",  -- 使用 regexp 分支
  opts = {
    settings = {
      options = {
        notify_user_on_venv_activation = true,  -- 切换环境时通知用户
      },
    },
  },
  ft = "python",  -- 仅在 Python 文件中加载
  config = function()
    require("venv-selector").setup()

    -- 快捷键：选择 Python 虚拟环境
    local keymap = vim.keymap.set
    keymap("n", "<leader>pv", "<cmd>VenvSelect<CR>", { desc = "Select Python venv" })
  end,
}
