local modpath, S = ...

--Ducky/Chicken Eggs

minetest.register_craftitem("petz:ducky_egg", {
    description = S("Ducky Egg"),
    inventory_image = "petz_ducky_egg.png",
    wield_image = "petz_ducky_egg.png",
    on_use = minetest.item_eat(2),
    groups = {flammable = 2, food = 2, food_egg = 1},
})

minetest.register_craftitem("petz:chicken_egg", {
    description = S("Chicken Egg"),
    inventory_image = "petz_chicken_egg.png",
    wield_image = "petz_chicken_egg.png",
    on_use = minetest.item_eat(2),
    groups = {flammable = 2, food = 2, food_egg = 1},
})

minetest.register_craftitem("petz:penguin_egg", {
    description = S("Penguin Egg"),
    inventory_image = "petz_penguin_egg.png",
    wield_image = "petz_penguin_egg.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_egg = 1},
})

minetest.register_craftitem("petz:fried_egg", {
	description = S("Fried Egg"),
	inventory_image = "petz_fried_egg.png",
	on_use = minetest.item_eat(4),
	groups = {flammable = 2, food = 2, food_egg_fried = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:fried_egg",
	recipe = "group:food_egg",
	cooktime = 2,
})

minetest.register_craftitem("petz:fried_egg_bacon", {
	description = S("Fried Egg and Bacon"),
	inventory_image = "petz_fried_egg_bacon.png",
	on_use = minetest.item_eat(6),
	groups = {flammable = 2, food = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "petz:fried_egg_bacon",
    recipe = {"group:food_egg_fried", "petz:roasted_porkchop"},
})

--Frog Leg and Roasted Frog Leg
minetest.register_craftitem("petz:frog_leg", {
    description = S("Frog Leg"),
    inventory_image = "petz_frog_leg.png",
    wield_image = "petz_frog_leg.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:frog_leg_roasted", {
	description = S("Roasted Frog Leg"),
	inventory_image = "petz_frog_leg_roasted.png",
	on_use = minetest.item_eat(3),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:frog_leg_roasted",
	recipe = "petz:frog_leg",
	cooktime = 2,
})

--Parrot Food
minetest.register_craftitem("petz:raw_parrot", {
    description = S("Raw Parrot"),
    inventory_image = "petz_raw_parrot.png",
    wield_image = "petz_raw_parrot.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:roasted_parrot", {
	description = S("Roasted Parrot"),
	inventory_image = "petz_roasted_parrot.png",
	on_use = minetest.item_eat(2),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:roasted_parrot",
	recipe = "petz:raw_parrot",
	cooktime = 2,
})

--Chicken Food
minetest.register_craftitem("petz:raw_chicken", {
    description = S("Raw Chicken"),
    inventory_image = "petz_raw_chicken.png",
    wield_image = "petz_raw_chicken.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:chicken_legs", {
    description = S("Chicken Legs"),
    inventory_image = "petz_chicken_legs.png",
    wield_image = "petz_chicken_legs.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "petz:chicken_legs",
    recipe = {"petz:raw_chicken"},
})

minetest.register_craftitem("petz:roasted_chicken_legs", {
	description = S("Roasted Chicken Legs"),
	inventory_image = "petz_roasted_chicken_legs.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craftitem("petz:chicken_legs_bucket", {
	description = S("Chicken Legs Bucket"),
	inventory_image = "petz_chicken_legs_bucket.png",
	stack_max = 1,
	on_use = function (itemstack, user, pointed_thing)
        return minetest.do_item_eat(12, "bucket:bucket_empty", itemstack, user, pointed_thing)
    end,
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "petz:chicken_legs_bucket",
    recipe = {"petz:roasted_chicken_legs", "petz:roasted_chicken_legs",
				"petz:roasted_chicken_legs", "bucket:bucket_empty"
    },
})

minetest.register_craft({
	type = "shapeless",
	output = "petz:roasted_chicken_legs 3",
    recipe = {"petz:chicken_legs_bucket"},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:roasted_chicken_legs",
	recipe = "petz:chicken_legs",
	cooktime = 3,
})

minetest.register_craftitem("petz:roasted_chicken", {
	description = S("Roasted Chicken"),
	inventory_image = "petz_roasted_chicken.png",
	on_use = minetest.item_eat(3),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:roasted_chicken",
	recipe = "petz:raw_chicken",
	cooktime = 2,
})

--Piggy Porkchop
minetest.register_craftitem("petz:raw_porkchop", {
    description = S("Raw Porkchop"),
    inventory_image = "petz_raw_porkchop.png",
    wield_image = "petz_raw_porkchop.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:roasted_porkchop", {
	description = S("Roasted Porkchop"),
	inventory_image = "petz_roasted_porkchop.png",
	on_use = minetest.item_eat(3),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:roasted_porkchop",
	recipe = "petz:raw_porkchop",
	cooktime = 3,
})

--Lamb
minetest.register_craftitem("petz:mini_lamb_chop", {
    description = S("Mini Lamb Chop"),
    inventory_image = "petz_mini_lamb_chop.png",
    wield_image = "petz_mini_lamb_chop.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:roasted_lamb_chop", {
	description = S("Roasted Lamb Chop"),
	inventory_image = "petz_roasted_lamb_chop.png",
	on_use = minetest.item_eat(3),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:roasted_lamb_chop",
	recipe = "petz:mini_lamb_chop",
	cooktime = 3,
})

--Beef
minetest.register_craftitem("petz:beef", {
    description = S("Beef"),
    inventory_image = "petz_beef.png",
    wield_image = "petz_beef.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:steak", {
	description = S("Beef Steak"),
	inventory_image = "petz_steak.png",
	on_use = minetest.item_eat(3),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:steak",
	recipe = "petz:beef",
	cooktime = 2,
})

--Ducky
minetest.register_craftitem("petz:raw_ducky", {
    description = S("Raw Ducky"),
    inventory_image = "petz_raw_ducky.png",
    wield_image = "petz_raw_ducky.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:roasted_ducky", {
	description = S("Roasted Ducky"),
	inventory_image = "petz_roasted_ducky.png",
	on_use = minetest.item_eat(3),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:roasted_ducky",
	recipe = "petz:raw_ducky",
	cooktime = 2,
})

--Cheese (from Milk)
minetest.register_craftitem("petz:cheese", {
	description = S("Cheese"),
	inventory_image = "petz_cheese.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2, food = 2, food_cheese = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:cheese",
	recipe = "petz:bucket_milk",
	cooktime = 4,
	replacements = {{ "group:food_milk", "bucket:bucket_empty"}},
})

minetest.register_alias("petz:cheese", "mobs:cheese")

minetest.register_craftitem("petz:blueberry_cheese_cake", {
	description = S("Blueberry Cheese Cake"),
	inventory_image = "petz_blueberry_cake.png",
	on_use = minetest.item_eat(6),
	groups = {flammable = 2, food = 2, food_cheese = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "petz:blueberry_cheese_cake",
    recipe = {"default:blueberries", "farming:wheat", "group:food_cheese", "group:food_egg"},
})

minetest.register_craftitem("petz:blueberry_ice_cream", {
	description = S("Blueberry Ice Cream"),
	inventory_image = "petz_blueberry_ice_cream.png",
	on_use = minetest.item_eat(7),
	groups = {flammable = 2, food = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "petz:blueberry_ice_cream 3",
    recipe = {"group:food_blueberries", "group:food_milk", "group:food_egg", "default:snow", "group:food_egg", "default:snow", "farming:wheat"},
    replacements = {{"group:food_milk", "bucket:bucket_empty"}},
})

minetest.register_craftitem("petz:blueberry_muffin", {
	description = S("Blueberry Muffin"),
	inventory_image = "petz_blueberry_muffin.png",
	on_use = minetest.item_eat(4),
	groups = {flammable = 2, food = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "petz:blueberry_muffin 8",
    recipe = {"group:food_blueberries", "farming:wheat", "farming:wheat", "group:food_egg", "group:food_egg", "default:paper", "group:food_milk"},
    replacements = {{"group:food_milk", "bucket:bucket_empty"}},
})

--Christmas 2019 Update

minetest.register_craftitem("petz:gingerbread_cookie", {
	description = S("Gingerbread Cookie"),
	inventory_image = "petz_gingerbread_cookie.png",
	on_use = minetest.item_eat(8),
	groups = {flammable = 2, food = 2},
})

minetest.register_craftitem("petz:candy_cane", {
	description = S("Candy Cane"),
	inventory_image = "petz_candy_cane.png",
	on_use = minetest.item_eat(6),
	groups = {flammable = 2, food = 2},
})

--Goat Meat
minetest.register_craftitem("petz:raw_goat", {
    description = S("Raw Goat"),
    inventory_image = "petz_raw_goat.png",
    on_use = minetest.item_eat(1),
    groups = {flammable = 2, food = 2, food_meat_raw = 1},
})

minetest.register_craftitem("petz:roasted_goat_meat", {
	description = S("Roasted Goat Meat"),
	inventory_image = "petz_roasted_goat_meat.png",
	on_use = minetest.item_eat(4),
	groups = {flammable = 2, food = 2, food_meat = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "petz:roasted_goat_meat",
	recipe = "petz:raw_goat",
	cooktime = 3,
})
