function _G.put(...)
	local object = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(object, vim.inspect(v))
	end

	print(table.concat(object, "\n"))
	return ...
end
