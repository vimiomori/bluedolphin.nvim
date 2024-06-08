local util = require("bluedolphin.util")

local M = {}

---@class Palette
M.default = {
  none = "NONE",
  white = "#b4f9f8",
  bg_light = "#003955",
  -- bg = "#00334D",
  bg_dark = "#00283F",
  -- bg_dim = "#00334D",
  bg = "#00334D",
  bg_visual = "#002F47",
  bg_highlight = "#003F60",
  terminal_black = "#002a3e",
  fg = "#17E3FF",
  fg_dark = "#47D2EA",
  fg_gutter = "#005E8D",
  grey = "#325881",
  comment = "#006082",
  dark5 = "#6ee7ff",
  blue0 = "#0089DF",
  blue = "#39CDFF",
  cyan = "#6ee7ff",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#005cad",
  blue8 = "#72EAFF",
  blue9 = "#00B6FF",
  blue10 = "#29CEFF",
  magenta2 = "#ff007c",
  magenta = "#ffcbe6",
  purple = "#EBB6FF",
  lavendar = "#D6D9FF",
  pink = "#FFEBFE",
  orange = "#FFB9A3",
  yellow = "#F3FF95",
  yellow2 = "#FDFFC4",
  yellow3 = "#FEFFD5",
  yellow4 = "#F5F6DB",
  green = "#30ffc8",
  green1 = "#00C6E2",
  green2 = "#41a6b5",
  green3 = "#63FFDB",
  green4 = "#5DFFAE",
  green5 = "#30FFF2",
  teal = "#0098B8",
  teal2 = "#007F9A",
  red = "#FF9898",
  red1 = "#FF7575",
  red2 = "#FFACAF",
  git = { change = "#C6CD8C", add = "#449dab", delete = "#914c54" },
  gitSigns = {
    add = "#30FFF2",
    change = "#F6FFAE",
    delete = "#FFCBBA",
  },
}

M.moon = function()
  local ret = {
    none = "NONE",
    bg_dark = "#1e2030", --
    bg = "#222436", --
    bg_highlight = "#2f334d", --
    terminal_black = "#444a73", --
    fg = "#c8d3f5", --
    fg_dark = "#828bb8", --
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#7a88cf", --
    dark5 = "#737aa2",
    blue0 = "#3e68d7", --
    blue = "#82aaff", --
    cyan = "#86e1fc", --
    blue1 = "#65bcff", --
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#b4f9f8", --
    blue7 = "#394b70",
    purple = "#fca7ea", --
    magenta2 = "#ff007c",
    magenta = "#c099ff", --
    orange = "#ff966c", --
    yellow = "#ffc777", --
    green = "#c3e88d", --
    green1 = "#4fd6be", --
    green2 = "#41a6b5",
    teal = "#4fd6be", --
    red = "#ff757f", --
    red1 = "#c53b53", --
  }
  ret.comment = util.blend(ret.comment, ret.bg, "bb")
  ret.git = {
    change = util.blend(ret.blue, ret.bg, "ee"),
    add = util.blend(ret.green, ret.bg, "ee"),
    delete = util.blend(ret.red, ret.bg, "dd"),
  }
  ret.gitSigns = {
    change = util.blend(ret.blue, ret.bg, "66"),
    add = util.blend(ret.green, ret.bg, "66"),
    delete = util.blend(ret.red, ret.bg, "aa"),
  }
  return ret
end

---@return ColorScheme
function M.setup(opts)
  opts = opts or {}
  local config = require("bluedolphin.config")

  local style = config.options.style
  local palette = M[style] or {}
  if type(palette) == "function" then
    palette = palette()
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)

  util.bg = colors.bg
  util.day_brightness = config.options.day_brightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.15),
    change = util.darken(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.git.ignore = colors.grey
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = util.darken(colors.blue1, 0.8)
  colors.border = colors.teal2

  -- dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark
  colors.bg_sidebar = colors.bg_dark
  colors.bg_float = colors.bg_dark

  colors.bg_search = colors.fg_gutter
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.error = colors.red1
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.green3

  colors.delta = {
    add = util.darken(colors.green2, 0.45),
    delete = util.darken(colors.red1, 0.45),
  }

  config.options.on_colors(colors)
  if opts.transform and config.is_bluer() then
    util.invert_colors(colors)
  end

  return colors
end

return M
