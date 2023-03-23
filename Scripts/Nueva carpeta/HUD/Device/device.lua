dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system.lua")


local dev = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step)


local sensor_data = get_base_data()
local ias_conversion_to_knots = 1.9504132
local ias_conversion_to_kmh = 3.6
local DEGREE_TO_RAD  = 0.0174532925199433
local RAD_TO_DEGREE  = 57.29577951308233
local METER_TO_FEET = 3.28084

function post_initialize()--Causes error
end

function SetCommand(command,value)
end

function update()
end