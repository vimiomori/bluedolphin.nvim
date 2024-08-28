local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.cyan },
    WhichKeyGroup     = { fg = c.blue },
    WhichKeyDesc      = { fg = c.pink },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyNormal     = { bg = c.bg_sidebar },
    WhichKeyValue     = { fg = c.dark5 },
  }
end

return M