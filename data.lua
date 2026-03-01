require("prototypes.items")
require("prototypes.entities")
require("prototypes.recipes")
require("prototypes.technologies")

if settings.startup["rb-novanilla"].value then
    data.raw["technology"]["effect-transmission"].hidden=true
    data.raw["recipe"]["beacon"].hidden=true
end

if mods["space-age"] then
    data.raw["recipe"]["rainbow-beacon-recipe"].category="electronics-or-assembling"
end