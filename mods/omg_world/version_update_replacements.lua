
local moonrealm_nodes_to_replace =
{
	"moonrealm:stone",
	"moonrealm:dust",
	"moonrealm:glass",
	"moonrealm:waterice",
	"moonrealm:ironore",
	"moonrealm:copperore",
	"moonrealm:goldore",
	"moonrealm:diamondore",
	"moonrealm:light",
	"moonrealm:stonebrick",
	"moonrealm:stoneslab",
	"moonrealm:stonestair",
}

local replacement_item_map = {}
replacement_item_map["weld_all:chemsampler"] = "omg_missions:chemsampler"
replacement_item_map["weld_all:landing_site_marker"] = "omg_missions:landing_site_marker"
for _, name in ipairs(moonrealm_nodes_to_replace) do
	replacement_item_map[name] = "omg_" .. name
end


--replace moonrealm nodes placed in the world
minetest.register_lbm(
{
    label = "Replace occupy moon stuff",

    name = "omg_world:replace_moonrealm_stuff",

    nodenames = moonrealm_nodes_to_replace,

    run_at_every_load = false,

    action = function(pos, node)
		minetest.swap_node(pos, { name = "omg_" .. node.name, param = node.param, param2 = node.param2 })
	end,
})


--replace moonrealm nodes placed in the world
minetest.register_lbm(
{
    label = "Replace weld_all stuff",

    name = "omg_world:replace_weld_all_stuff",

    nodenames = {"weld_all:chemsampler", "weld_all:landing_site_marker"},

    run_at_every_load = false,

    action = function(pos, node)
		if node.name == "weld_all:chemsampler" then
			minetest.swap_node(pos, { name = "omg_missions:chemsampler", param = node.param, param2 = node.param2 })
		elseif node.name == "weld_all:landing_site_marker" then
			minetest.swap_node(pos, { name = "omg_missions:landing_site_marker", param = node.param, param2 = node.param2 })
		end
	end,
})

--replace moonrealm nodes in some chest inventories
minetest.register_lbm(
{
    label = "Replace occupy moon stuff in chests",

    name = "omg_world:replace_moonrealm_stuff_in_chests",

    nodenames = {"scifi_nodes:crate", "scifi_nodes:box", "default:chest", "default:chest_locked"},

    run_at_every_load = false,

    action = function(pos, node)
		local meta = minetest.get_meta(pos)
		if not meta then return end
		local inv = meta:get_inventory()
		if not inv then return end

		local list = inv:get_list("main")
		for i, item in ipairs(list) do
			local item_name = item:get_name()
			if replacement_item_map[item_name] then
				list[i] = ItemStack(replacement_item_map[item_name])
				list[i]:set_count(item:get_count())
			end
		end
		inv:set_list("main", list)
	end,
})

-- replace landing site marker in player inventory
minetest.register_on_joinplayer(function(player) -- stone, dust, waterice, glass
	local inv = player:get_inventory()
	local list = inv:get_list("main")
	for i, item in ipairs(list) do
		local item_name = item:get_name()
		if replacement_item_map[item_name] then
			list[i] = ItemStack(replacement_item_map[item_name])
			list[i]:set_count(item:get_count())
		end
	end
	inv:set_list("main", list)
end)
