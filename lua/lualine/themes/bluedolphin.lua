local colors = require("bluedolphin.colors").setup({ transform = true })
local config = require("bluedolphin.config").options

local bluedolphin = {}

bluedolphin.normal = {
  a = { bg = colors.fg, fg = colors.black },
  b = { bg = colors.fg_gutter_2, fg = colors.fg },
  c = { bg = colors.bg_dim, fg = colors.cyan},
}

bluedolphin.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.green },
}

bluedolphin.command = {
  a = { bg = colors.yellow3, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.yellow },
}

bluedolphin.visual = {
  a = { bg = colors.pink, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.magenta },
}

bluedolphin.replace = {
  a = { bg = colors.orange, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.red },
}

bluedolphin.terminal = {
  a = { bg = colors.green1, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.green1 },
}

bluedolphin.inactive = { 
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(bluedolphin) do
    mode.a.gui = "bold"
  end
end

return bluedolphin
