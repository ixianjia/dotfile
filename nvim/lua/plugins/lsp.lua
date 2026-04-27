-- ============================================================
-- LSP (Language Server Protocol) 配置
-- ============================================================
-- 本文件配置语言服务器协议，提供代码补全、跳转定义、重命名等功能
-- 支持的语言：Go (gopls)、Python (pyright)、Lua (lua_ls)
-- 使用 Neovim 0.12 内置的 vim.lsp.config API（替代旧版 lspconfig）
-- ============================================================

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Mason 用于自动安装 LSP 服务器
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 初始化 Mason 包管理器
    require("mason").setup()
    -- 配置 Mason 自动安装指定的 LSP 服务器
    require("mason-lspconfig").setup({
      ensure_installed = { "gopls", "pyright", "lua_ls" },  -- 确保安装这些服务器
      automatic_installation = true,  -- 自动安装未安装的服务器
    })

    -- 获取代码补全所需的 LSP 能力
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- ============================================================
    -- LSP 附加事件：为每个 LSP 缓冲区设置快捷键
    -- ============================================================
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        -- 辅助函数：为当前缓冲区创建快捷键映射
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc, noremap = true, silent = true })
        end
        map("gd", vim.lsp.buf.definition, "Go to definition")           -- 跳转到定义
        map("gi", vim.lsp.buf.implementation, "Go to implementation")  -- 跳转到实现
        map("gr", vim.lsp.buf.references, "Go to references")          -- 查找引用
        map("K", vim.lsp.buf.hover, "Hover documentation")             -- 悬停文档
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")         -- 重命名符号
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")      -- 代码操作
        map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
        map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
        map("<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "List workspace folders")
        map("<leader>D", vim.lsp.buf.type_definition, "Type definition")  -- 类型定义
        map("<leader>ds", function()
          require("telescope.builtin").lsp_document_symbols()
        end, "Document symbols")
      end,
    })

    -- ============================================================
    -- 自定义 LSP 浮窗边框（圆角效果）
    -- ============================================================
    -- 包装 hover 和 signature_help 的 handler，添加圆角边框
    local hover = vim.lsp.handlers["textDocument/hover"]
    local signature_help = vim.lsp.handlers["textDocument/signatureHelp"]
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
      return hover(err, result, ctx, vim.tbl_extend("force", config or {}, { border = "rounded" }))
    end
    vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
      return signature_help(err, result, ctx, vim.tbl_extend("force", config or {}, { border = "rounded" }))
    end

    -- ============================================================
    -- Go 语言服务器 (gopls) 配置
    -- ============================================================
    vim.lsp.config("gopls", {
      capabilities = capabilities,
      settings = {
        gopls = {
          gofumpt = true,  -- 使用 gofumpt 严格格式化
          codelenses = {   -- 代码镜头（显示在代码上方的操作）
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {        -- 内联类型提示
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {     -- 静态分析检查
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
          semanticTokens = true,
        },
      },
    })

    -- ============================================================
    -- Python 语言服务器 (pyright) 配置
    -- ============================================================
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      settings = {
        pyright = {
          disableOrganizeImports = true,  -- 禁用导入整理（交由 formatting 插件处理）
        },
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",  -- 工作区级别的诊断
            useLibraryCodeForTypes = true,
            typeCheckingMode = "basic",    -- 基础类型检查
          },
        },
      },
    })

    -- ============================================================
    -- Lua 语言服务器 (lua_ls) 配置 - 用于编辑 Neovim 配置
    -- ============================================================
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = { callSnippet = "Replace" },  -- 补全时显示函数参数
          diagnostics = { globals = { "vim" } },     -- 允许 vim 全局变量
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },            -- 禁用遥测
        },
      },
    })

    -- 启用所有配置好的 LSP 服务器
    vim.lsp.enable({ "gopls", "pyright", "lua_ls" })
  end,
}
