local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LeapMatch          = { bg = c.green5, fg = c.teal, bold = true },
    LeapLabel          = { fg = c.green3, bold = true },
    LeapBackdrop       = { fg = c.teal},
    LeapLabelPrimary = { fg = c.green3, bold = true },
    LeapLabelSecondary = { fg = c.green1, bold = true },
  }
end

return M
