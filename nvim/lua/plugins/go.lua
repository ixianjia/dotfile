-- ============================================================
-- Go 语言专用插件配置
-- ============================================================
-- 提供 Go 开发专用功能：运行测试、构建、格式化、文档查看等
-- ============================================================

return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",       -- GUI 组件依赖
    "neovim/nvim-lspconfig",  -- LSP 支持
  },
  ft = { "go", "gomod", "gosum", "gowork" },  -- 仅在 Go 相关文件时加载
  config = function()
    require("go").setup({
      goimports = "goimports",  -- 使用 goimports 整理导入
      lsp_keymaps = false,      -- 禁用插件自带的 LSP 快捷键（使用 lsp.lua 中的配置）
      lsp_codelens = true,      -- 启用 LSP CodeLens
      diagnostic = {
        href = true,
        error = true,
        warning = true,
        information = true,
        underline = true,
      },
      dap_debug = false,        -- 禁用插件自带调试（使用 debugger.lua 配置）
      textobjects = true,       -- 启用文本对象
      lsp_inlay_hints = {
        enable = true,          -- 启用内联提示
        only_current_line = false,
        only_current_line_autocmd = "CursorHold",
        show_parameter_hints = true,
        parameter_hints_prefix = "<-",
        other_hints_prefix = "=> ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
    })

    -- ============================================================
    -- Go 快捷键映射
    -- ============================================================
    local keymap = vim.keymap.set

    keymap("n", "<leader>gr", "<cmd>GoRun<CR>", { desc = "Go run" })           -- 运行程序
    keymap("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go test" })         -- 运行测试
    keymap("n", "<leader>gT", "<cmd>GoTestFunc<CR>", { desc = "Go test function" })  -- 测试当前函数
    keymap("n", "<leader>gA", "<cmd>GoTestAll<CR>", { desc = "Go test all" })  -- 运行所有测试
    keymap("n", "<leader>gc", "<cmd>GoTestCompile<CR>", { desc = "Go test compile" })  -- 编译测试
    keymap("n", "<leader>gg", "<cmd>GoGenerate<CR>", { desc = "Go generate" })  -- 运行 generate
    keymap("n", "<leader>gi", "<cmd>GoInstall<CR>", { desc = "Go install" })   -- 安装包
    keymap("n", "<leader>gb", "<cmd>GoBuild<CR>", { desc = "Go build" })       -- 构建
    keymap("n", "<leader>gC", "<cmd>GoCoverage<CR>", { desc = "Go coverage" })  -- 测试覆盖率
    keymap("n", "<leader>gf", "<cmd>GoFmt<CR>", { desc = "Go fmt" })           -- 格式化
    keymap("n", "<leader>gd", "<cmd>GoDoc<CR>", { desc = "Go doc" })           -- 查看文档
    keymap("n", "<leader>gtr", "<cmd>GoAddTags<CR>", { desc = "Go add tags" })  -- 添加 Struct Tags
    keymap("n", "<leader>gtR", "<cmd>GoRemoveTags<CR>", { desc = "Go remove tags" })  -- 移除 Tags
    keymap("n", "<leader>gfs", "<cmd>GoFillStruct<CR>", { desc = "Go fill struct" })  -- 填充 Struct
  end,
}
