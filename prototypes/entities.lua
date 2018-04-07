local entity = generate_arithmetic_combinator{
    type = "constant-combinator",
    name = "fpca",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "fpca"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.65}, {0.35, 0.65}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
	
	item_slot_count = 0,

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    active_energy_usage = "1KW",

    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/combinator.ogg",
        volume = 0.35,
      },
      max_sounds_per_type = 2,
      match_speed_to_activity = true,
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

    activity_led_light =
    {
      intensity = 0.8,
      size = 1,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    activity_led_light_offsets =
    {
      {0.234375, -0.484375},
      {0.5, 0},
      {-0.265625, 0.140625},
      {-0.453125, -0.359375}
    },

    screen_light =
    {
      intensity = 0.3,
      size = 0.6,
      color = {r = 1.0, g = 1.0, b = 1.0}
    },

    screen_light_offsets =
    {
      {0.015625, -0.234375},
      {0.015625, -0.296875},
      {0.015625, -0.234375},
      {0.015625, -0.296875}
    },

    input_connection_bounding_box = {{-0.5, 0}, {0.5, 1}},
    output_connection_bounding_box = {{-0.5, -1}, {0.5, 0}},
	
	circuit_wire_connection_points =
	{
		{
			shadow =
			{
				red = util.by_pixel(7, -6),
				green = util.by_pixel(23, -6),
			},
			wire =
			{
				red = util.by_pixel(-8.5, -17.5),
				green = util.by_pixel(7, -17.5),
			},
		},
		{
			shadow =
			{
				red = util.by_pixel(32, -5),
				green = util.by_pixel(32, 8),
			},
			wire =
			{
				red = util.by_pixel(16, -16.5),
				green = util.by_pixel(16, -3.5),
			},
		},
		{
			shadow =
			{
				red = util.by_pixel(25, 20),
				green = util.by_pixel(9, 20),
			},
			wire =
			{
				red = util.by_pixel(9, 7.5),
				green = util.by_pixel(-6.5, 7.5),
			},
		},
		{
			shadow =
			{
				red = util.by_pixel(1, 11),
				green = util.by_pixel(1, -2),
			},
			wire =
			{
				red = util.by_pixel(-15, -0.5),
				green = util.by_pixel(-15, -13.5),
			},
		},
	},
	
    circuit_wire_max_distance = 9
  }

local recipe = {
    type = "recipe",
    name = "fpca",
    enabled = false,
    ingredients =
    {
      {"copper-cable", 5},
      {"electronic-circuit", 5},
	  {"processing-unit",1}
    },
    result = "fpca"
}

local tech = {
    type = "technology",
    name = "advanced-circuit-network",
    icon = "__base__/graphics/technology/circuit-network.png",
	icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fpca"
      }
    },
    prerequisites = {"circuit-network"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "a-d-e",
}

local item = {
    type = "item",
    name = "fpca",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
	icon_size = 32,
    flags = { "goes-to-quickbar" },
    subgroup = "circuit-network",
    place_result="fpca",
    order = "c[combinators]-d[fpca]",
    stack_size = 50,
  }

data:extend{
entity,
recipe,
tech,
item,}
