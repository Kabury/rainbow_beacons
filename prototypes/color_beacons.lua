local beacon_power = settings.startup["rb-modperfullbeacon"].value
local slots_per_beacon_level = settings.startup["rb-slotsperbeacon"].value


local meld = require("meld")

local beacon_red = {
  name = "1-color-beacon",
  distribution_effectivity = (beacon_power / slots_per_beacon_level) / 1,
  energy_usage = "1MW",
  graphics_set = 
  {
    animation_list = 
    {
      [2] = 
      {
        animation = 
        { filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna1.png" }
      }
    }
  },
  icon = "__rainbow_beacons__/graphics/icons/beacon1.png",
  module_slots = slots_per_beacon_level * 1,
  supply_area_distance = 2 ^ 1 - 1
}
local beacon_orange = {
  name = "2-color-beacon",
  distribution_effectivity = (beacon_power / slots_per_beacon_level) / 2,
  energy_usage = "2MW",
  graphics_set = 
  {
    animation_list = 
    {
      [2] = 
      {
        animation = 
        { filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna2.png" }
      }
    }
  },
  icon = "__rainbow_beacons__/graphics/icons/beacon2.png",
  module_slots = slots_per_beacon_level * 2,
  supply_area_distance = 2 ^ 2 - 1
}
local beacon_yellow = {
  name = "3-color-beacon",
  distribution_effectivity = (beacon_power / slots_per_beacon_level) / 3,
  energy_usage = "3MW",
  graphics_set = 
  {
    animation_list = 
    {
      [2] = 
      {
        animation = 
        { filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna3.png" }
      }
    }
  },
  icon = "__rainbow_beacons__/graphics/icons/beacon3.png",
  module_slots = slots_per_beacon_level * 3,
  supply_area_distance = 2 ^ 3 - 1
}
local beacon_green = {
  name = "4-color-beacon",
  distribution_effectivity = (beacon_power / slots_per_beacon_level) / 4,
  energy_usage = "4MW",
  graphics_set = 
  {
    animation_list = 
    {
      [2] = 
      {
        animation = 
        { filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna4.png" }
      }
    }
  },
  icon = "__rainbow_beacons__/graphics/icons/beacon4.png",
  module_slots = slots_per_beacon_level * 4,
  supply_area_distance = 2 ^ 4 - 1
}
local beacon_blue = {
  name = "5-color-beacon",
  distribution_effectivity = (beacon_power / slots_per_beacon_level) / 5,
  energy_usage = "5MW",
  graphics_set = 
  {
    animation_list = 
    {
      [2] = 
      {
        animation = 
        { filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna5.png" }
      }
    }
  },
  icon = "__rainbow_beacons__/graphics/icons/beacon5.png",
  module_slots = slots_per_beacon_level * 5,
  supply_area_distance = 2 ^ 5 - 1
}
local beacon_purple = {
  name = "6-color-beacon",
  distribution_effectivity = (beacon_power / slots_per_beacon_level) / 6,
  energy_usage = "6MW",
  graphics_set = 
  {
    animation_list = 
    {
      [2] = 
      {
        animation = 
        { filename = "__rainbow_beacons__/graphics/entity/beacon/beacon-antenna6.png" }
      }
    }
  },
  icon = "__rainbow_beacons__/graphics/icons/beacon6.png",
  module_slots = slots_per_beacon_level * 6,
  supply_area_distance = 2 ^ 6 - 1
}

data:extend({
  meld.meld(table.deepcopy(data.raw["beacon"]["1-color-beacon"]), beacon_red),
  meld.meld(table.deepcopy(data.raw["beacon"]["1-color-beacon"]), beacon_orange),
  meld.meld(table.deepcopy(data.raw["beacon"]["1-color-beacon"]), beacon_yellow),
  meld.meld(table.deepcopy(data.raw["beacon"]["1-color-beacon"]), beacon_green),
  meld.meld(table.deepcopy(data.raw["beacon"]["1-color-beacon"]), beacon_blue),
  meld.meld(table.deepcopy(data.raw["beacon"]["1-color-beacon"]), beacon_purple),
})
