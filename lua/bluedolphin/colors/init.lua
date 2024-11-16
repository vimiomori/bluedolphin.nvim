local Util = require("bluedolphin.util")

local M = {}

---@type table<string, Palette|fun(opts:bluedolphin.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("bluedolphin.colors." .. style))
  end,
})

---@param opts? bluedolphin.Config
function M.setup(opts)
  opts = require("bluedolphin.config").extend(opts)

  Util.day_brightness = opts.day_brightness

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Palette]]
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  colors.diff = {
    add = Util.blend_bg(colors.green5, 0.15),
    delete = Util.blend_bg(colors.red2, 0.15),
    change = Util.blend_bg(colors.blue, 0.15),
    text = colors.blue7,
  }

  colors.git.ignore = colors.comment
  colors.black = Util.blend_bg(colors.bg, 0.8, "#000000")
  colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_alt
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg_dim

  colors.bg_bufferline = opts.styles.bufferline == "transparent" and colors.none
    or opts.styles.bufferline == "dark" and colors.bg_dark
    or colors.bg_alt

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg_dim

  colors.bg_visual = colors.dimcomment
  colors.bg_search = Util.blend_bg(colors.green, 0.3)
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.error = colors.red1
  colors.todo = colors.blue
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.teal

  colors.rainbow = { colors.blue8, colors.yellow3, colors.green5, colors.teal, colors.pink, colors.lavendar }

  opts.on_colors(colors)

  return colors, opts
end

return M
