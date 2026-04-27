-- ============================================================
-- Conform 代码格式化配置
-- ============================================================
-- 提供统一的代码格式化功能
-- 支持保存时自动格式化，也支持手动触发
-- ============================================================

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },  -- 写入文件前加载
  cmd = { "ConformInfo" },    -- 注册命令
  config = function()
    local conform = require("conform")

    conform.setup({
      -- 各语言对应的格式化工具
      formatters_by_ft = {
        go = { "goimports", "gofmt" },        -- Go：goimports + gofmt
        python = { "isort", "black" },        -- Python：isort + black
        lua = { "stylua" },                   -- Lua：stylua
        javascript = { "prettier" },          -- JavaScript：prettier
        typescript = { "prettier" },          -- TypeScript：prettier
        json = { "prettier" },                -- JSON：prettier
        yaml = { "prettier" },                -- YAML：prettier
        markdown = { "prettier" },            -- Markdown：prettier
        html = { "prettier" },                -- HTML：prettier
        css = { "prettier" },                 -- CSS：prettier
      },
      -- 保存时自动格式化
      format_on_save = {
        timeout_ms = 1000,    -- 超时时间（毫秒）
        lsp_fallback = true,  -- 如果格式化工具不可用，回退到 LSP
      },
    })

    -- 手动格式化快捷键：<leader>mp
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({ lsp_fallback = true })
    end, { desc = "Format file or range" })
  end,
}
