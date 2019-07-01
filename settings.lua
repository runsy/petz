local modpath, S = ...

local settings = Settings(modpath .. "/petz.conf")

petz.settings.type_model = settings:get("type_model", "mesh")
petz.settings.tamagochi_mode = settings:get_bool("tamagochi_mode", true)
petz.settings.tamagochi_check_time = tonumber(settings:get("tamagochi_check_time"))
petz.settings.tamagochi_hunger_damage = tonumber(settings:get("tamagochi_hunger_damage"))
petz.settings.tamagochi_check_if_player_online = settings:get_bool("tamagochi_check_if_player_online", true)
--Create a table with safe nodes
local tamagochi_safe_nodes = settings:get("tamagochi_safe_nodes", "")
petz.settings.tamagochi_safe_nodes = tamagochi_safe_nodes:split(", ")
--Air Damage
petz.settings.air_damage = tonumber(settings:get("air_damage"))
--API Type
petz.settings.type_api = settings:get("type_api", "mobs_redo")
--Capture Mobs
petz.settings.rob_mobs = settings:get_bool("rob_mobs", false)
--Spawn Engine
petz.settings.spawn_interval = tonumber(settings:get("spawn_interval"))
petz.settings.max_mobs = tonumber(settings:get("max_mobs"))
--Lay Eggs
petz.settings.lay_egg_chance = tonumber(settings:get("lay_egg_chance"))
--Misc Random Sound Chance
petz.settings.misc_sound_chance = tonumber(settings:get("misc_sound_chance"))
--Lashing
petz.settings.lashing_tame_count = tonumber(settings:get("lashing_tame_count", "3"))
--Mobs Specific
petz.settings.kitty_spawn = settings:get_bool("kitty_spawn", true)
petz.settings.kitty_spawn_chance = tonumber(settings:get("kitty_spawn_chance"))
petz.settings.kitty_spawn_nodes = settings:get("kitty_spawn_nodes", "")
petz.settings.kitty_spawn_biome = settings:get("kitty_spawn_biome", "default")
petz.settings.kitty_follow = settings:get("kitty_follow", "")
petz.settings.puppy_spawn = settings:get_bool("puppy_spawn", true)
petz.settings.puppy_spawn_chance = tonumber(settings:get("puppy_spawn_chance"))
petz.settings.puppy_spawn_nodes = settings:get("puppy_spawn_nodes", "")
petz.settings.puppy_spawn_biome = settings:get("puppy_spawn_biome", "default")
petz.settings.puppy_follow = settings:get("puppy_follow", "")
petz.settings.ducky_spawn = settings:get_bool("ducky_spawn", true)
petz.settings.ducky_spawn_chance = tonumber(settings:get("ducky_spawn_chance"))
petz.settings.ducky_spawn_nodes = settings:get("ducky_spawn_nodes", "")
petz.settings.ducky_spawn_biome = settings:get("ducky_spawn_biome", "default")
petz.settings.ducky_follow = settings:get("ducky_follow", "")
petz.settings.beaver_spawn = settings:get_bool("beaver_spawn", true)
petz.settings.beaver_spawn_chance = tonumber(settings:get("beaver_spawn_chance"))
petz.settings.beaver_spawn_nodes = settings:get("beaver_spawn_nodes", "")
petz.settings.beaver_spawn_biome = settings:get("beaver_spawn_biome", "default")
petz.settings.beaver_follow = settings:get("beaver_follow", "")
petz.settings.beaver_create_dam = settings:get_bool("beaver_create_dam", true)
petz.settings.lamb_spawn = settings:get_bool("lamb_spawn", true)
petz.settings.lamb_spawn_chance = tonumber(settings:get("lamb_spawn_chance"))
petz.settings.lamb_spawn_nodes = settings:get("lamb_spawn_nodes", "")
petz.settings.lamb_spawn_biome = settings:get("lamb_spawn_biome", "default")
petz.settings.lamb_follow = settings:get("lamb_follow", "")
petz.settings.lamb_predators = settings:get("lamb_predators", "")
petz.settings.lion_spawn = settings:get_bool("lion_spawn", true)
petz.settings.lion_spawn_chance = tonumber(settings:get("lion_spawn_chance"))
petz.settings.lion_spawn_nodes = settings:get("lion_spawn_nodes", "")
petz.settings.lion_spawn_biome = settings:get("lion_spawn_biome", "default")
petz.settings.lion_follow = settings:get("lion_follow", "")
petz.settings.lion_preys = settings:get("lion_preys", "")
petz.settings.calf_spawn = settings:get_bool("calf_spawn", true)
petz.settings.calf_spawn_chance = tonumber(settings:get("calf_spawn_chance"))
petz.settings.calf_spawn_nodes = settings:get("calf_spawn_nodes", "")
petz.settings.calf_spawn_biome = settings:get("calf_spawn_biome", "default")
petz.settings.calf_follow = settings:get("calf_follow", "")
petz.settings.calf_predators = settings:get("calf_predators", "")
petz.settings.panda_spawn = settings:get_bool("panda_spawn", true)
petz.settings.panda_spawn_chance = tonumber(settings:get("panda_spawn_chance"))
petz.settings.panda_spawn_nodes = settings:get("panda_spawn_nodes", "")
petz.settings.panda_spawn_biome = settings:get("panda_spawn_biome", "default")
petz.settings.panda_follow = settings:get("panda_follow", "")
petz.settings.frog_spawn = settings:get_bool("frog_spawn", true)
petz.settings.frog_spawn_chance = tonumber(settings:get("frog_spawn_chance"))
petz.settings.frog_spawn_nodes = settings:get("frog_spawn_nodes", "")
petz.settings.frog_spawn_biome = settings:get("frog_spawn_biome", "default")
petz.settings.frog_follow = settings:get("frog_follow", "")
petz.settings.grizzly_spawn = settings:get_bool("grizzly_spawn", true)
petz.settings.grizzly_spawn_chance = tonumber(settings:get("grizzly_spawn_chance"))
petz.settings.grizzly_spawn_nodes = settings:get("grizzly_spawn_nodes", "")
petz.settings.grizzly_spawn_biome = settings:get("grizzly_spawn_biome", "default")
petz.settings.grizzly_follow = settings:get("grizzly_follow", "")
petz.settings.pony_spawn = settings:get_bool("pony_spawn", true)
petz.settings.pony_spawn_chance = tonumber(settings:get("pony_spawn_chance"))
petz.settings.pony_spawn_nodes = settings:get("pony_spawn_nodes", "")
petz.settings.pony_spawn_biome = settings:get("pony_spawn_biome", "default")
petz.settings.pony_follow = settings:get("pony_follow", "")
petz.settings.pony_pregnancy_time = tonumber(settings:get("pony_pregnancy_time"))
petz.settings.pony_growth_time = tonumber(settings:get("pony_growth_time"))
petz.settings.pony_predators = settings:get("pony_predators", "")
petz.settings.parrot_spawn = settings:get_bool("parrot_spawn", true)
petz.settings.parrot_spawn_chance = tonumber(settings:get("parrot_spawn_chance"))
petz.settings.parrot_spawn_nodes = settings:get("parrot_spawn_nodes", "")
petz.settings.parrot_spawn_biome = settings:get("parrot_spawn_biome", "default")
petz.settings.parrot_follow = settings:get("parrot_follow", "")
petz.settings.chicken_spawn = settings:get_bool("chicken_spawn", true)
petz.settings.chicken_spawn_chance = tonumber(settings:get("chicken_spawn_chance"))
petz.settings.chicken_spawn_nodes = settings:get("chicken_spawn_nodes", "")
petz.settings.chicken_spawn_biome = settings:get("chicken_spawn_biome", "default")
petz.settings.chicken_follow = settings:get("chicken_follow", "")
petz.settings.chimp_spawn = settings:get_bool("chimp_spawn", true)
petz.settings.chimp_spawn_chance = tonumber(settings:get("chimp_spawn_chance"))
petz.settings.chimp_spawn_nodes = settings:get("chimp_spawn_nodes", "")
petz.settings.cchimp_spawn_biome = settings:get("chimp_spawn_biome", "default")
petz.settings.chimp_follow = settings:get("chimp_follow", "")
petz.settings.piggy_spawn = settings:get_bool("piggy_spawn", true)
petz.settings.piggy_spawn_chance = tonumber(settings:get("piggy_spawn_chance"))
petz.settings.piggy_spawn_nodes = settings:get("piggy_spawn_nodes", "")
petz.settings.piggy_spawn_biome = settings:get("piggy_spawn_biome", "default")
petz.settings.piggy_follow = settings:get("piggy_follow", "")
petz.settings.pony_predators = settings:get("pony_predators", "")
petz.settings.pigeon_spawn = settings:get_bool("pigeon_spawn", true)
petz.settings.pigeon_spawn_chance = tonumber(settings:get("pigeon_spawn_chance"))
petz.settings.pigeon_spawn_nodes = settings:get("pigeon_spawn_nodes", "")
petz.settings.pigeon_spawn_biome = settings:get("pigeon_spawn_biome", "default")
petz.settings.pigeon_follow = settings:get("pigeon_follow", "")
petz.settings.turtle_spawn = settings:get_bool("turtle_spawn", true)
petz.settings.turtle_spawn_chance = tonumber(settings:get("turtle_spawn_chance"))
petz.settings.turtle_spawn_nodes = settings:get("turtle_spawn_nodes", "")
petz.settings.turtle_spawn_biome = settings:get("turtle_spawn_biome", "default")
petz.settings.turtle_follow = settings:get("turtle_follow", "")
petz.settings.clownfish_spawn = settings:get_bool("clownfish_spawn", true)
petz.settings.clownfish_spawn_chance = tonumber(settings:get("clownfish_spawn_chance"))
petz.settings.clownfish_spawn_nodes = settings:get("clownfish_spawn_nodes", "")
petz.settings.clownfish_spawn_biome = settings:get("clownfish_spawn_biome", "default")
petz.settings.clownfish_follow = settings:get("clownfish_follow", "")
petz.settings.tropicalfish_spawn = settings:get_bool("tropicalfish_spawn", true)
petz.settings.tropicalfish_spawn_chance = tonumber(settings:get("tropicalfish_spawn_chance"))
petz.settings.tropicalfish_spawn_nodes = settings:get("tropicalfish_spawn_nodes", "")
petz.settings.tropicalfish_spawn_biome = settings:get("tropicalfish_spawn_biome", "default")
petz.settings.tropicalfish_follow = settings:get("tropicalfish_follow", "")

if petz.settings.type_model == "mesh" then
    petz.settings.visual = "mesh"
    petz.settings.visual_size = {x=15.0, y=15.0}
    petz.settings.rotate = 0
else -- is 'cubic'
    petz.settings.visual = "wielditem"
    petz.settings.visual_size = {x=1.0, y=1.0}
    petz.settings.rotate = 180
end
