local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LeapMatch          = { bg = c.magenta2, fg = c.fg, bold = true },
    LeapLabel          = { fg = c.magenta2, bold = true },
    LeapBackdrop       = { fg = c.grey },
    LeapLabelPrimary = { fg = c.magenta2, bold = true },
    LeapLabelSecondary = { fg = c.green1, bold = true },
  }
end

return M
