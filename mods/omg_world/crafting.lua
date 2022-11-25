
minetest.register_craft({
	type = "shapeless",
	output = "default:dirt 2",
	recipe = {"moonrealm:dust", "farming:wheat", "default:gravel"},
})

minetest.register_craft({
	output = "default:gravel",
	recipe = {{"moonrealm:stone"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:silver_sand 2",
	recipe = {"moonrealm:dust", "default:gravel"},
})
