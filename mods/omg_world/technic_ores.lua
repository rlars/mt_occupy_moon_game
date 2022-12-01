
--local S = technic.worldgen.gettext

minetest.register_node( "omg_world:mineral_uranium", {
	--description = S("Uranium Ore"),
	tiles = { "omg_moonrealm_stone.png^technic_mineral_uranium.png" },
	is_ground_content = true,
	groups = {cracky=3, radioactive=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic:uranium_lump",
})

minetest.register_node( "omg_world:mineral_chromium", {
	--description = S("Chromium Ore"),
	tiles = { "omg_moonrealm_stone.png^technic_mineral_chromium.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic:chromium_lump",
})

minetest.register_node( "omg_world:mineral_zinc", {
	--description = S("Zinc Ore"),
	tiles = { "omg_moonrealm_stone.png^technic_mineral_zinc.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic:zinc_lump",
})

minetest.register_node( "omg_world:mineral_lead", {
	--description = S("Lead Ore"),
	tiles = { "omg_moonrealm_stone.png^technic_mineral_lead.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic:lead_lump",
})

minetest.register_node( "omg_world:mineral_sulfur", {
	--description = S("Sulfur Ore"),
	tiles = { "omg_moonrealm_stone.png^technic_mineral_sulfur.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic:sulfur_lump",
})