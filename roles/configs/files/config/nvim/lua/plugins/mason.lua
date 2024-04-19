return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      -- Go
      "gofumpt",
      "goimports",
      "gopls",
      "delve",
      "golangci-lint",
      "gotests",
      "gomodifytags",
      "golines",
      -- Lua
      "lua-language-server",
      -- Ansible
      "ansible-lint",
    })
  end,
}
