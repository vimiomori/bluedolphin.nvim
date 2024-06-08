local colors = require("bluedolphin.colors").setup({ transform = true })

local bluedolphin = {}

bluedolphin.normal = {
  left = { { colors.black, colors.blue }, { colors.cyan, colors.fg_gutter } },
  middle = { { colors.fg, colors.bg_statusline } },
  right = { { colors.black, colors.cyan }, { colors.cyan, colors.fg_gutter } },
  error = { { colors.black, colors.error } },
  warning = { { colors.black, colors.warning } },
}

bluedolphin.insert = {
  left = { { colors.black, colors.green }, { colors.blue, colors.bg_dark } },
}

bluedolphin.visual = {
  left = { { colors.black, colors.magenta }, { colors.blue, colors.bg_dark } },
}

bluedolphin.replace = {
  left = { { colors.black, colors.red }, { colors.blue, colors.bg_dark } },
}

bluedolphin.inactive = {
  left = { { colors.cyan, colors.bg_statusline }, { colors.dark3, colors.bg_dark } },
  middle = { { colors.fg_gutter, colors.bg_statusline } },
  right = { { colors.fg_gutter, colors.bg_statusline }, { colors.dark3, colors.bg_dark } },
}

bluedolphin.tabline = {
  left = { { colors.dark3, colors.bg_highlight }, { colors.dark3, colors.bg_dark } },
  middle = { { colors.fg_gutter, colors.bg_statusline } },
  right = { { colors.fg_gutter, colors.bg_statusline }, { colors.dark3, colors.bg_dark } },
  tabsel = { { colors.blue, colors.fg_gutter }, { colors.dark3, colors.bg_dark } },
}

return bluedolphin
