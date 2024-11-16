local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    BufferLineIndicatorSelected = { fg = c.green5, bold = true },
    BufferLineFill = { bg = c.bg_dim, fg = c.bg_dim},
    BufferLineBackground = { bg = c.bg_bufferline, fg = c.comment },
    BufferLineBufferVisible = { bg = c.bg_bufferline, fg = c.comment },
    BufferLineBufferSelected = { bg = c.bg, fg = c.green5, bold = true },
    BufferLineBuffer = { bg = c.bg_bufferline, fg = c.comment, italic = true },
    -- BufferLineOffsetSeparator = { bg = c.bg_dark, fg = c.bg_dark },
    BufferLineOffsetSeparator = { bg = opts.styles.bufferline == "transparent" and c.none or c.bg_dim, fg = opts.styles.bufferline == "transparent" and c.none or c.bg_dim},
    BufferLineSeparator = { bg = c.bg_bufferline, fg = c.bg_dim},
    BufferLineSeparatorVisible = { bg = c.bg_bufferline, fg = c.bg_dim},
    BufferLineSeparatorSelected = { bg = c.bg, fg = c.bg_dim},
    BufferLineDuplicate = { bg = c.bg_bufferline, fg = c.cyan },
    BufferLineDuplicateSelected = { bg = c.bg, fg = c.cyan },
    BufferLineMiniIconsAzure = { bg = c.bg_bufferline, fg = c.cyan },
    BufferLineMiniIconsAzureSelected = { bg = c.bg, fg = c.cyan },
    BufferLineMiniIconsBlue = { bg = c.bg_bufferline, fg = c.blue },
    BufferLineMiniIconsBlueSelected = { bg = c.bg, fg = c.blue },
    BufferLineMiniIconsGreen = { bg = c.bg_bufferline, fg = c.green5},
    BufferLineMiniIconsGreenSelected = { bg = c.bg, fg = c.green5 },
    BufferLineMiniIconsCyan = { bg = c.bg_bufferline, fg = c.cyan},
    BufferLineMiniIconsCyanSelected = { bg = c.bg, fg = c.cyan },
    BufferLineMiniIconsGrey = { bg = c.bg_bufferline, fg = c.fg},
    BufferLineMiniIconsGreySelected = { bg = c.bg, fg = c.fg},
    BufferLineMiniIconsOrange = { bg = c.bg_bufferline, fg = c.orange},
    BufferLineMiniIconsOrangeSelected = { bg = c.bg, fg = c.orange},
    BufferLineMiniIconsPurple = { bg = c.bg_bufferline, fg = c.purple },
    BufferLineMiniIconsPurpleSelected = { bg = c.bg, fg = c.purple},
    BufferLineMiniIconsRed = { bg = c.bg_bufferline, fg = c.red },
    BufferLineMiniIconsRedSelected = { bg = c.bg, fg = c.red},
    BufferLineMiniIconsYellow = { bg = c.bg_bufferline, fg = c.yellow },
    BufferLineMiniIconsYellowSelected = { bg = c.bg, fg = c.yellow},
  }
end

return M
