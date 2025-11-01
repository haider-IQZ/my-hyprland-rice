return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              -- DISABLE ALL INLAY HINTS
              inlayHints = {
                bindingModeHints = { enable = false },
                chainingHints = { enable = false },
                closingBraceHints = { enable = false },
                closureReturnTypeHints = { enable = false },
                lifetimeElisionHints = { enable = false },
                parameterHints = { enable = false },
                reborrowHints = { enable = false },
                renderColons = false,
                typeHints = { enable = false },
              },
            },
          },
        },
      },
    },
  },
}
