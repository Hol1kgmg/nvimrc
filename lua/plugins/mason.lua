return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "ts_ls",           -- TypeScript/JavaScript
        "pyright",         -- Python
        "yamlls",          -- YAML
        "taplo",           -- TOML
        "jsonls",          -- JSON
        "vimls",           -- Vim
        "lua_ls",          -- Lua
        "marksman",        -- Markdown
        "tailwindcss",     -- Tailwind CSS
        "cssls",           -- CSS/SCSS/LESS
        "html",            -- HTML
        "eslint",          -- ESLint
        -- nixd はnixpkgsで管理
      },
    },
  },
}
