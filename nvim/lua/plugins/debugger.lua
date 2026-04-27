-- ============================================================
-- DAP (Debug Adapter Protocol) 调试器配置
-- ============================================================
-- 提供图形化调试功能，支持断点、单步、变量查看等
-- 支持 Go (dap-go) 和 Python (dap-python) 调试
-- ============================================================

return {
  "mfussenegger/nvim-dap",  -- 核心调试器插件
  dependencies = {
    "rcarriga/nvim-dap-ui",     -- DAP 图形界面
    "nvim-neotest/nvim-nio",    -- DAP UI 依赖
    "leoluz/nvim-dap-go",       -- Go 调试适配器
    "mfussenegger/nvim-dap-python",  -- Python 调试适配器
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- ============================================================
    -- Go 调试器配置
    -- ============================================================
    require("dap-go").setup()

    -- ============================================================
    -- Python 调试器配置
    -- ============================================================
    require("dap-python").setup("python3")

    -- ============================================================
    -- DAP UI 界面配置
    -- ============================================================
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸" },  -- 展开/折叠图标
      mappings = {
        -- UI 内部快捷键
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      expand_lines = true,  -- 展开当前行
      layouts = {
        -- 左侧面板：变量、断点、调用栈、监视
        {
          elements = {
            { id = "scopes", size = 0.25 },       -- 作用域变量
            { id = "breakpoints", size = 0.25 },  -- 断点列表
            { id = "stacks", size = 0.25 },       -- 调用栈
            { id = "watches", size = 0.25 },      -- 监视表达式
          },
          size = 40,
          position = "left",
        },
        -- 底部面板：REPL 和控制台
        {
          elements = {
            { id = "repl", size = 0.5 },     -- REPL 交互
            { id = "console", size = 0.5 },  -- 调试控制台
          },
          size = 10,
          position = "bottom",
        },
      },
      controls = {
        enabled = true,      -- 显示调试控制按钮
        element = "repl",
      },
      floating = {
        max_height = 0.9,    -- 浮窗最大高度
        max_width = 0.5,     -- 浮窗最大宽度
        border = "rounded",  -- 圆角边框
      },
    })

    -- ============================================================
    -- DAP 事件监听：调试启动/结束时自动打开/关闭 UI
    -- ============================================================
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()  -- 调试初始化时打开 UI
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()  -- 调试终止时关闭 UI
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()  -- 调试退出时关闭 UI
    end

    -- ============================================================
    -- 调试快捷键映射
    -- ============================================================
    local keymap = vim.keymap.set
    keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })  -- 切换断点
    keymap("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Conditional breakpoint" })  -- 条件断点
    keymap("n", "<leader>dc", dap.continue, { desc = "Continue debugging" })  -- 继续运行
    keymap("n", "<leader>dn", dap.step_over, { desc = "Step over" })  -- 单步跳过
    keymap("n", "<leader>di", dap.step_into, { desc = "Step into" })  -- 单步进入
    keymap("n", "<leader>do", dap.step_out, { desc = "Step out" })  -- 单步跳出
    keymap("n", "<leader>dq", dap.terminate, { desc = "Terminate debugging" })  -- 终止调试
    keymap("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })  -- 切换 DAP UI
    keymap("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })  -- 打开 REPL
    keymap("n", "<leader>dl", dap.run_last, { desc = "Run last" })  -- 运行上次配置
  end,
}
