local M = {}

local Taxi = require("taxi.engine")
local Util = require("taxi.util")
local Log = require("taxi.config")._log

function M.parse(config)
	local tail = vim.fn.fnamemodify(config.path, ":e")
	local data = Util.read(config.path)

	assert(type(data) == "string")
	data = data:gsub("$NVIM_CONFIG", vim.fn.stdpath("config"))
	data = data:gsub("$NVIM_STATE", vim.fn.stdpath("state"))
	data = data:gsub("$NVIM_DATA", vim.fn.stdpath("data"))
	data = data:gsub("$NVIM_CACHE", vim.fn.stdpath("cache"))

	if tail == "tks" then
		Log.debug("core.parse(): Parsing taxi.")
		return Taxi.decode(data)
	end
	Log.error("core.parse(): Only tks filetypes are allowed.")
	error("Only tks filetypes are allowed")
end

return M
