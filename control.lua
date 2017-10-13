if not fpca then fpca = {} end


script.on_init(function(event)
	for i, player in pairs(game.players) do
		fpca.create_global_table(player.index)
	end
end)

function fpca.create_global_table(player_index)
	if not global then global = {} end
	if not global.fpca then global.fpca = {} end
	if not global.fpca[player_index] then global.fpca[player_index] = {} end
end

script.on_event("fpca-open-gui", function(event)
	local player = game.players[event.player_index]
	local entity = player.selected
	if entity and entity.name == "fpca" and player.can_reach_entity(entity) then
		fpca.open_gui(entity, player)
	else
		fpca.delete_gui(event.player_index)
	end
end)

function fpca.open_gui(entity,player)
	fpca.delete_gui(player.index)
	local globtable = global.fpca[player.index]
	globtable.entity = entity
	local gui = player.gui.center.add({type = "frame", name = "fpca_gui", direction = "vertical"})
	globtable.gui = gui
	gui.add({type = "label", name = "entity_name", style = "tutorial_notice_name_label_style", caption = {"Field Programmable Combinator Array"}})
end

function fpca.delete_gui(player_index)
	local globtable = global.fpca[player_index]
	if globtable then
		--if globtable.gui and globtable.gui.valid then globtable.gui.destroy() end
		if globtable.gui then globtable.gui.destroy() end
		globtable.entity = nil
		globtable.gui = nil
	end
end