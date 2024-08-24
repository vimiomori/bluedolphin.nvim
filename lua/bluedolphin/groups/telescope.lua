local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    TelescopeBorder         = { fg = c.border_highlight, bg = c.bg_float },
    TelescopeNormal         = { fg = c.fg, bg = c.bg_float },
    TelescopePreviewNormal = { fg = c.fg, bg = c.bg },
    TelescopePreviewBorder = { fg = c.fg, bg = c.bg },
    TelescopePromptBorder   = { fg = c.yellow3, bg = c.bg_float },
    TelescopePromptTitle    = { fg = c.yellow3, bg = c.bg_float },
    TelescopeResultsComment = { fg = c.comment },
  }
end

return M
