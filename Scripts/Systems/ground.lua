dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local ground_system = GetSelf()
local sensor_data		= get_base_data()

local update_time_step = 0.00125 --0.006
make_default_activity(update_time_step)

local groundinput = 0
local prevgroundinput = 0
local mainwheelstate = 0
local ias_knots = 0
local WOW = 0

ground_system:listen_command(iCommandPlaneRightRudderStart)
ground_system:listen_command(iCommandPlaneLeftRudderStart)
ground_system:listen_command(Keys.PlaneLeftRudderStop)
ground_system:listen_command(Keys.PlaneRightRudderStop)
ground_system:listen_command(2003)--rudder/yaw
------------------------------------------------------------------FUNCTION-POST-INIT---------------------------------------------------------------------------------------------------
function post_initialize()
	

end
------------------------------------------------------------------FUNCTION-SETCOMMAND---------------------------------------------------------------------------------------------------
function SetCommand(command,value)
    if command == 2003 and WOW == 1 then
        groundinput = value
        -- if ias <= 1 then
        -- end
    end

end
------------------------------------------------------------------FUNCTION-UPDATE---------------------------------------------------------------------------------------------------
function update()
    ias_knots = sensor_data.getIndicatedAirSpeed() * 1.94384
    WOW = sensor_data.getWOW_NoseLandingGear()
    -- dispatch_action(nil, Keys.PlaneLeftRudderStop)
    -- dispatch_action(nil, Keys.PlaneRightRudderStop)
    mainwheeldirection = get_aircraft_draw_argument_value(2)

    -- if ias_knots <= 2 and WOW == 1 then 
    --     dispatch_action(nil,2003,groundinput - groundinput/2) 
    -- elseif ias_knots > 2 and WOW == 1 then
    --     dispatch_action(nil,2003,groundinput) 
    -- end
    -- if ias_knots <= 2 and WOW == 1 then
    set_aircraft_draw_argument_value(2,-groundinput * 0.8)
    --     print_message_to_user(groundinput)

    -- end


end