dofile(LockOn_Options.script_path.."command_defs.lua")
-- dofile(LockOn_Options.script_path.."System/Parameters.lua")

-- dofile("D:/Program Files/DCS World OpenBeta/Config/Input/Aircrafts/base_joystick_binding.lua") --D:\Program Files\DCS World OpenBeta\Config\Input\Aircrafts
local update_time_step = 0.0125
make_default_activity(update_time_step)
local FBW = GetSelf()
local sensor_data = get_base_data()


-- ===== Local variables =====
local ROLL_INPUT = 0
local PITCH_INPUT = 0
local RUDDER_INPUT = 0
local THROTTLE_INPUT = 0
local PITCH_STATE = get_param_handle("PITCH_INPUT") 
local ROLL_STATE = get_param_handle("ROLL_INPUT")

local GERROR = 0
local T = 0

local ias_knots = 0

local PITCH_TARGET = 0
local PITCH_ERROR = 0

local ROLL_TARGET = 0 
local ROLL_ERROR = 0

local YAW_STATE = 0 
local YAW_TARGET = 0

local YAW_Diff1 = 0
local YAW_Diff2 = 0
local RudderTimeSec = 1
local RudderIncrement = update_time_step / RudderTimeSec

local PITCH_OUTPUT = get_param_handle("CURRENT_PITCH_OUTPUT")
local ROLL_OUTPUT = get_param_handle("CURRENT_ROLL_OUTPUT")
local YAW_OUTPUT = get_param_handle("CURRENT_YAW_OUTPUT")

local PITCH_PAST = 0
local GTARGET = 0
local g = 9.81


----PID CONTROLLER-----
local target = 0
local meassurement = 0
local meassurement_prior =0
local error_prior = 0
local integral_prior = 0
local derivative_prior = 0
local kp = 0.2
local ki = 0.001
local kd = 0.1
local bias = 0

FBW:listen_command(Keys.PlaneTrimUp)
FBW:listen_command(Keys.PlaneTrimDown)
FBW:listen_command(Keys.PlaneTrimRight)
FBW:listen_command(Keys.PlaneTrimLeft)
FBW:listen_command(Keys.PlaneTrimCancel)

FBW:listen_command(2001)--Pitch axis
FBW:listen_command(2002)--roll
FBW:listen_command(2003)--rudder/yaw

FBW:listen_command(10061)--Pitch axis
FBW:listen_command(10062)--roll
FBW:listen_command(RUDDER_INPUT)--rudder/yaw
FBW:listen_command(THROTTLE_INPUT)--throttle

function FBW:PID_controller(target, meassurement, kp,ki,kd,tau,bias)
    GPOSLIMIT = 9
    GNEGLIMIT = -3
    AOALIMIT = 24.2 
    ROLLRATELIMIT = 260
    local bias = bias or 0
    --------------PID------------------------
    error_prior = 0
    integral_prior = 0
    error = target - meassurement

    proportional = kp * error 

    integral = integral_prior + 0.5 * ki * (error + error_prior)

    derivative = 2 * kd * (meassurement - meassurement_prior) 
                + 2 * (tau - update_time_step) * derivative_prior 
                / 2 * (tau + update_time_step)
    
    value_out = proportional+integral+derivative+bias

    meassurement_prior = meassurement
    error_prior = error
    integral_prior = integral
    derivative_prior = derivative
    ----------------END OF PID--------------------
    return value_out
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

