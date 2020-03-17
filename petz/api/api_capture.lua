local modpath, S = ...

--
-- Register Egg
--

petz.create_pet = function(placer, itemstack, pet_name, pos)
	local meta = itemstack:get_meta()
	local meta_table = meta:to_table()
	local sdata = minetest.serialize(meta_table)
	local mob = minetest.add_entity(pos, pet_name, sdata)
	local self = mob:get_luaentity()
	if self.is_wild == false then --not monster
		mokapi.set_owner(self, placer:get_player_name()) --set owner
	end
	petz.do_tame(self)
	itemstack:take_item() -- since mob is unique we remove egg once spawned
	return self
end

function petz:register_egg(pet_name, desc, inv_img, tamed)
	local description = S("@1", desc)
	if tamed then
		description = description .." ("..S("Tamed")..")"
	end
	minetest.register_craftitem(pet_name .. "_set", { -- register new spawn egg containing mob information
		description = description,
		inventory_image = inv_img,
		groups = {spawn_egg = 2},
		stack_max = 1,
		on_place = function(itemstack, placer, pointed_thing)
			local spawn_pos = pointed_thing.above
			-- am I clicking on something with existing on_rightclick function?
			local under = minetest.get_node(pointed_thing.under)
			local def = minetest.registered_nodes[under.name]
			if def and def.on_rightclick then
				return def.on_rightclick(pointed_thing.under, under, placer, itemstack)
			end
			if spawn_pos and not minetest.is_protected(spawn_pos, placer:get_player_name()) then
				if not minetest.registered_entities[pet_name] then
					return
				end
				spawn_pos = petz.pos_to_spawn(pet_name, spawn_pos)
				local ent = petz.create_pet(placer, itemstack, pet_name, spawn_pos)
			end
			return itemstack
		end,
	})
end

petz.check_capture_items = function(self, wielded_item_name, clicker, check_inv_room)
	local capture_item_type
	if wielded_item_name == "mobs:lasso" or wielded_item_name == "petz:lasso" then
		capture_item_type = "lasso"
	elseif (wielded_item_name == "mobs:net") or (wielded_item_name == "fireflies:bug_net") then
		capture_item_type = "net"
	else
		return false
	end
	if capture_item_type == self.capture_item then
		if check_inv_room == true then
			--check for room in inventory
			local inv = clicker:get_inventory()
			if inv:room_for_item("main", ItemStack("air")) and self.tamed then
				return true
			else
				minetest.chat_send_player(clicker:get_player_name(), S("The animal has not been tamed or there is not enough room in your inventory."))
				return false
			end
		else
			return true
		end
	else
		return false
	end
end

petz.capture = function(self, clicker, put_in_inventory)
	local new_stack = ItemStack(self.name .. "_set") 	-- add special mob egg with all mob information
	local stack_meta = new_stack:get_meta()
	--local sett ="---TABLE---: "
	--local sett = ""
	--local i = 0
	for key, value in pairs(self) do
		local what_type = type(value)
		if  what_type ~= "function" and what_type ~= "nil" and what_type ~= "userdata" then
			if what_type == "boolean" or what_type == "number" then
				value = tostring(value)
			elseif what_type == "table" then
				if key == "saddlebag_inventory" or key == "genes" or key == "father_genes" or key == "father_veloc_stats" then --only this tables to save serialized
					value = minetest.serialize(value)
					--minetest.chat_send_player("singleplayer", value)
				end
			end
			stack_meta:set_string(key, value)
			--i = i + 1
			--local sett= sett .. ", ".. tostring(key).." : ".. tostring(self[key])
			--minetest.chat_send_player("singleplayer", sett)
		end
	end
	--minetest.chat_send_player("singleplayer", "status="..tostring(self.status))
	stack_meta:set_string("captured", "true") --IMPORTANT! mark as captured
	--minetest.chat_send_player("singleplayer", tostring(i))
	--Info text stuff:
	local info_text = ""
	if not(petz.str_is_empty(self.tag)) then
		info_text = info_text.."\n"..S("Name")..": "..self.tag
	end
	if self.breed then
		local genre
		if self.is_male == true then
			genre = "Male"
		else
			genre = "Female"
		end
		info_text = info_text.."\n"..S("Gender")..": "..S(genre)
	end
	if self.skin_colors then
		info_text = info_text.."\n"..S("Color")..": "..S(petz.first_to_upper(self.skin_colors[self.texture_no]))
	end
	if self.is_mountable then
		info_text = info_text.."\n"..S("Speed Stats")..": " ..self.max_speed_forward.."/"..self.max_speed_reverse.."/"..self.accel
	end
	if self.is_pregnant then
		info_text = info_text.."\n"..S("It is pregnant")
	end
	local description
	if self.description then
		description = self.description
	else
		description = self.type
	end
	stack_meta:set_string("description", S(petz.first_to_upper(description)).." ("..S("Tamed")..")"..info_text)
	if put_in_inventory == true then
		local inv = clicker:get_inventory()
		if inv:room_for_item("main", new_stack) then
			inv:add_item("main", new_stack)
		else
			minetest.add_item(clicker:get_pos(), new_stack)
		end
	end
	if self.type == "bee" and self.behive then
		petz.decrease_total_bee_count(self.behive)
		local meta, honey_count, bee_count = petz.get_behive_stats(self.behive)
		petz.set_infotext_behive(meta, honey_count, bee_count)
	end
	petz.remove_petz_list_by_owner(self, false)
	mokapi.remove_mob(self)
	return stack_meta
end
