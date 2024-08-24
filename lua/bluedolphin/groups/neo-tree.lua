local Util = require("bluedolphin.util")

local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  local dark = opts.styles.sidebars == "transparent" and c.none or c.bg_dark
    -- or Util.blend(c.bg_sidebar, 0.8, opts.style == "bluer" and c.blue or "#000000")
  -- stylua: ignore
  return {
    NeoTreeDimText             = { fg = c.fg_gutter },
    NeoTreeFileName            = { fg = c.fg_sidebar },
    NeoTreeGitModified         = { fg = c.orange },
    NeoTreeGitStaged           = { fg = c.green1 },
    NeoTreeGitUntracked        = { fg = c.fg},
    NeoTreeNormal              = { fg = c.fg_sidebar, bg = dark },
    NeoTreeNormalNC            = { fg = c.fg_sidebar, bg = dark },
    NeoTreeTabActive           = { fg = c.blue, bg = c.bg_dark, bold = true },
    NeoTreeTabInactive         = { fg = c.comment, bg = dark },
    NeoTreeTabSeparatorActive  = { fg = c.blue, bg = c.bg_dark },
    NeoTreeTabSeparatorInactive= { fg = c.bg, bg = dark },
    NeoTreeWinSeparator = { fg = c.cyan, bg = dark },
    NeoTreeTitleBar = { fg = c.bg, bg = c.fg},
    NeoTreeDotfile = { fg = c.comment },
    NeoTreeFadeText1 = { fg = c.comment },
    NeoTreeFadeText2 = { fg = c.comment },
    NeoTreeHiddenByName = { fg = c.comment },
  }
end

return M
