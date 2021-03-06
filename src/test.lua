
require "base.util.string"
require "base.util.table"

function main()
	if #arg < 1 then
		print(string.format("you should use: %s %s string|table|all", arg[-1], arg[0]))
		return
	end
	local finished = {}
	for k,v in ipairs(arg) do
		if not finished[v] then
			if v == "all" or v == "string" then
				base_util_string()
			end
			if v == "all" or v == "table" then
				base_util_table()
			end
			if v == "all" or v == "test3" then
				test3()
			end
			finished[v] = true
		end
	end
end

function test3()
	print("________test3")
end

function base_util_string()
	--- base.util.string
	print(string.trim("  linkzw git    "))
	local str = "abc def ghi jkl mno pq rst"
	local result1 = string.splittrim(str)
	local result2 = string.splittrim(str, 3)
	print(str, #result1, table.dump(result1))
	print(str, #result2, table.dump(result2))

	local path = "/home/linkzw/Git/base-lua/base/util/"
	local result3 = string.splitpath(path)
	print(path, string.dirname(path))
	print(path, #result3, table.dump(result3))

	local str2 = "player.award.coin"
	local result4 = string.split(str2, '.')
	local result5 = string.split(str2, '.', 2)
	print(str2, #result4, table.dump(result4))
	print(str2, #result5, table.dump(result5))
end

function base_util_table()
	--- base.util.table
	local tbl = {}
	print(table.isempty(tbl))
	table.insert(tbl, "test1")
	table.insert(tbl, "test2")
	table.insert(tbl, "test3")
	table.insert(tbl, "test4")
	table.insert(tbl, "test5")

	tbl["hello"] = "world"

	print("----")
	print(table.dump(table.keys(tbl)))
	print("----")
	print(table.dump(table.values(tbl)))
	print("----")
	print(table.dump(table.extend(tbl, {"test7", "test8",})))
	print("----")
	print(table.dump(table.update(tbl, {["hello"] = "world2",})))
end

main()