function Sensor_data() 
    ias_knots = sensor_data.getIndicatedAirSpeed() * 1.94384
    tas_knots = sensor_data.getTrueAirSpeed() * 1.94384
	PITCH = sensor_data.getPitch()* 57.29577951308233
    ROLL = sensor_data.getRoll()* 57.29577951308233
    NY = sensor_data.getVerticalAcceleration()
    NX = sensor_data.getHorizontalAcceleration()
    NZ = sensor_data.getLateralAcceleration()
    ROLLRATE = sensor_data.getRateOfRoll()* 57.29577951308233
    PITCHRATE = sensor_data.getRateOfPitch()* 57.29577951308233
    YATRATE = sensor_data.getRateOfYaw()* 57.29577951308233
    GEARDOWN = sensor_data.getRightMainLandingGearDown()
    WOW = sensor_data.getWOW_RightMainLandingGear()
    GTARGET = (1 + PITCH_INPUT* 100 / 12.5)
    GERROR = GTARGET - NY
    PITCHRATETARGET = PITCH_INPUT * 25
    PITCHRATEERROR = PITCHRATETARGET - PITCHRATE
    ROLLRATETARGET = ROLL_INPUT * 260
    ROLLRATEERROR = (ROLLRATETARGET - ROLLRATE) / 26
    GPOSLIMIT = 0
    GNEGLIMIT = 0
    AOALIMIT = 0
    ROLLRATELIMIT = 0

end

function time_counter()
    T = T + update_time_step
    if T == 1 then
        T = 0
    end
end

  

function update()

    time_counter()
    Sensor_data()


    --EN PRINCIPIO ASÍ VA BIEN
    -- ESTABLECER MODOS. 1. GEAR UP/GEAR DOWN
    if WOW == 1 then 
        ROLL_OUTPUT = ROLL_INPUT 
        PITCH_OUTPUT = PITCH_INPUT

    elseif GEARDOWN == 1 and ias_knots >= 10 then 
        GPOSLIMIT = 4
        GNEGLIMIT = -0
        AOALIMIT = 24.2
        ROLLRATELIMIT = 80
        
        if ROLL_TARGET > ROLLRATELIMIT then 
            ROLL_TARGET = ROLLRATELIMIT
        end

        ROLL_OUTPUT = ROLLRATEERROR 
        PITCH_OUTPUT = FBW:PID_controller(PITCHRATETARGET,PITCHRATE,2,0.3,-8,0.0225,0.2) --GOOD FOR NOW

    elseif GEARDOWN == 0 then
        GPOSLIMIT = 9
        GNEGLIMIT = -3
        AOALIMIT = 24.2 
        ROLLRATELIMIT = 260

        if ROLL_TARGET > ROLLRATELIMIT then 
            ROLL_TARGET = ROLLRATELIMIT
        end

        ROLL_OUTPUT = ROLLRATEERROR 
        PITCH_OUTPUT = FBW:PID_controller(GTARGET,NY,1,0.8,-4.5,0.0225,0)

    end

    -- PITCH_ERROR = PITCH - PITCH_PAST
    -- PITCH_PAST = PITCH

    -- print_message_to_user("PITCHERROR RATE IS " .. PITCH_ERROR)
    -- print_message_to_user("PITCHRATE IS " .. PITCHRATE)

    -- print_message_to_user("PITCHERROR IS " .. error )
    -- print_message_to_user("PID VALUE IS " .. PITCH_OUTPUT)
    -- print_message_to_user(ROLLRATEERROR)
    PITCH_STATE = PITCH_INPUT
    ROLL_STATE = ROLL_INPUT

    dispatch_action(nil, 2001, PITCH_OUTPUT)	--PITCH
    dispatch_action(nil, 2002, ROLL_OUTPUT)	--ROLL

    set_aircraft_draw_argument_value(1011,-ROLL_INPUT)
    set_aircraft_draw_argument_value(1012,ROLL_INPUT)

    set_aircraft_draw_argument_value(1015,(PITCH_INPUT/2) + PITCH_OUTPUT/15)
    set_aircraft_draw_argument_value(1016,(PITCH_INPUT/2) + PITCH_OUTPUT/15)
    -- set_aircraft_draw_argument_value(11,ROLL_INPUT)
    -- set_aircraft_draw_argument_value(12,ROLL_INPUT)

    -- set_aircraft_draw_argument_value(15,PITCH_INPUT)
    -- set_aircraft_draw_argument_value(16,PITCH_INPUT)

    local PITCH_STATE = get_param_handle("PITCH_INPUT") 
    local ROLL_STATE = get_param_handle("ROLL_INPUT")


    -- dispatch_action(nil, 174, YAW_STATE) 	--RUDDER/YAW
end