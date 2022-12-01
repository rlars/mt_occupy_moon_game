local uranium_params = {
	offset = 0,
	scale = 1,
	spread = {x = 100, y = 100, z = 100},
	seed = 420,
	octaves = 3,
	persist = 0.7
}
local uranium_threshold = 0.55

local chromium_params = {
	offset = 0,
	scale = 1,
	spread = {x = 100, y = 100, z = 100},
	seed = 421,
	octaves = 3,
	persist = 0.7
}
local chromium_threshold = 0.55

local zinc_params = {
	offset = 0,
	scale = 1,
	spread = {x = 100, y = 100, z = 100},
	seed = 422,
	octaves = 3,
	persist = 0.7
}
local zinc_threshold = 0.5

local lead_params = {
	offset = 0,
	scale = 1,
	spread = {x = 100, y = 100, z = 100},
	seed = 423,
	octaves = 3,
	persist = 0.7
}
local lead_threshold = 0.3

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_uranium",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 4,
	clust_size = 3,
	y_min = -300,
	y_max = -80,
	noise_params = uranium_params,
	noise_threshold = uranium_threshold,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_chromium",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 2,
	clust_size = 3,
	y_min = -200,
	y_max = -100,
	noise_params = chromium_params,
	noise_threshold = chromium_threshold,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_chromium",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 6*6*6,
	clust_num_ores = 2,
	clust_size = 3,
	y_min = -31000,
	y_max = -200,
	flags = "absheight",
	noise_params = chromium_params,
	noise_threshold = chromium_threshold,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_zinc",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 5,
	clust_size = 7,
	y_min = -32,
	y_max = 2,
	noise_params = zinc_params,
	noise_threshold = zinc_threshold,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_zinc",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 6*6*6,
	clust_num_ores = 4,
	clust_size = 3,
	y_min = -31000,
	y_max = -32,
	flags = "absheight",
	noise_params = zinc_params,
	noise_threshold = zinc_threshold,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_lead",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -16,
	y_max = 16,
	noise_params = lead_params,
	noise_threshold = lead_threshold,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_lead",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -128,
	y_max = -16,
	noise_params = lead_params,
	noise_threshold = lead_threshold,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "omg_world:mineral_lead",
	wherein = "omg_moonrealm:stone",
	clust_scarcity = 6*6*6,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -31000,
	y_max = -128,
	flags = "absheight",
	noise_params = lead_params,
	noise_threshold = lead_threshold,
})

 -- TODO: sulfur
