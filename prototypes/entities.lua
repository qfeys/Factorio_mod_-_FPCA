  
local entity = {
    type = "constant-combinator",
    name = "fpca",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "fpca"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.65}, {0.35, 0.65}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
	icon_size = 32,

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

    sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 158,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 237,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/combinator-entities.png",
        x = 79,
        width = 79,
        height = 63,
        frame_count = 1,
        shift = {0.140625, 0.140625},
      }
    },

    activity_led_sprites =
    {
      north =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-N.png",
        width = 11,
        height = 11,
        frame_count = 1,
        shift = {0.234375, -0.484375},
      },
      east =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-E.png",
        width = 10,
        height = 10,
        frame_count = 1,
        shift = {0.5, 0},
      },
      south =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-S.png",
        width = 13,
        height = 11,
        frame_count = 1,
        shift = {-0.265625, 0.140625},
      },
      west =
      {
        filename = "__base__/graphics/entity/combinator/activity-leds/arithmetic-combinator-LED-W.png",
        width = 13,
        height = 11,
        frame_count = 1,
        shift = {-0.453125, -0.359375},
      }
    },

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
	
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {0.171875, 0.703125},
          green = {0.765625, 0.703125}
        },
        wire =
        {
          red = {-0.28125, 0.34375},
          green = {0.28125, 0.34375},
        }
      },
      {
        shadow =
        {
          red = {-0.328125, -0.078125},
          green = {-0.328125, 0.328125},
        },
        wire =
        {
          red = {-0.78125, -0.4375},
          green = {-0.78125, -0.03125},
        }
      },
      {
        shadow =
        {
          red = {0.734375, -0.453125},
          green = {0.171875, -0.453125}
        },
        wire =
        {
          red = {0.25, -0.78125},
          green = {-0.3125, -0.78125}
        }
      },
      {
        shadow =
        {
          red = {1.20313, 0.359375},
          green = {1.20313, -0.046875},
        },
        wire =
        {
          red = {0.78125, 0},
          green = {0.78125, -0.4375},
        }
      }
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
    flags = { "goes-to-quickbar" },
    subgroup = "circuit-network",
    place_result="fpca",
    order = "c[combinators]-d[fpca]",
    stack_size = 50,
	icon_size = 32,
  }

data:extend{entity,recipe,tech,item}
