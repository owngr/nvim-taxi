local M = {}

function M.setup(options)
	local Config = require("taxi.config")
	Config.merge(options)
	require("toml.engine").strict = Config.get().engine.strict
	Config._log = require("taxi.log").new(Config.get().log) -- order matters
	Config.merge_nvim(require("taxi.core").parse(Config.get()))

	if Config.get().package then
		package.path = string.format("%s;%s/?.lua", package.path, Config.get().directory)
	end
	Config.merge({ factory = { contents = require("factory") } })
	Config._log.info("taxi.setup(): Started applying features.")
	require("taxi.nvim").apply(Config.get())
	Config._log.info("taxi.setup(): Ended applying features.")
end

return M
