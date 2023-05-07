-- overwrite solar panel behaviour
-- this is mostly an exact copy of technic´s solar_array.lua
-- with the check if y > 0 removed

local S = technic.getter

local technic_tiers = {
    [1] = {tier="LV", power=10},
    [2] = {tier="MV", power=30},
    [3] = {tier="HV", power=100}
}

local function fix_technic_solar_array(data)
	local tier = data.tier
	local ltier = string.lower(tier)

	local run = function(pos, node)
		-- The action here is to make the solar array produce power
		-- Power is dependent on the light level and the height above ground
		-- There are many ways to cheat by using other light sources like lamps.
		-- As there is no way to determine if light is sunlight that is just a shame.
		-- To take care of some of it solar panels do not work outside daylight hours or if
		-- built below 0m
		local pos1 = {}
		local machine_name = S("Arrayed Solar %s Generator"):format(tier)
		pos1.y = pos.y + 1
		pos1.x = pos.x
		pos1.z = pos.z

		technic.get_or_load_node(pos1)
		local light = minetest.get_node_light(pos1, nil)
		local time_of_day = minetest.get_timeofday()
		local meta = minetest.get_meta(pos)
		light = light or 0

		-- turn on array only during day time and if sufficient light
		-- I know this is counter intuitive when cheating by using other light sources.
		if light >= 12 and time_of_day >= 0.24 and time_of_day <= 0.76 then
			local charge_to_give = math.floor((light + math.max(0, pos.y)) * data.power)
			charge_to_give = math.max(charge_to_give, 0)
			charge_to_give = math.min(charge_to_give, data.power * 50)
			meta:set_string("infotext", S("@1 Active (@2)", machine_name,
				technic.EU_string(charge_to_give)))
			meta:set_int(tier.."_EU_supply", charge_to_give)
		else
			meta:set_string("infotext", S("%s Idle"):format(machine_name))
			meta:set_int(tier.."_EU_supply", 0)
		end
	end

	minetest.override_item("technic:solar_array_"..ltier, { technic_run = run })
end

for _, tier in ipairs(technic_tiers) do
	fix_technic_solar_array(tier)
end
