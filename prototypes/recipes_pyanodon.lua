local meld = require("meld")

local recipe = {
  ingredients = meld.overwrite(
  {
    { type = "item", name = "steel-plate", amount = 5 },
    { type = "item", name = "lab-instrument", amount = 1 },
    { type = "item", name = "electronic-circuit", amount = 5 }
  }
  )
}

meld.meld(data.raw["recipe"]["rainbow-beacon"], recipe)
