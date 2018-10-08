
--- string
function split_trim(target)
	local tbl = {}
	for _,v in ipairs(string.gmatch(target, "%S+")) do
		table.insert(tbl, v)
	end
	return tbl
end

--- table
function table.isempty(tbl)
	if not tbl or not next(tbl) then
		return true
	end
	return false
end

function table.keys(tbl, func)
	local result = {}
	for k,v in pairs(tbl) do
		if not func or func(k,v) then
			table.insert(result, k)
		end
	end
	return result
end

function table.values(tbl, func)
	local result = {}
	for k,v in pairs(tbl) do
		if not func or func(k,v) then
			table.insert(result, v)
		end
	end
	return result
end

function table.extend(tbl1, tbl2)
	-- list
	for k,v in pairs(tbl2) do
		table.insert(tbl1, v)
	end
	return tbl1
end

function table.update(tbl1, tbl2)
	-- hash
	for k,v in pairs(tbl2) do
		tabl1[k] = v
	end
	return tbl1
end

function table.dump(t,space,name)
	if type(t) ~= "table" then
		return tostring(t)
	end
	space = space or ""
	name = name or ""
	local cache = { [t] = "."}
	local function _dump(t,space,name)
		local temp = {}
		for k,v in pairs(t) do
			local key = tostring(k)
			if cache[v] then
				table.insert(temp,"+" .. key .. " {" .. cache[v].."}")
			elseif type(v) == "table" then
				local new_key = name .. "." .. key
				cache[v] = new_key
				table.insert(temp,"+" .. key .. _dump(v,space .. (next(t,k) and "|" or " " ).. string.rep(" ",#key),new_key))
			else
				table.insert(temp,"+" .. key .. " [" .. tostring(v).."]")
			end
		end
		return table.concat(temp,"\n"..space)
	end
	return _dump(t,space,name)
end

