-- Define a global dependency
dependency_value = "hello"

local NAME=...

-- Define a local scoped table to hold functions
local M = {}

-- Create a function that 
function M.check_function()
    quarto.log.output("Access the dependency value")
    return 42
end 

-- Return the table of functions
return M