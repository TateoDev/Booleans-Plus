# Booleans-Plus
Module created to explore higher level uses of LuaU's metatable features
This module is entirely a learning excerise and not intended to be used in a serious application

# Features
BooleanPlus-s have four states that they can be in
- True: identical to a regular boolean
- False: identical to a regular boolean
- Ongod: behaves like true, but is constant and can't be changed to false
- Hellnah: behaves like false, but is constant and can't be changed to true
- Sometimes: Behaves like true half the time and like false the other half

Also features boolean addition

# Examples
```lua
local BooleanPlus = require(ServerScriptService.BooleanPlus)

local a1 = BooleanPlus.new(false)
local a2 = BooleanPlus.new(true)

local a3 = BooleanPlus.new(j == k)
print(`result: {a3}`) -- prints false

local b1 = BooleanPlus.new("ongod")
b1:Set("false")
print(b1) --prints ongod

local c1 = BooleanPlus.new("false") + BooleanPlus.new(false)
print(c1) --prints hellnah

for i = 1, 4 do
	local d1 = BooleanPlus.new("sometimes")
	print(d1 == BooleanPlus.new(true))
end --sometimes prints true sometimes prints false

```
