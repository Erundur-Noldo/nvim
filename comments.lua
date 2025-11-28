vim.keymap.set("v", "?", function()
   local comment_prefix = get_comment_prefix()
   if comment_prefix == nil then
      return
   end

   local selection_start = vim.fn.line("v")
   local selection_cur = vim.fn.line(".")
   if(selection_start > selection_cur) then
      selection_start, selection_cur = selection_cur, selection_start
   end
   local to_comment = false -- determined whether we comment everything or uncomment everything
   for line_num = selection_start, selection_cur do
      if not is_commented(line_num, comment_prefix) then
         to_comment = true
         break
      end
   end
   for line_num = selection_start, selection_cur do
      if to_comment then
         add_comment(line_num, comment_prefix)
      else
         remove_comment(line_num, comment_prefix)
      end
   end
end, { noremap = true })

vim.keymap.set("n", "?", function()
   local comment_prefix = get_comment_prefix()
   if comment_prefix == nil then
      return
   end
   local line_num = vim.fn.line(".")
   if is_commented(line_num, comment_prefix) then
      remove_comment(line_num, comment_prefix)
   else
      add_comment(line_num, comment_prefix)
   end
end, { noremap = true })

function get_comment_prefix()
   local filetype = vim.bo.filetype
   local dictionary = {
      c = "// ",
      cpp = "// ",
      haskell = "-- ",
      lua = "-- ",
      python = "# "
   }
   return dictionary[filetype]
end

function is_commented(line_num, comment_prefix)
   local line = vim.fn.getline(line_num)
   line = line:gsub("^%s*", "")
   return line:sub(1, #comment_prefix) == comment_prefix
end

function add_comment(line_num, comment_prefix)
   local line = vim.fn.getline(line_num)
   line = line:gsub("^(%s*)", "%1" .. comment_prefix) 
   vim.fn.setline(line_num, line)
end

function remove_comment(line_num, comment_prefix)
   local line = vim.fn.getline(line_num)
   line = line:gsub("^(%s*)" .. comment_prefix, "%1")
   vim.fn.setline(line_num, line)
end

