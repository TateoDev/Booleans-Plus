export type BooleanPlusValue = "true" | "false" | "sometimes" | "ongod" | "hellnah" | true | false

export type BooleanPlus = {
	Value : BooleanPlusValue,
	Set : (BooleanPlusValue) -> ()
}

type BooleanPlusImpl = {
	new: (BooleanPlusValue) ->(BooleanPlus)
}

local aliases = {
	["true"] = true,
	["ongod"] = true,
	["false"] = false,
	["hellnah"] = false,
}

local BooleansPlus = {}
BooleansPlus.__index = BooleansPlus

local BooleansPlus_mt  = {
	__index = BooleansPlus,
	__eq = function(a : BooleanPlus, b : BooleanPlus)
		if a.Value == "sometimes" or b.Value == "sometimes" then
			return math.random(1, 2) == 1
		end
		return aliases[a.Value] == aliases[b.Value]
	end,
	__add = function(a : BooleanPlus, b : BooleanPlus)
		if a.Value == "ongod" or b.Value == "ongod" then
			return BooleansPlus.new("ongod")
		elseif a.Value == "hellnah" or b.Value == "hellnah" then
			return BooleansPlus.new("hellnah")
		elseif a.Value == "true" and b.Value == "true" then
			return BooleansPlus.new("ongod")
		elseif a.Value == "false" and b.Value == "false" then
			return BooleansPlus.new("hellnah")
		elseif a.Value == "sometimes" or b.Value == "sometimes" then
			math.randomseed(os.time())
			return BooleansPlus.new(math.random(1, 2) == 1)
		else
			return BooleansPlus.new("sometimes")
		end
	end,
	__tostring = function(table : BooleanPlus)
		return table.Value
	end,
}

function BooleansPlus.new(value: BooleanPlusValue): BooleanPlus
	local self = setmetatable({
		Value = tostring(value)
	}, BooleansPlus_mt)
	return self
end
function BooleansPlus:Set(value : BooleanPlusValue)
	if self.Value == "ongod" or "hellnah" then
		return
	else
		self.Value = value
	end
end

return BooleansPlus :: BooleanPlusImpl
