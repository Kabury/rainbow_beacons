local meld = require("meld")

local beacon_base = {
  name = "1-color-beacon",
  additional_pastable_entities = 
  {
    "1-color-beacon",
    "2-color-beacon",
    "3-color-beacon",
    "4-color-beacon",
    "5-color-beacon",
    "6-color-beacon"
  },
  allowed_effects = { "consumption", "speed", "pollution" },
  collision_box = {
    { -2.45, -2.45 },
    { 2.45, 2.45 }
  },
  fast_replaceable_group = "color-beacons",
  graphics_set = meld.overwrite(
  {
    animation_list =
    {
      {animation={filename="__rainbow_beacons__/graphics/entity/beacon/beacon-base.png",width=193,height=155,shift={0.7,0.1}}},
      {animation={filename="__rainbow_beacons__/graphics/entity/beacon/beacon-antenna.png",width=90,height=83,line_length=8,frame_count=32,shift={0.06,-2.85},animation_speed=0.5}},
      {animation={filename="__rainbow_beacons__/graphics/entity/beacon/beacon-antenna-shadow.png",width=105,height=82,line_length=8,frame_count=32,shift={5.34,0.8},animation_speed=0.5}},
    }
  }
  )  
  ,
  icon = "__rainbow_beacons__/graphics/icons/beacon1.png",
  icon_size = 64,
  minable = 
  {
    mining_time = 1,
    results = 
    {
      { type = "item", name = "rainbow-beacon", amount = 1 }
    }
  },
  placeable_by = { count = 1, item = "rainbow-beacon" },
  profile = { 1, 0 },
  selection_box = {
    { -2.5, -2.5 },
    { 2.5, 2.5 }
  }
}

data:extend({
  meld.meld(table.deepcopy(data.raw["beacon"]["beacon"]), beacon_base),
})
