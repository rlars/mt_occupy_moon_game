omg_world_path = minetest.get_modpath("omg_world")

dofile(omg_world_path.."/crafting.lua");
dofile(omg_world_path.."/technic_ores.lua");
dofile(omg_world_path.."/technic_ores_worldgen.lua");
dofile(omg_world_path.."/version_update_replacements.lua");


local function give_or_drop_item(player, itemstack)
    local inv = minetest.get_inventory({type="player", name=player:get_player_name()})
    local remaining = inv:add_item("main", itemstack)
    minetest.add_item(player:get_pos(), remaining)
end

-- allow player to use an air bottle to fill their suit
local function refill_player_suit(itemstack, player, pointed_thing)
	local name, invs = armor:get_valid_player(player, "[refill_spacesuit]")
	if not name then
		return
	end
    for i, item in ipairs(invs:get_list("armor")) do
		if item and item:get_name() ~= "" then
			if item:get_name() == "spacesuit:helmet" or
			   item:get_name() == "spacesuit:chestplate" or
			   item:get_name() == "spacesuit:pants" or
			   item:get_name() == "spacesuit:boots" then
				local max_refill = math.min(item:get_wear(), 65535)
				armor:damage(player, i, item, -max_refill)
			end
		end
	end
	
	itemstack:set_count(itemstack:get_count() - 1)
	give_or_drop_item(player, "vessels:steel_bottle")
	return itemstack
end

minetest.override_item("vacuum:air_bottle", {
	on_secondary_use = refill_player_suit,
	on_place = refill_player_suit,
})


-- Spawn newplayer function

minetest.register_on_newplayer(function(player)
	local inv = player:get_inventory()
	inv:add_item("main", "default:pick_diamond 4")
	inv:add_item("main", "default:shovel_diamond 4")
	inv:add_item("main", "farming:hoe_diamond 4")
	local player = player
	-- 3d_armor´s inventory is not fully set up in the beginning. They use a delay of 0, so we wait a bit for them and afterwards equip the spacesuit.
	minetest.after(2, function()
		armor:equip(player, ItemStack("spacesuit:helmet"))
		armor:equip(player, ItemStack("spacesuit:chestplate"))
		armor:equip(player, ItemStack("spacesuit:pants"))
		armor:equip(player, ItemStack("spacesuit:boots"))
	end)
	inv:add_item("main", "omg_missions:landing_site_marker")
end)


-- Respawn player function

minetest.register_on_respawnplayer(function(player)
	local inv = player:get_inventory()
	inv:add_item("main", "default:pick_diamond")
	inv:add_item("main", "default:shovel_diamond 4")
	inv:add_item("main", "farming:hoe_diamond 4")

	armor:remove_all(player)
	armor:equip(player, ItemStack("spacesuit:helmet"))
	armor:equip(player, ItemStack("spacesuit:chestplate"))
	armor:equip(player, ItemStack("spacesuit:pants"))
	armor:equip(player, ItemStack("spacesuit:boots"))

	return true
end)


-- moon physics: low gravity
minetest.register_on_joinplayer(function(player)
	player_monoids.gravity:add_change(player, 0.2, "omg_world:physics")
end)

-- the spacesuit is heavy, player can only make smaller jumps with it
local spacesuit_chestplate_groups = minetest.registered_items["spacesuit:chestplate"].groups
spacesuit_chestplate_groups["physics_jump"] = -0.4
minetest.override_item("spacesuit:chestplate", {
	groups = spacesuit_chestplate_groups
})

