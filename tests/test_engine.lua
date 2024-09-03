local Taxi = require("lua.taxi.engine")

local f = assert(io.open("tests/test_engine.tks", "r"))

local data = f:read("*all")
f:close()

Taxi.decode(data)
