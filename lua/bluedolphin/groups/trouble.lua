local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    TroubleText   = { fg = c.fg_dark },
    TroubleCount  = { fg = c.magenta, bg = c.dimcomment},
    TroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
  }
end

return M
