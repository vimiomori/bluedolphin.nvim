local Util = require("bluedolphin.util")

local M = {}

M.url = "https://github.com/mfussenegger/nvim-treehopper"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    TSNodeKey = { fg = c.magenta2, bold = true },
    TSNodeUnmatched = { fg = c.grey },
  }
end

return M
