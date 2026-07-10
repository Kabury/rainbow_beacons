local meld = require("meld")

local technology = {
  prerequisites = meld.overwrite({ "lab-instrument" }),
  unit =     {
      ingredients = meld.overwrite(
      {
        { "automation-science-pack", 2 },
        { "py-science-pack-1", 1 }
      })
    }
    
}

meld.meld(data.raw["technology"]["rainbow-transmission"], technology)
