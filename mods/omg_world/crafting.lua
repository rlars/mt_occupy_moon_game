
minetest.register_craft({
	type = "shapeless",
	output = "default:dirt 2",
	recipe = {"omg_moonrealm:dust", "farming:wheat", "default:gravel"},
})

minetest.register_craft({
	output = "default:gravel",
	recipe = {{"omg_moonrealm:stone"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:silver_sand 2",
	recipe = {"omg_moonrealm:dust", "default:gravel"},
})
