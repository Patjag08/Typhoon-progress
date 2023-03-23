dofile(LockOn_Options.script_path.."command_defs.lua")

local update_time_step = 0.01 
make_default_activity(update_time_step)

local sensor_data = get_base_data()

local break_system = GetSelf()
local rate_met2knot = 0.539956803456
local ias_knots = 0 -- * rate_met2knot

local fmt = '%.2f'
local Dragchute_click = device_commands.DRAGCHUTE
local DragchuteOn = Keys.PlaneParachute
local DRAGCHUTE_TARGET = 0
local drag_chute_pos = 0

local DEGREE_TO_RAD  = 0.0174532925199433
local RAD_TO_DEGREE  = 57.29577951308233
local AOA = 0

break_system:listen_command(Dragchute_click)
break_system:listen_command(DragchuteOn)
break_system:listen_command(DRAGCHUTE_TARGET)
break_system:listen_command(drag_chute_pos)

function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
end

function getIASKnots()
    ias_knots = sensor_data.getIndicatedAirSpeed() * 3.6 * rate_met2knot
    WOW = sensor_data.getWOW_LeftMainLandingGear()
    --print_message_to_user("ISA:")
    --print_message_to_user(ias_knots)
    --print_message_to_user("SLAT_POS:")
    AOA =(sensor_data.getAngleOfAttack() * RAD_TO_DEGREE)
    -- SLATS_STATE = tonumber(string.format(fmt,AOA))
    -- print_message_to_user(SLATS_STATE)
end

function SetCommand(command,value)
    if command == DragchuteOn and DRAGCHUTE_TARGET == 0 then
        DRAGCHUTE_TARGET = 1
    elseif command == DragchuteOn and DRAGCHUTE_TARGET == 1 then
        DRAGCHUTE_TARGET = 0
    end
end

function update()
    local drag_chute_pos = get_aircraft_draw_argument_value(35)
    print_message_to_user(DRAGCHUTE_TARGET)
    getIASKnots()
    if DRAGCHUTE_TARGET == 1 then
        if (drag_chute_pos < 0.9) then
            drag_chute_pos = drag_chute_pos + 0.01
            set_aircraft_draw_argument_value(35, drag_chute_pos)
        elseif (drag_chute_pos >= 0.9) then
            set_aircraft_draw_argument_value(35, drag_chute_pos)
        end
    elseif DRAGCHUTE_TARGET == 0 then 
        set_aircraft_draw_argument_value(35,DRAGCHUTE_TARGET)
    end

end

need_to_be_closed = false