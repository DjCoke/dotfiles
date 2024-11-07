return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "nixpkgs-fmt",
        "rnix-lsp",
        "shellcheck",
        "luacheck",
        "yaml-language-server",
        "json-lsp",
        "bash-language-server",
        "markdownlint",
        "vim-language-server",
        "kube-linter",
        "kubeval",
        "yamllint",
        "dockerfile-language-server",
        "hadolint",
        "helm-lint",
      },
    })
  end,
}
