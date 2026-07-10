data:extend(
{
  {
    type = "technology",
    name = "rainbow-transmission",
    effects = 
    {
      { type = "unlock-recipe", recipe = "rainbow-beacon" }
    },
    icons = 
    {
      { icon = "__rainbow_beacons__/graphics/tech/tw-tech.png", icon_size = 256 }
    },
    prerequisites = { "modules" },
    unit = 
    {
      count = 300,
      ingredients = 
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 }
      },
      time = 30
    }
  }
}
)