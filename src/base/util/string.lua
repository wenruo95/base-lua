
function split_trim(target)
	local tbl = {}
	for _,v in ipairs(string.gmatch(target, "%S+")) do
		table.insert(tbl, v)
	end
	return tbl
end
