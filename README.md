# dependson Extension for Quarto

The `dependson` extension provides a convenient way to share variables and functions between Lua filters in the Quarto document generation system. This functionality can be useful within a single extension or even across different extensions.

## Installation

To install the `dependson` extension, open your terminal and execute the following command:

```bash
quarto add coatless-quarto/dependson
```

This command will download and install the extension under the `_extensions` subdirectory of your Quarto project. If you're using version control, make sure to include this directory in your repository.

## Usage

It's important to note that the `dependson` extension doesn't introduce any significant improvements to your document content. Instead, it serves as a valuable example of how to reuse code and share variables and functions between different Lua filters.

## Nesting Extensions

Let's explore a folder structure that demonstrates the versatility of the `dependson` extension:

```sh
.
├── example.qmd
├── _extensions
│   └── dependson
│       ├── dependson.lua
│       ├── _extensions
│       │   └── coatless-quarto
│       │       └── thedependency
│       │           ├── _extension.yml
│       │           └── thedependency.lua
│       ├── _extension.yml
│       ├── next-level
│       │   └── nested.lua
│       └── same-directory.lua
└── README.md
```

In this directory structure:

1. The `dependson` extension consists of multiple Lua files located in different directories.
2. We have an extension called `thedependency` nested within the main `dependson` extension.

Now, let's see how we can retrieve values from the `next-level/nested.lua` module and the `thedependency` extension.

### Retrieving Values from Lua Modules

To retrieve global variables (excluding those declared with the `local` keyword), you can use the `require` function to load the lua file containing the variable. In this example, the `dependson.lua` extension loads the `same-level.lua` module with `require("same-level")` and the `nested.lua` module using `require("next-level/nested.lua")`. This makes available the globally defined variables for output.

```lua
-- Check global variable definitions (e.g. no local prefixed to variable)

-- Check to see if the nested value is present in the global space
local my_level = require("same-directory")

-- Check to see if the same value is present
quarto.log.output(same_level_value)
```

### Retrieving Values from Extensions

For extensions, you can access functions as follows:

```lua
-- Store function calls in a table value
local dependency = require("_extensions.coatless-quarto.thedependency.thedependency")

-- Call the function defined in the separate Lua file
dependency.check_function()
```

This code demonstrates how to import and use functions defined in the `thedependency` extension within your Lua code.


# Fin

By using these techniques, you can efficiently share code and data between different parts of your Quarto extensions.
