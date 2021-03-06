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
	gui.add({type = "label", name = "entity_name", style = "large_caption_label", caption = "Field Programmable Combinator Array"})
	gui.add({type = "flow", name = "main_win", style = "horizontal_flow", direction = "horizontal"})
	--1st collom: IO
	gui.main_win.add({type = "flow", name = "io_flow", style = "vertical_flow", direction = "vertical"})
	for i = 1,4 do
		gui.main_win.io_flow.add({type = "flow", name = "io_"..i, stye = "horizontal_flow", direction = "horizontal"})
		gui.main_win.io_flow["io_"..i].add({type = "choose-elem-button", name = "io_"..i.."_in", elem_type = "signal"})
		gui.main_win.io_flow["io_"..i].add({type = "label", name = "io_"..i.."_value", style = "bold_label", caption = "00"})
		gui.main_win.io_flow["io_"..i].add({type = "choose-elem-button", name = "io_"..i.."_out", elem_type = "signal"})
		gui.main_win.io_flow["io_"..i].add({type = "label", name = "io_"..i.."_name", style = "caption_label", caption = "A"})
	end
	gui.main_win.io_flow.io_1.io_1_name.caption = "IOA"
	gui.main_win.io_flow.io_2.io_2_name.caption = "IOB"
	gui.main_win.io_flow.io_3.io_3_name.caption = "IOC"
	gui.main_win.io_flow.io_4.io_4_name.caption = "IOD"
	--2nd collom: code
	gui.main_win.add({type = "flow", name = "code_flow", style = "vertical_flow", direction = "vertical"})
	for i = 1,16 do
		gui.main_win.code_flow.add({type = "textfield", name = "line_"..i, style = "textfield"})
	end
	--3rd collom: mem & butons
	gui.main_win.add({type = "flow", name = "mem_flow", stye = "vertical_flow", direction = "vertical"})
	gui.main_win.mem_flow.add({type = "label", name = "clk_name", stye = "caption_label", caption = "CLK"})
	gui.main_win.mem_flow.add({type = "label", name = "clk_value", stye = "label", caption = "00"})
	gui.main_win.mem_flow.add({type = "label", name = "memA_name", stye = "caption_label", caption = "MEA"})
	gui.main_win.mem_flow.add({type = "label", name = "memA_value", stye = "label", caption = "00"})
	gui.main_win.mem_flow.add({type = "label", name = "memB_name", stye = "caption_label", caption = "MEB"})
	gui.main_win.mem_flow.add({type = "label", name = "memB_value", stye = "label", caption = "00"})
	gui.main_win.mem_flow.add({type = "button", name = "test_err_but", style = "button", caption = "Test Errors"})
	gui.main_win.mem_flow.add({type = "button", name = "run_but", style = "button", caption = "Run"})
	gui.main_win.mem_flow.add({type = "button", name = "close_but", style = "button", caption = "Close"})
	--4th collom: help
	gui.main_win.add({type = "flow" , name = "help_flow", stye = "vertical_flow", direction = "vertical"})
	gui.main_win.help_flow.add({type = "label", name = "help_1", style = "bold_label", caption = "Available commands"})
	gui.main_win.help_flow.add({type = "label", name = "help_2", style = "label", caption = "SLC: select memory"})
	gui.main_win.help_flow.add({type = "label", name = "help_3", style = "label", caption = "LOD: load into memory"})
	gui.main_win.help_flow.add({type = "label", name = "help_4", style = "label", caption = "SET: Set with memory"})
	gui.main_win.help_flow.add({type = "label", name = "help_5", style = "label", caption = "ADD: add to memory"})
	gui.main_win.help_flow.add({type = "label", name = "help_6", style = "label", caption = "SUB: subtract from memory"})
	gui.main_win.help_flow.add({type = "label", name = "help_7", style = "label", caption = "MUL: multiply memory with"})
	gui.main_win.help_flow.add({type = "label", name = "help_8", style = "label", caption = "GTO: go to specified mark"})
	gui.main_win.help_flow.add({type = "label", name = "help_9", style = "label", caption = "MRK: mark, see GTO"})
	gui.main_win.help_flow.add({type = "label", name = "help_10", style = "label", caption = "CPR: compare with memory"})
	gui.main_win.help_flow.add({type = "label", name = "help_11", style = "label", caption = "RST: reset clock"})
	gui.main_win.help_flow.add({type = "label", name = "help_a0", style = "bold_label", caption = "Available variables"})
	gui.main_win.help_flow.add({type = "label", name = "help_a1", style = "label", caption = "MEA: memory A"})
	gui.main_win.help_flow.add({type = "label", name = "help_a2", style = "label", caption = "MEB: memory B"})
	gui.main_win.help_flow.add({type = "label", name = "help_a3", style = "label", caption = "IOA: in/output gate A"})
	gui.main_win.help_flow.add({type = "label", name = "help_a4", style = "label", caption = "IOB: in/output gate B"})
	gui.main_win.help_flow.add({type = "label", name = "help_a5", style = "label", caption = "IOC: in/output gate C"})
	gui.main_win.help_flow.add({type = "label", name = "help_a6", style = "label", caption = "IOD: in/output gate D"})
	gui.main_win.help_flow.add({type = "label", name = "help_a7", style = "label", caption = "CLK: current clock value"})
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


function fpca.on_button_click(event)
	local element = event.element
	if element.name and element.name == "test_err_but" then
		
	elseif element.name and element.name == "run_but" then
		
	elseif element.name and element.name == "close_but" then
		fpca.delete_gui(event.player_index)
	end
end


script.on_event(defines.events.on_gui_click, fpca.on_button_click)
script.on_event(defines.events.on_tick, tick)