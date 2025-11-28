vim.keymap.set("i", "(", "()<Left>", { noremap = true })
vim.keymap.set("i", ")", function()
   local col = vim.fn.col(".")
   local line = vim.fn.getline(".")
   local char_under_cursor = line:sub(col, col)

   if char_under_cursor == ")" then
      return "<Right>"
   else
      return ")"
   end
end, { expr = true, noremap = true })

vim.keymap.set("i", "{", "{}<Left>", { noremap = true })
vim.keymap.set("i", "}", function()
   local col = vim.fn.col(".")
   local line = vim.fn.getline(".")
   local char_under_cursor = line:sub(col, col)

   if char_under_cursor == "}" then
      return "<Right>"
   else
      return "}"
   end
end, { expr = true, noremap = true })

vim.keymap.set("i", "[", "[]<Left>", { noremap = true })
vim.keymap.set("i", "]", function()
   local col = vim.fn.col(".")
   local line = vim.fn.getline(".")
   local char_under_cursor = line:sub(col, col)

   if char_under_cursor == "]" then
      return "<Right>"
   else
      return "]"
   end
end, { expr = true, noremap = true })


vim.keymap.set("i", "'", function()
   local col = vim.fn.col(".")
   local line = vim.fn.getline(".")
   local char_under_cursor = line:sub(col, col)

   if(char_under_cursor == "'") then
      return "<Right>"
   else
      return "''<Left>"
   end
end, { expr = true, noremap = true })

vim.keymap.set("i", "\"", function()
   local col = vim.fn.col(".")
   local line = vim.fn.getline(".")
   local char_under_cursor = line:sub(col, col)

   if(char_under_cursor == "\"") then
      return "<Right>"
   else
      return "\"\"<Left>"
   end
end, { expr = true, noremap = true })




vim.keymap.set("v", "<tab>", function()
   local selection_start = vim.fn.line("v")
   local selection_cur = vim.fn.line(".")
   if selection_start < selection_cur then
      return ":normal! I<Tab><Enter><Esc>`<v`>"
   else
      return ":normal! I<Tab><Enter><Esc>`>v`<"
   end
end, { expr = true, noremap = true })

vim.keymap.set("v", "<S-tab>", function()
   local selection_start = vim.fn.line("v")
   local selection_cur = vim.fn.line(".")
   if selection_start < selection_cur then
      return ":normal! 0xxx<Enter><Esc>`<v`>"
   else
      return ":normal! 0xxx<Enter><Esc>`>v`<"
   end
end, { expr = true, noremap = true })


