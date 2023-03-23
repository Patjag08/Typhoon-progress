dofile(LockOn_Options.script_path.."command_defs.lua")

local update_time_step = 0.00125 
make_default_activity(update_time_step) 

-----------------------------------------------------------------
-- atterrizaje canards en modo depresión
-- si rpm < 70 

local sensor_data = get_base_data()

local rate_met2knot = 0.539956803456
local ias_knots = 0 -- * rate_met2knot

local fmt = '%.2f'
local FCS_TARGET = 0

local DEGREE_TO_RAD  = 0.0174532925199433
local RAD_TO_DEGREE  = 57.29577951308233
local fcs_system = GetSelf()
local AOA = 0

local ROLL_INPUT = 0
local PITCH_INPUT = 0
local RUDDER_INPUT = 0

function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
end

function getIASKnots()
    ias_knots = sensor_data.getIndicatedAirSpeed() * 3.6 * rate_met2knot
    WOW = sensor_data.getWOW_RightMainLandingGear()
    RPM = sensor_data.getEngineLeftRPM()
    pitch = sensor_data.getPitch() * RAD_TO_DEGREE
    VV = sensor_data.getVerticalVelocity()
    --print_message_to_user("ISA:")
    --print_message_to_user(ias_knots)
    --print_message_to_user("SLAT_POS:")
    AOA =(sensor_data.getAngleOfAttack() * RAD_TO_DEGREE)
    -- SLATS_STATE = tonumber(string.format(fmt,AOA))
    -- print_message_to_user(SLATS_STATE)
end

function SetCommand(command,value)
    if command == 10061 then
        PITCH_INPUT = value
	end
    
	if command == 10062 then
		ROLL_INPUT = value
	end
	if command == RUDDER_INPUT then
		RUDDER_OUTPUT = value	
    else
        RUDDER_INPUT = 0	
	end

    if command == 2019 then
        PITCH_STATE = value
    end
    
    if command == 2020 then 
        ROLL_STATE =value
    end 
end

function update()
    getIASKnots()
    if (RPM <= 75 ) and (ias_knots >= 20) and (ias_knots <= 180) and (WOW == 1) then
        set_aircraft_draw_argument_value(19,0)
        set_aircraft_draw_argument_value(20,0)
        if FCS_TARGET ~= 0.8 then
            FCS_TARGET = FCS_TARGET + 0.005
        end
        if FCS_TARGET >= 0.8 then
            FCS_TARGET = 0.8
        end
    else
        if FCS_TARGET ~= 0 then
            FCS_TARGET = FCS_TARGET - 0.005
        elseif FCS_TARGET <= 0  then
            FCS_TARGET = 0
        end
        if FCS_TARGET <= 0 then
            FCS_TARGET = 0
        end
    end
    if WOW ==1 then
        -- set_aircraft_draw_argument_value(4,0.8)
        -- set_aircraft_draw_argument_value(6,0.8)
        -- set_aircraft_draw_argument_value(1,0)
    end

    -- print_message_to_user(VV)
    -- print_message_to_user(pitch-AOA)

    set_aircraft_draw_argument_value(1050,FCS_TARGET)
end

need_to_be_closed = false