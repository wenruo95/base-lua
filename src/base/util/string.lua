-- string.handle

function string.ltrim(str,charset)
	local patten
	if charset then
		patten = string.format("^[%s]+",charset)
	else
		patten = string.format("^[ \t\n\r]+")
	end
	return string.gsub(str,patten,"")
end

function string.rtrim(str,charset)
	local patten
	if charset then
		patten = string.format("[%s]+$",charset)
	else
		patten = string.format("[ \t\n\r]+$")
	end

	return string.gsub(str,patten,"")
end

function string.trim(str,charset)
	str = string.ltrim(str,charset)
	return string.rtrim(str,charset)
end

function string.isdigit(str)
	local ret = pcall(tonumber,str)
	return ret
end

function string.splittrim(target, cnts)
	return string.split(target, nil, cnts)
end

function string.splitpath(path)
	-- string.dirname(path) 获取上层所有路径
	return string.split(path, '/')
end

function string.basename(path)
	local file = string.gsub(path,"^.*[/\\](.+)$","%1")
	local basename = string.gsub(file,"^(.+)%..+$","%1")
	return basename
end

function string.dirname(path)
	local dirname = string.gsub(path,"^(.*)[/\\].*$","%1")
	if dirname == path then
		return "."
	else
		return string.rtrim(dirname,"/\\")
	end
end

function string.split(str,pat, maxsplit)
	local count = 0
	local results = {}
	pat = pat and string.format("[^%s]+",pat) or "%S+"
	for s in string.gmatch(str, pat) do
		if maxsplit and count >= maxsplit then
			return results
		end
		count = count + 1
		table.insert(results, s)
	end
	return results
end

