return {
  -- Custom colorscheme that uses matugen colors
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- Load matugen colors
        local colors = require("colors.matugen")
        
        -- Set up highlights
        vim.cmd("highlight clear")
        vim.cmd("syntax reset")
        vim.g.colors_name = "matugen"
        
        -- Basic highlights
        vim.api.nvim_set_hl(0, "Normal", { fg = colors.foreground, bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.foreground, bg = "NONE" })
        vim.api.nvim_set_hl(0, "Comment", { fg = colors.color8, italic = true })
        vim.api.nvim_set_hl(0, "Constant", { fg = colors.color3 })
        vim.api.nvim_set_hl(0, "String", { fg = colors.color2 })
        vim.api.nvim_set_hl(0, "Character", { fg = colors.color2 })
        vim.api.nvim_set_hl(0, "Number", { fg = colors.color3 })
        vim.api.nvim_set_hl(0, "Boolean", { fg = colors.color3 })
        vim.api.nvim_set_hl(0, "Float", { fg = colors.color3 })
        vim.api.nvim_set_hl(0, "Identifier", { fg = colors.color4 })
        vim.api.nvim_set_hl(0, "Function", { fg = colors.color4, bold = true })
        vim.api.nvim_set_hl(0, "Statement", { fg = colors.color5, bold = true })
        vim.api.nvim_set_hl(0, "Keyword", { fg = colors.color5, bold = true })
        vim.api.nvim_set_hl(0, "PreProc", { fg = colors.color6 })
        vim.api.nvim_set_hl(0, "Type", { fg = colors.color6 })
        vim.api.nvim_set_hl(0, "Special", { fg = colors.color14 })
        vim.api.nvim_set_hl(0, "Error", { fg = colors.color1 })
        vim.api.nvim_set_hl(0, "Todo", { fg = colors.color11, bold = true })
        vim.api.nvim_set_hl(0, "LineNr", { fg = colors.color8 })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.color10, bold = true })
        vim.api.nvim_set_hl(0, "Visual", { bg = colors.color0 })
        vim.api.nvim_set_hl(0, "Search", { fg = colors.background, bg = colors.color10 })
        vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.background, bg = colors.color11 })
        
        -- Diagnostic highlights
        vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.color1 })
        vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.color11 })
        vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.color4 })
        vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.color6 })
      end,
    },
  },
}
