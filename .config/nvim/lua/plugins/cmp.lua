return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Disable ghost text completely
      opts.experimental = opts.experimental or {}
      opts.experimental.ghost_text = false
    end,
  },
}
