-----Initialise data
local suffix = "-color-beacon" --ab
local colors = {"Red", "Orange", "Yellow", "Green", "Blue", "Purple"}
local rb_beacons = {}
local indexes = {1,2,3,4,5,6}
for k, v in pairs(indexes) do
    rb_beacons[v..suffix] = true
end 

-----Function
local function colorize_beacon(entity, new_name, player_index)
    if not (entity and entity.valid) then return end
    
    local is_ghost = entity.type == "entity-ghost"
    local current_name = is_ghost and entity.ghost_name or entity.name
    
    if current_name == new_name then return end

    -- cache entity data
    local surface = entity.surface
    local pos = entity.position
    local force = entity.force
    local qual = entity.quality
    local mineable_name = nil
    
    if not is_ghost and entity.prototype.mineable_properties.products then
        local product = entity.prototype.mineable_properties.products[1]
        mineable_name = product and (product.name or product[1])
    end

    -- The replacement happens here (original entity becomes invalid)
    local new_entity = surface.create_entity{
        name = is_ghost and "entity-ghost" or new_name,
        inner_name = is_ghost and new_name or nil,
        position = pos,
        force = force,
        quality = qual,
        player = player_index,
        fast_replace = true,
        create_build_effect_smoke = false,
        raise_built = true
    }
    
    -- Handle item cost using the cached name
    if not is_ghost and player_index and new_entity and mineable_name then
        local cur = game.get_player(player_index).cursor_stack
        if cur and cur.valid_for_read and cur.name == "rainbow-beacon" then
            cur.count = cur.count - 1
        else
            local inv = game.get_player(player_index).get_main_inventory()
            if inv then
                inv.remove({name = mineable_name, amount = 1, quality = qual})
            end
        end
    end

    return new_entity
end

-----Events
script.on_init(function()
    storage.pending_color = {}
end)

script.on_event(defines.events.on_pre_build, function(event)
    local player = game.get_player(event.player_index)
    local ghost = player.surface.find_entity("entity-ghost", event.position)
    if ghost and rb_beacons[ghost.ghost_name] then
        storage.pending_color[event.player_index] = ghost.ghost_name
    end
end)

script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity}, function(event)
    local entity = event.entity
    if not (entity and entity.valid and entity.type == "beacon") then return end
    local ghost_name = storage.pending_color[event.player_index]
    if ghost_name then
        colorize_beacon(entity, ghost_name, event.player_index)
        storage.pending_color[event.player_index] = nil
    end
end)

script.on_event(defines.events.on_gui_opened, function(event)
    if event.gui_type ~= defines.gui_type.entity or not event.entity then return end
    
    local entity = event.entity
    local is_ghost = entity.type == "entity-ghost"
    local name = is_ghost and entity.ghost_name or entity.name

    if not rb_beacons[name] then return end

    local player = game.get_player(event.player_index)
    if player.gui.relative.rb_menu then
        player.gui.relative.rb_menu.destroy()
    end

    local frame = player.gui.relative.add{
        type = "frame",
        name = "rb_menu",
        caption = { "gui-element.gui-title" },
        anchor = {
            gui = is_ghost and defines.relative_gui_type.ghost_gui or defines.relative_gui_type.beacon_gui,
            position = defines.relative_gui_position.right
        },
        direction = "vertical"
    }

    listbox = frame.add{
        type = "drop-down",
        name = "rb_list",
        items = colors,
        selected_index = tonumber(name:match("%d+")) or 0
    }
    listbox.style.minimal_width=0

end)

script.on_event(defines.events.on_gui_selection_state_changed, function(event)
    if event.element.name ~= "rb_list" then return end
    
    local player = game.get_player(event.player_index)
    local beacon = player.opened
    local frame = event.element.parent
    
    if not (beacon and beacon.valid and frame.rb_list) then return end

    local new_name = frame.rb_list.selected_index .. suffix
    newentity = colorize_beacon(beacon, new_name, event.player_index)
    player.opened = newentity
end)

script.on_event(defines.events.on_entity_settings_pasted, function(event)
    local s, d = event.source, event.destination
    if not (s and d and s.valid and d.valid) then return end
    
    local s_name = (s.type == "entity-ghost") and s.ghost_name or s.name
    local d_name = (d.type == "entity-ghost") and d.ghost_name or d.name

    if rb_beacons[s_name] and rb_beacons[d_name] then
        colorize_beacon(d, s_name, event.player_index)
    end
end)
