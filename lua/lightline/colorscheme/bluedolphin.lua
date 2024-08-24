local colors = require("bluedolphin.colors").setup({ transform = true })

local bluedolphin = {}

bluedolphin.normal = {
  left = { { colors.fg, colors.blue }, { colors.cyan, colors.fg_gutter } },
  middle = { { colors.fg, colors.bg_statusline } },
  right = { { colors.black, colors.cyan }, { colors.cyan, colors.fg_gutter } },
  error = { { colors.black, colors.error } },
  warning = { { colors.black, colors.warning } },
}

bluedolphin.insert = {
  left = { { colors.black, colors.green }, { colors.blue, colors.bg } },
}

bluedolphin.visual = {
  left = { { colors.black, colors.magenta }, { colors.blue, colors.bg } },
}

bluedolphin.replace = {
  left = { { colors.black, colors.red }, { colors.blue, colors.bg } },
}

bluedolphin.inactive = {
  left = { { colors.cyan, colors.bg_statusline }, { colors.grey, colors.bg } },
  middle = { { colors.fg_gutter, colors.bg_statusline } },
  right = { { colors.fg_gutter, colors.bg_statusline }, { colors.grey, colors.bg } },
}

bluedolphin.tabline = {
  left = { { colors.grey, colors.bg_highlight }, { colors.grey, colors.bg } },
  middle = { { colors.fg_gutter, colors.bg_statusline } },
  right = { { colors.fg_gutter, colors.bg_statusline }, { colors.grey, colors.bg } },
  tabsel = { { colors.blue, colors.fg_gutter }, { colors.grey, colors.bg } },
}

return bluedolphin
