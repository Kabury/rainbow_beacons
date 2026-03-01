data:extend({
  {
    type = "recipe",
    name = "rainbow-beacon-recipe",
    icon = "__rainbow_beacons__/graphics/icons/beacon7.png",
    icon_size = 64,
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {type="item", name="steel-plate", amount=5},
      {type="item", name="advanced-circuit", amount=5},
      {type="item", name="electronic-circuit", amount=5}
    },
    results = {{type="item", name="rainbow-beacon", amount=1}},
    localised_name = {"recipe-name.rainbow-beacon"}
  }
})
