
local function create_textlist_content()
	local textlist_content = ""
	for i, help_entry in ipairs(help_descriptions) do
		textlist_content = textlist_content .. "#161616" .. help_entry.title
		if i < #help_descriptions then textlist_content = textlist_content .. "," end
	end
	return textlist_content
end

function show_help(player, index)
    index = index or 1
	local formspec = "formspec_version[2]size[14,8]"..
	"style_type[*;textcolor=#161616]"..
	"background9[-.5,-.5;15,9;omg_world_inventory_bg.png;false;32]"..
	"style_type[label;font_size=*1.5]"..
	"label[0.2,0.2;Help topics]"..
	"style_type[textlist;font_size=*1.2]"..
	"textlist[0.2,0.7;3,5;help_topic_list;"..create_textlist_content()..";".. index .. ";true]"
	if help_descriptions[index].node then
		formspec = formspec .. "item_image[11,0;2,2;" .. help_descriptions[index].node .."]"
	elseif help_descriptions[index].image then
		formspec = formspec .. "image[9,0;4,2;" .. help_descriptions[index].image .."]"
	end
	
	formspec = formspec .. "label[4,1.2;" .. help_descriptions[index].title .. "]".. 
	"textarea[4,2;8,5;;" .. help_descriptions[index].description ..";]"

	minetest.show_formspec(player:get_player_name(), "omg_world:help", formspec)
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields["help"] then
		show_help(player, 1)
		return true
	elseif fields["help_topic_list"] then
		local selection = minetest.explode_textlist_event(fields["help_topic_list"])
		if selection.type == "CHG" or selection.type == "DCL" then
			show_help(player, selection.index)
		end
	end
end)