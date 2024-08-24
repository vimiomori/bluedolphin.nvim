local M = {}

M.url = "https://github.com/vimwiki/vimwiki"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    -- mkdHeading = { fg = c.orange, bold = true },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
    mkdCodeStart = { fg = c.teal, bold = true },
    mkdCodeEnd = { fg = c.teal, bold = true },
    -- mkdLink = { fg = c.blue, underline = true },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCode = { fg = c.teal },
    markdownCodeBlock = { fg = c.teal },
    markdownH1 = { fg = c.pink, bold = true },
    markdownH2 = { fg = c.green, bold = true },
    markdownH3 = { fg = c.yellow2, bold = true },
    markdownH4 = { fg = c.orange, bold = true },
    markdownH5 = { fg = c.magenta, bold = true },
    markdownH6 = { fg = c.blue9, bold = true },
    markdownLinkText = { link = "markdownUrl" },
    markdownUrl = { fg = c.green5, sp = c.cyan, underline = true },

    VimwikiTag = { fg = c.green, bg = c.none },
    VimwikiMarkers = { fg = c.blue, bg = c.none },

    VimwikiHR = { link = "LineNr" },
    VimwikiHeader1 = { link = "markdownH1" },
    VimwikiHeader2 = { link = "markdownH2" },
    VimwikiHeader3 = { link = "markdownH3" },
    VimwikiHeader4 = { link = "markdownH4" },
    VimwikiHeader5 = { link = "markdownH5" },
    VimwikiHeader6 = { link = "markdownH6" },
    VimwikiHeaderChar = { link = "LineNr" },
    VimwikiLink = { link = "markdownUrl" },
    VimwikiList = { fg = c.yellow3 },
    VimwikiNoExistsLink = { fg = c.lavendar },
  }
  for i, color in ipairs(c.rainbow) do
    ret["VimwikiHeader" .. i] = { fg = color, bg = c.none, bold = true }
  end
  return ret
end

return M
