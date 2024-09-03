local Taxi = {}

--Converts tks data into a lua table
Taxi.decode = function(taxi, options)
	options = options or {}

	-- store text data
	local buffer = ""

	-- the current location within the string to parse
	local cursor = 1

	-- the output table
	local out = {}

	-- the current table to write to
	local obj = out

	-- the lines
	local lines = {}

	local function split(string, delimiter)
		local t = {}
		for str in string.gmatch(string, "([^" .. delimiter .. "]+)") do
			table.insert(t, str)
		end
		return t
	end

	local function is_valid_date(str)
		local d, m, y = str:match("(%d+)/(%d+)/(%d+)")
		return d ~= nil and m ~= nil and y ~= nil
	end

	lines = split(taxi, "\n")
	local date = ""
	for k, v in pairs(lines) do
		if is_valid_date(v) then
			print(v)
		end
	end
end

return Taxi
