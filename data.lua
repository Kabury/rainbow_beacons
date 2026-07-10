local meld = require("meld")
require("prototypes.items")
require("prototypes.base_beacon")
require("prototypes.color_beacons")
require("prototypes.recipes_vanilla")
require("prototypes.technologies_vanilla")

if mods["pypostprocessing"] then
  require("prototypes.recipes_pyanodon")
  require("prototypes.technologies_pyanodon")
end

if mods["space-age"] then
  meld.meld(data.raw["recipe"]["rainbow-beacon"],{categories={"electronics-or-assembling"}})
end

if settings.startup["rb-novanilla"].value then
    data.raw["technology"]["effect-transmission"].hidden=true
    data.raw["recipe"]["beacon"].hidden=true
end
