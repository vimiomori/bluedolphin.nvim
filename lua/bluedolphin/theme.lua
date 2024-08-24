local Util = require("bluedolphin.util")

local M = {}

---@param opts? bluedolphin.Config
function M.setup(opts)
  opts = require("bluedolphin.config").extend(opts)

  local colors = require("bluedolphin.colors").setup(opts)
  local groups = require("bluedolphin.groups").setup(colors, opts)

  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "bluedolphin-" .. opts.style

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end

  if opts.terminal_colors then
    M.terminal(colors)
  end

  return colors, groups, opts
end

---@param colors ColorScheme
function M.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.terminal_black

  -- light
  vim.g.terminal_color_7 = colors.fg_dark
  vim.g.terminal_color_15 = colors.fg

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = Util.blend_fg(colors.red, 0.5)

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = Util.blend_fg(colors.green, 0.5)

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = Util.blend_fg(colors.yellow, 0.5)

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = Util.blend_fg(colors.blue, 0.5)

  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_18 = Util.blend_fg(colors.magenta, 0.5)

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = Util.blend_fg(colors.cyan, 0.5)
end

return M
-- local util = require("bluedolphin.util")
-- local colors = require("bluedolphin.colors")
--
-- local M = {}
-- --
-- ---@class Highlight
-- ---@field fg string|nil
-- ---@field bg string|nil
-- ---@field sp string|nil
-- ---@field style string|nil|Highlight
-- ---@field link string|nil
--
-- ---@alias Highlights table<string,Highlight>
--
-- ---@return Theme
-- function M.setup()
--   local config = require("bluedolphin.config")
--   local options = config.options
--   ---@class Theme
--   ---@field highlights Highlights
--   local theme = {
--     config = options,
--     colors = colors.setup(),
--   }
--
--   local c = theme.colors
--
--   theme.highlights = {
--     -- Cmp
--     CmpDocumentation = { fg = c.fg, bg = c.bg_float },
--     CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },
--     CmpGhostText = { fg = c.blue2 },
--
--     CmpItemAbbr = { fg = c.fg, bg = c.none },
--     CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
--     CmpItemAbbrMatch = { fg = c.blue1, bg = c.none },
--     CmpItemAbbrMatchFuzzy = { fg = c.blue1, bg = c.none },
--
--     CmpItemMenu = { fg = c.comment, bg = c.none },
--
--     CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },
--
--     CmpItemKindKeyword = { fg = c.cyan, bg = c.none },
--
--     CmpItemKindVariable = { fg = c.magenta, bg = c.none },
--     CmpItemKindConstant = { fg = c.magenta, bg = c.none },
--     CmpItemKindReference = { fg = c.magenta, bg = c.none },
--     CmpItemKindValue = { fg = c.magenta, bg = c.none },
--     CmpItemKindCopilot = { fg = c.teal, bg = c.none },
--     CmpItemKindCodeium = { fg = c.teal, bg = c.none },
--
--     CmpItemKindFunction = { fg = c.blue, bg = c.none },
--     CmpItemKindMethod = { fg = c.blue, bg = c.none },
--     CmpItemKindConstructor = { fg = c.blue, bg = c.none },
--
--     CmpItemKindClass = { fg = c.orange, bg = c.none },
--     CmpItemKindInterface = { fg = c.orange, bg = c.none },
--     CmpItemKindStruct = { fg = c.orange, bg = c.none },
--     CmpItemKindEvent = { fg = c.orange, bg = c.none },
--     CmpItemKindEnum = { fg = c.orange, bg = c.none },
--     CmpItemKindUnit = { fg = c.orange, bg = c.none },
--
--     CmpItemKindModule = { fg = c.yellow, bg = c.none },
--
--     CmpItemKindProperty = { fg = c.green1, bg = c.none },
--     CmpItemKindField = { fg = c.green1, bg = c.none },
--     CmpItemKindTypeParameter = { fg = c.green1, bg = c.none },
--     CmpItemKindEnumMember = { fg = c.green1, bg = c.none },
--     CmpItemKindOperator = { fg = c.green1, bg = c.none },
--     CmpItemKindSnippet = { fg = c.dark5, bg = c.none },
--
--     -- navic
--     NavicIconsFile = { fg = c.fg, bg = c.none },
--     NavicIconsModule = { fg = c.yellow, bg = c.none },
--     NavicIconsNamespace = { fg = c.fg, bg = c.none },
--     NavicIconsPackage = { fg = c.fg, bg = c.none },
--     NavicIconsClass = { fg = c.orange, bg = c.none },
--     NavicIconsMethod = { fg = c.blue, bg = c.none },
--     NavicIconsProperty = { fg = c.green1, bg = c.none },
--     NavicIconsField = { fg = c.green1, bg = c.none },
--     NavicIconsConstructor = { fg = c.orange, bg = c.none },
--     NavicIconsEnum = { fg = c.orange, bg = c.none },
--     NavicIconsInterface = { fg = c.orange, bg = c.none },
--     NavicIconsFunction = { fg = c.blue, bg = c.none },
--     NavicIconsVariable = { fg = c.magenta, bg = c.none },
--     NavicIconsConstant = { fg = c.magenta, bg = c.none },
--     NavicIconsString = { fg = c.green, bg = c.none },
--     NavicIconsNumber = { fg = c.orange, bg = c.none },
--     NavicIconsBoolean = { fg = c.orange, bg = c.none },
--     NavicIconsArray = { fg = c.orange, bg = c.none },
--     NavicIconsObject = { fg = c.orange, bg = c.none },
--     NavicIconsKey = { fg = c.purple, bg = c.none },
--     NavicIconsKeyword = { fg = c.purple, bg = c.none },
--     NavicIconsNull = { fg = c.orange, bg = c.none },
--     NavicIconsEnumMember = { fg = c.green1, bg = c.none },
--     NavicIconsStruct = { fg = c.orange, bg = c.none },
--     NavicIconsEvent = { fg = c.orange, bg = c.none },
--     NavicIconsOperator = { fg = c.fg, bg = c.none },
--     NavicIconsTypeParameter = { fg = c.green1, bg = c.none },
--     NavicText = { fg = c.fg, bg = c.none },
--     NavicSeparator = { fg = c.fg, bg = c.none },
--
--     IndentBlanklineChar = { fg = c.fg_gutter, nocombine = true },
--     IndentBlanklineContextChar = { fg = c.purple, nocombine = true },
--     IblIndent = { fg = c.fg_gutter, nocombine = true },
--     IblScope = { fg = c.purple, nocombine = true },
--
--     -- Scrollbar
--     ScrollbarHandle = { fg = c.none, bg = c.bg_highlight },
--
--     ScrollbarSearchHandle = { fg = c.orange, bg = c.bg_highlight },
--     ScrollbarSearch = { fg = c.orange, bg = c.none },
--
--     ScrollbarErrorHandle = { fg = c.error, bg = c.bg_highlight },
--     ScrollbarError = { fg = c.error, bg = c.none },
--
--     ScrollbarWarnHandle = { fg = c.warning, bg = c.bg_highlight },
--     ScrollbarWarn = { fg = c.warning, bg = c.none },
--
--     ScrollbarInfoHandle = { fg = c.info, bg = c.bg_highlight },
--     ScrollbarInfo = { fg = c.info, bg = c.none },
--
--     ScrollbarHintHandle = { fg = c.hint, bg = c.bg_highlight },
--     ScrollbarHint = { fg = c.hint, bg = c.none },
--
--     ScrollbarMiscHandle = { fg = c.purple, bg = c.bg_highlight },
--     ScrollbarMisc = { fg = c.purple, bg = c.none },
--
--     -- Yanky
--     YankyPut = { link = "IncSearch" },
--     YankyYanked = { link = "IncSearch" },
--
--     -- Lazy
--     LazyProgressDone = { bold = true, fg = c.green5 },
--     LazyProgressTodo = { bold = true, fg = c.fg_gutter },
--
--     -- Notify
--     NotifyBackground = { fg = c.fg, bg = c.bg },
--     --- Border
--     NotifyERRORBorder = { fg = util.darken(c.error, 0.3), bg = c.none or c.bg },
--     NotifyWARNBorder = { fg = util.darken(c.warning, 0.3), bg = c.none or c.bg },
--     NotifyINFOBorder = { fg = util.darken(c.info, 0.3), bg = c.none or c.bg },
--     NotifyDEBUGBorder = { fg = util.darken(c.comment, 0.3), bg = c.none or c.bg },
--     NotifyTRACEBorder = { fg = util.darken(c.purple, 0.3), bg = c.none or c.bg },
--     --- Icons
--     NotifyERRORIcon = { fg = c.error },
--     NotifyWARNIcon = { fg = c.warning },
--     NotifyINFOIcon = { fg = c.info },
--     NotifyDEBUGIcon = { fg = c.comment },
--     NotifyTRACEIcon = { fg = c.purple },
--     --- Title
--     NotifyERRORTitle = { fg = c.error },
--     NotifyWARNTitle = { fg = c.warning },
--     NotifyINFOTitle = { fg = c.info },
--     NotifyDEBUGTitle = { fg = c.comment },
--     NotifyTRACETitle = { fg = c.purple },
--     --- Body
--     NotifyERRORBody = { fg = c.fg, bg = c.none or c.bg },
--     NotifyWARNBody = { fg = c.fg, bg = c.none or c.bg },
--     NotifyINFOBody = { fg = c.fg, bg = c.none or c.bg },
--     NotifyDEBUGBody = { fg = c.fg, bg = c.none or c.bg },
--     NotifyTRACEBody = { fg = c.fg, bg = c.none or c.bg },
--
--     -- Mini
--     MiniCompletionActiveParameter = { underline = true },
--
--     MiniCursorword = { bg = c.fg_gutter },
--     MiniCursorwordCurrent = { bg = c.fg_gutter },
--
--     MiniIndentscopeSymbol = { fg = c.blue1, nocombine = true },
--     MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible
--
--     MiniJump = { bg = c.magenta2, fg = "#ffffff" },
--
--     MiniJump2dSpot = { fg = c.magenta2, bold = true, nocombine = true },
--
--     MiniStarterCurrent = { nocombine = true },
--     MiniStarterFooter = { fg = c.yellow, italic = true },
--     MiniStarterHeader = { fg = c.blue },
--     MiniStarterInactive = { fg = c.comment, style = options.styles.comments },
--     MiniStarterItem = { fg = c.fg, bg = c.none or c.bg },
--     MiniStarterItemBullet = { fg = c.border_highlight },
--     MiniStarterItemPrefix = { fg = c.warning },
--     MiniStarterSection = { fg = c.blue1 },
--     MiniStarterQuery = { fg = c.info },
--
--     MiniStatuslineDevinfo = { fg = c.fg_dark, bg = c.bg_highlight },
--     MiniStatuslineFileinfo = { fg = c.fg_dark, bg = c.bg_highlight },
--     MiniStatuslineFilename = { fg = c.fg_dark, bg = c.fg_gutter },
--     MiniStatuslineInactive = { fg = c.blue, bg = c.bg_statusline },
--     MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
--     MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
--     MiniStatuslineModeNormal = { fg = c.black, bg = c.blue, bold = true },
--     MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
--     MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
--     MiniStatuslineModeVisual = { fg = c.black, bg = c.magenta, bold = true },
--
--     MiniSurround = { bg = c.orange, fg = c.black },
--
--     MiniTablineCurrent = { fg = c.fg, bg = c.fg_gutter },
--     MiniTablineFill = { bg = c.red },
--     MiniTablineHidden = { fg = c.dark5, bg = c.bg_statusline },
--     MiniTablineModifiedCurrent = { fg = c.warning, bg = c.fg_gutter },
--     MiniTablineModifiedHidden = { bg = c.bg_statusline, fg = util.darken(c.warning, 0.7) },
--     MiniTablineModifiedVisible = { fg = c.warning, bg = c.bg_statusline },
--     MiniTablineTabpagesection = { bg = c.bg_statusline, fg = c.none },
--     MiniTablineVisible = { fg = c.fg, bg = c.bg_statusline },
--
--     MiniTestEmphasis = { bold = true },
--     MiniTestFail = { fg = c.red, bold = true },
--     MiniTestPass = { fg = c.green, bold = true },
--
--     MiniTrailspace = { bg = c.red },
--
--     -- Noice
--
--     NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
--
--     NoiceCompletionItemKindKeyword = { fg = c.cyan, bg = c.none },
--
--     NoiceCompletionItemKindVariable = { fg = c.magenta, bg = c.none },
--     NoiceCompletionItemKindConstant = { fg = c.magenta, bg = c.none },
--     NoiceCompletionItemKindReference = { fg = c.magenta, bg = c.none },
--     NoiceCompletionItemKindValue = { fg = c.magenta, bg = c.none },
--
--     NoiceCompletionItemKindFunction = { fg = c.blue, bg = c.none },
--     NoiceCompletionItemKindMethod = { fg = c.blue, bg = c.none },
--     NoiceCompletionItemKindConstructor = { fg = c.blue, bg = c.none },
--
--     NoiceCompletionItemKindClass = { fg = c.orange, bg = c.none },
--     NoiceCompletionItemKindInterface = { fg = c.orange, bg = c.none },
--     NoiceCompletionItemKindStruct = { fg = c.orange, bg = c.none },
--     NoiceCompletionItemKindEvent = { fg = c.orange, bg = c.none },
--     NoiceCompletionItemKindEnum = { fg = c.orange, bg = c.none },
--     NoiceCompletionItemKindUnit = { fg = c.orange, bg = c.none },
--
--     NoiceCompletionItemKindModule = { fg = c.yellow, bg = c.none },
--
--     NoiceCompletionItemKindProperty = { fg = c.green1, bg = c.none },
--     NoiceCompletionItemKindField = { fg = c.green1, bg = c.none },
--     NoiceCompletionItemKindTypeParameter = { fg = c.green1, bg = c.none },
--     NoiceCompletionItemKindEnumMember = { fg = c.green1, bg = c.none },
--     NoiceCompletionItemKindOperator = { fg = c.green1, bg = c.none },
--     NoiceCompletionItemKindSnippet = { fg = c.dark5, bg = c.none },
--
--     TreesitterContext = { bg = util.darken(c.fg_gutter, 0.8) },
--     Hlargs = { fg = c.yellow },
--     -- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },
--   }
--
--   if not vim.diagnostic then
--     local severity_map = {
--       Error = "Error",
--       Warn = "Warning",
--       Info = "Information",
--       Hint = "Hint",
--     }
--     local types = { "Default", "VirtualText", "Underline" }
--     for _, type in ipairs(types) do
--       for snew, sold in pairs(severity_map) do
--         theme.highlights["LspDiagnostics" .. type .. sold] = {
--           link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
--         }
--       end
--     end
--   end
--
--   ---@type table<string, table>
--   theme.defer = {}
--
--   if options.hide_inactive_statusline then
--     local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }
--
--     -- StatusLineNC
--     theme.highlights.StatusLineNC = inactive
--
--     -- LuaLine
--     for _, section in ipairs({ "a", "b", "c" }) do
--       theme.defer["lualine_" .. section .. "_inactive"] = inactive
--     end
--
--     -- mini.statusline
--     theme.highlights.MiniStatuslineInactive = inactive
--   end
--
--   options.on_highlights(theme.highlights, theme.colors)
--
--   if config.is_bluer() then
--     util.invert_colors(theme.colors)
--     util.invert_highlights(theme.highlights)
--   end
--
--   return theme
-- end
--
-- return M
