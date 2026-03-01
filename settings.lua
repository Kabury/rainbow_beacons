data:extend({
	{
    type = "bool-setting",
    name = "rb-novanilla",
    setting_type = "startup",
    default_value = true,
    order = "a"
	},
	{
    type = "double-setting",
    name = "rb-modperfullbeacon",
    setting_type = "startup",
    default_value = 1.0,
    minimum_value = 0.0,
    maximum_value = 100.0,
    order = "b"
	},
	{
	type = "int-setting",
	name = "rb-slotsperbeacon",
	setting_type = "startup",
	default_value = 2,
	minimum_value = 0,
	maximum_value = 64,
	order = "c"
	}
})
