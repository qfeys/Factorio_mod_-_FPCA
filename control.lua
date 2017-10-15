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
	gui.add({type = "label", name = "entity_name", style = "menu_message_style", caption = {"Field Programmable Combinator Array"}})
	gui.add({type = "flow", name = "main_win", style = "flow_style", direction = "horizontal"})
	gui.main_win.add({type = "flow", name = "io_flow", style = "flow_style", direction = "vertical"})
	gui.main_win.add({type = "flow", name = "code_flow", style = "flow_style", direction = "vertical"})
	for i = 1,16 do
		gui.main_win.code_flow.add({type = "textfield", name = "line_"..i, style = "textfield_style"})
	end
	gui.main_win.add({type = "flow" , name = "help_flow", stye = "flow_style", direction = "vertical"})
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