local rainbow_effects = {"consumption", "speed", "pollution"}
local colornames = {}
local indexes = {1,2,3,4,5,6}
local scaler = 1

for k, v in pairs(indexes) do
  table.insert(colornames,v.."-color-beacon")
end

local template = {
  -- Thanks to Defi for the graphics fix
  type = "beacon",
  name = "RainbowBeaconBase",
  icon = "__rainbow_beacons__/graphics/icons/beacon.png",
  icon_size = 64,
  flags = {"placeable-player", "player-creation"},
  minable = {mining_time = 1, results = {{type = "item", name = "rainbow-beacon", amount = 1}}},
  max_health = 200,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-2.45, -2.45}, {2.45, 2.45}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  allowed_effects = rainbow_effects,
  profile = {1,0},
  graphics_set={
    animation_list={
      {
      animation =
      {
        filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-base.png",
        width = 193,
        height = 155,
        shift = { 0.7 * scaler, 0.1 * scaler},
        scale = scaler
      }
      },
      {animation =
      {
        filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna.png",
        width = 90,
        height = 83,
        line_length = 8,
        frame_count = 32,
        shift = { 0.06 * scaler, -2.85 * scaler},
        animation_speed = 0.5,
        scale = scaler
      }
      },
      {animation =
      {
        filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna-shadow.png",
        width = 105,
        height = 82,
        line_length = 8,
        frame_count = 32,
        shift = { 5.34 * scaler, 0.8 * scaler},
        animation_speed = 0.5,
        scale = scaler
      }
      },
    }
  },
  radius_visualisation_picture =
  {
    filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-radius-visualization.png",
    width = 10,
    height = 10
  },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input"
  },
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  module_specification =
  {
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3
  },
  placeable_by = {item = "rainbow-beacon", count = 1},
  fast_replaceable_group = "color-beacons",
  additional_pastable_entities = colornames,
  beacon_counter = "same_type",
  supply_area_distance = 0,
  energy_usage = "500kW",
  distribution_effectivity = 0,
  module_slots = 0
}
local res = settings.startup["rb-modperfullbeacon"].value
local den = settings.startup["rb-slotsperbeacon"].value

for k, v in pairs(indexes) do
  local colorbeacon = table.deepcopy(template)
  colorbeacon.name = v.."-color-beacon"
  colorbeacon.graphics_set.animation_list[2].animation.filename="__rainbow_beacons__/graphics/entity/beacon/beacon-antenna"..v..".png"
  colorbeacon.icon = "__rainbow_beacons__/graphics/icons/beacon"..v..".png"
  colorbeacon.supply_area_distance= 2 ^ v - 1
  colorbeacon.energy_usage=v.."MW"
  colorbeacon.distribution_effectivity = (res / den) / v
  colorbeacon.module_slots = den * v
  data:extend({colorbeacon})
end

