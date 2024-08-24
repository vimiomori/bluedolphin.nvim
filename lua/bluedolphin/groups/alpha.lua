local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AlphaShortcut    = { fg = c.yellow3 },
    AlphaHeader      = { fg = c.blue },
    AlphaHeaderLabel = { fg = c.yellow3 },
    AlphaFooter      = { fg = c.blue1 },
    AlphaButtons     = { fg = c.cyan },
  }
end

return M
