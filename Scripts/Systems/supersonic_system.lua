dofile(LockOn_Options.script_path.."command_defs.lua")

local update_time_step = 0.03
make_default_activity(update_time_step)

local sensor_data = get_base_data()

local rate_met2knot = 0.539956803456
local ias_knots = 0 -- * rate_met2knot

local fmt = '%.2f'

local MACH_TARGET = 0
local MACHCLOUD_TARGET = 0

local Cloud_target = 0

local M_TO_FEET = 3.28084

local DEGREE_TO_RAD  = 0.0174532925199433
local RAD_TO_DEGREE  = 57.29577951308233
local supersonic_system = GetSelf()
local AOA = 0
function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
end

function getIASKnots()
    ias_knots = sensor_data.getIndicatedAirSpeed() * 3.6 * rate_met2knot
    feet = sensor_data.getBarometricAltitude() * M_TO_FEET
    --print_message_to_user("ISA:")
    --print_message_to_user(ias_knots)
    --print_message_to_user("SLAT_POS:")
    M = sensor_data.getMachNumber()
    -- SLATS_STATE = tonumber(string.format(fmt,AOA))
    -- print_message_to_user(SLATS_STATE)
end

function SetCommand(command,value)
end

function update()
    getIASKnots()--si el AOA es menor que 2, slats = 0; si slats < 8 pon AOA/8 si AOA > 8 slats =1 si IAS <115 slat slat_system = 0
    -- print_message_to_user(m)
    -- print_message_to_user(MACH_TARGET)
    if (M > 1.02) then
        MACH_TARGET = 1
    elseif (M < 0.97) then
        MACH_TARGET= 0
    elseif (M <= 1.02) and (M >= 0.97) then --1.05-0.95 = 0.1 100
        MACH_TARGET = -20*(0.97-M) 
    end
    set_aircraft_draw_argument_value(93,MACH_TARGET)
    set_aircraft_draw_argument_value(94,MACH_TARGET)

    if (M <= 0.99) and (M >= 0.96) and feet <= 3000  then --1.05-0.95 = 0.1 100
        set_aircraft_draw_argument_value(1049, Cloud_target)
        Cloud_target = Cloud_target + 0.1
        if Cloud_target == 1 then
            Cloud_target = 0
        end
    elseif (M >= 1) and (M<=1.01) and feet <= 3000 then 
        set_aircraft_draw_argument_value(1049,0.5)
        Cloud_target = 0
    else
        set_aircraft_draw_argument_value(1049,0)
        Cloud_target = 0
    end
end

need_to_be_closed = false