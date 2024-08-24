local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type bluedolphin.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LazyProgressDone = { bold = true, fg = c.green5 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
  }
end

return M
