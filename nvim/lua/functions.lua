_G.lsp_diagnostics = function()
  local e = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local w = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local err = (e > 0) and (" " .. e .. "   ") or ""
  local warn = (w > 0) and (" " .. w .. " ") or ""
  return err .. warn
end

function fzy_finder(new_tab)
	local s, r = "/tmp/s.sh", "/tmp/r"
	local f = io.open(s, "w")
	f:write(
		"find . -type f -not -path '*/.*' -not -path '*/node_modules/*' -not -path '*/target/*' -not -path '*/__pycache__/*' -not -path '*/.venv/*' -not -path '*/.cache/*' | fzy -l 6 > " ..
		r)
	f:close()
	os.execute("chmod +x " .. s)

	require('toggleterm.terminal').Terminal:new({
		cmd = s,
		direction = "horizontal",
		size = 6,
		close_on_exit = true,
		on_exit = function()
			vim.schedule(function()
				local rf = io.open(r, "r")
				if rf then
					local file = rf:read("*line")
					rf:close()
					os.remove(r)
					if file and file ~= "" then
						vim.cmd(new_tab == true and ("tabnew " .. file) or new_tab == "vsplit" and ("vsplit " .. file) or ("edit " .. file))
					end
				end
				os.remove(s)
			end)
		end,
	}):toggle()
end



function gdb()
	require('toggleterm.terminal').Terminal:new({
		cmd = "gdb -q --args $(bash -i -c ' printf \"\\033[1;36m Executable: \\033[0m\" >&2; read -e gdb_exe; printf \"%s\" \"$gdb_exe\"')" ,
		direction = "float",
		size = 3,
		close_on_exit = true,
	}):toggle()
end

vim.deprecate = function() end
