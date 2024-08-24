---@class bluedolphin.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias bluedolphin.Highlights table<string,bluedolphin.Highlight|string>

---@alias bluedolphin.HighlightsFn fun(colors: ColorScheme, opts:bluedolphin.Config):bluedolphin.Highlights

---@class bluedolphin.Cache
---@field groups bluedolphin.Highlights
---@field inputs table
