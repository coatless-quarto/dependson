
---
-- Check global variable definitions (e.g. no local prefixed to variable)

-- Check to see if the nested value is present in the global space
local my_level = require("same-directory")

-- Check to see if the nested value is present
quarto.log.output(nested_value)
-- Check to see if the same value is present
quarto.log.output(same_level_value)

---

----

-- Load the a filter from a dependency extension
local dependency = require("_extensions.coatless-quarto.thedependency.thedependency")

-- Check to see if the global dependency value is present
quarto.log.output(dependency_value)

-- Check to see if the table call to the check_function is present
quarto.log.output(dependency.check_function())

----