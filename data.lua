require("prototypes.items")
require("prototypes.entities")
require("prototypes.recipes")
require("prototypes.technologies")

if settings.startup["rb-novanilla"].value and not mods["pypostprocessing"] then
    data.raw["technology"]["effect-transmission"].hidden=true
    data.raw["recipe"]["beacon"].hidden=true
end

if mods["pypostprocessing"] then
    data.raw["recipe"]["rainbow-beacon-recipe"].ingredients ={
        {type="item", name="steel-plate", amount=5},
        {type="item", name="lab-instrument", amount=1},
        {type="item", name="electronic-circuit", amount=5}
    }
    data.raw["technology"]["rainbow-transmission"].unit.ingredients ={{"automation-science-pack", 2},{"py-science-pack-1", 1}}
    data.raw["technology"]["rainbow-transmission"].prerequisites = {"lab-instrument"}
end

if mods["space-age"] then
    data.raw["recipe"]["rainbow-beacon-recipe"].category="electronics-or-assembling"
end