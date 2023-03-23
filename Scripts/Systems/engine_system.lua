dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local engine_system = GetSelf()
local sensor_data		= get_base_data()

local update_time_step = 0.005 --0.006
make_default_activity(update_time_step)

local PARAMETERS = 
{
    APU                     = get_param_handle("APU"),
    APU_IND                 = get_param_handle("APU_IND"),
    BOOST_L                 = get_param_handle("BOOST_L"),
    BOOST_R                 = get_param_handle("BOOST_R"),
    AIR_DRIVE               = get_param_handle("AIR_DRIVE"),
    ECS                     = get_param_handle("ECS"),
    COCK_L                  = get_param_handle("COCK_L"),
    COCK_R                  = get_param_handle("COCK_R"),

    --------------ELEC----------------------------------
    BATTERY           = get_param_handle("BATTERY"),
    LGEN              = get_param_handle("LGEN"),
    RGEN              = get_param_handle("RGEN"),

    AC_Static                                      = get_param_handle("AC_STATIC"),
}

local time = 0

local FCS_TARGET = 0
local WOW = 0
local ias_knots = 0

local FuelOn = Keys.PlaneFuelOn
local FuelOff = Keys.PlaneFuelOff

local Rboost = device_commands.RBOOST
local Lboost = device_commands.LBOOST

local rvalve = device_commands.FuelPumpRight
local lvalve = device_commands.FuelPumpLeft

local rcover = device_commands.RCOVER
local lcover = device_commands.LCOVER

local apuon = device_commands.APUON
local apustandbyoff = device_commands.APUSTANDBYOFF
local apu_state = 0

local ecs = device_commands.ECS
local ecs_state = 0

local airdrive = device_commands.AIR_DRIVE
local airdrive_state = 0
local airdrive_flow = 0

local rvalve_state = 0
local lvalve_state = 0

local rboost_state = 0
local lboost_state = 0

local rcover_state = 0
local lcover_state = 0

engine_system:listen_command(rcover)
engine_system:listen_command(lcover)
engine_system:listen_command(lvalve)
engine_system:listen_command(rvalve)
engine_system:listen_command(apuon)
engine_system:listen_command(apustandbyoff)
engine_system:listen_command(ecs)
engine_system:listen_command(airdrive)

------------------------------------------------------------------FUNCTION-POST-INIT---------------------------------------------------------------------------------------------------
function post_initialize()

    local birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" or birth == "AIR_HOT" then
        rvalve_state = 1
        engine_system:performClickableAction(rvalve, 1, false)
        dispatch_action(nil, rvalve)
        lvalve_state = 1
        engine_system:performClickableAction(lvalve, 1, false)
        dispatch_action(nil, lvalve)

        engine_system:performClickableAction(ecs, 1, false)
        dispatch_action(nil, ecs)
        engine_system:performClickableAction(Lboost, 1, false)
        engine_system:performClickableAction(Rboost, 1, false)
    elseif birth =="GROUND_COLD" then
        --print_message_to_user("COLD START")
    end
	
end
------------------------------------------------------------------FUNCTION-SETCOMMAND---------------------------------------------------------------------------------------------------
function SetCommand(command,value)

    if command == apuon and PARAMETERS.BATTERY:get() == 1 and apu_state == 0 or apu_state == -1  then 
        apu_state = 1
        -- dispatch_action(nil,1055)
    elseif command == apustandbyoff then 
        apu_state = -1
        -- dispatch_action(nil,1056)
    end


    if command == rvalve and rvalve_state == 0 then
        rvalve_state = 1
    elseif command == rvalve and rvalve_state == 1 then
        rvalve_state = 0
    end 

end
------------------------------------------------------------------FUNCTION-UPDATE---------------------------------------------------------------------------------------------------
function update()

    local current_throtte_l = sensor_data.getThrottleLeftPosition() * 100
    local current_throtte_r = sensor_data.getThrottleRightPosition() * 100

    local rvalve_state = get_cockpit_draw_argument_value(705)
    local lvalve_state = get_cockpit_draw_argument_value(698)
    local rboost_state = get_cockpit_draw_argument_value(726)
    local lboost_state = get_cockpit_draw_argument_value(727)
    local airdrive_state = get_cockpit_draw_argument_value(730)

    local RPML = sensor_data.getEngineLeftRPM()
    local RPMR = sensor_data.getEngineRightRPM()

    local Engine_left_fuelconsumption  = sensor_data.getEngineLeftFuelConsumption()
    local Engine_right_fuelconsumption = sensor_data.getEngineRightFuelConsumption()

    if (airdrive_state == 0 or airdrive_state == -1) and RPML > 66 or RPMR > 66 or PARAMETERS.APU:get() == 1 then 
        airdrive_flow = 1
    elseif airdrive_state == 1 or (RPML < 3 and RPMR < 3 and PARAMETERS.APU:get() == 0 ) then
        airdrive_flow = 0
    end


    if RPMR < 67 and current_throtte_r > 3 and rvalve_state == 1 and rboost_state == 1 and airdrive_flow == 1 then
        --print_message_to_user("Right Engine Start")
        dispatch_action(nil, Keys.RightEngineStart)
    elseif RPML < 67 and current_throtte_l > 3 and lvalve_state == 1 and lboost_state == 1 and airdrive_flow == 1 then
        dispatch_action(nil, Keys.LeftEngineStart)
        --print_message_to_user("Left Engine Start")
    end

    -- print_message_to_user(airdrive_flow)


    if RPML > 66 and RPMR > 66 or apu_state == -1 then
        PARAMETERS.APU:set(0)
    end

    if rvalve_state == 0 or rboost_state == 0 then 
        dispatch_action(nil, Keys.RightEngineStop)
    elseif lvalve_state == 0 or lboost_state == 0 then 
        dispatch_action(nil, Keys.LeftEngineStop)
    end
    

    if apu_state == 1 then
        time = time + update_time_step
        if math.floor(time) == 30 then
            apu_state = 0
            PARAMETERS.APU:set(1)
            print_message_to_user("Mensaje de prueba para ver cuando se enciende la APU")
        end
    else
        time = 0
    end



    -- print_message_to_user(lboost_state)

    --print_message_to_user(rboost_state + lboost_state)

    WOW = sensor_data.getWOW_RightMainLandingGear()
    ias_knots = sensor_data.getIndicatedAirSpeed() * 3.6 * 0.539956803456

    if RPMR <= 50 and RPML <= 50 and WOW == 1 and ias_knots < 5 then
        set_aircraft_draw_argument_value(19,0)
        set_aircraft_draw_argument_value(20,0)
        if FCS_TARGET ~= 0.9 then
            FCS_TARGET = FCS_TARGET + 0.005
        end
        if FCS_TARGET >= 0.9 then
            FCS_TARGET = 0.9
        end
        -- set_aircraft_draw_argument_value(1050,FCS_TARGET)
    elseif RPMR > 50 and RPML > 50 and WOW == 1 and ias_knots < 5 then 
        if FCS_TARGET ~= 0 then
            FCS_TARGET = FCS_TARGET - 0.005
        elseif FCS_TARGET <= 0 then 
            FCS_TARGET = 0
        end
        set_aircraft_draw_argument_value(1050,FCS_TARGET)
    end
    if WOW ==1 then
        -- set_aircraft_draw_argument_value(4,0.8)
        -- set_aircraft_draw_argument_value(6,0.8)
        -- set_aircraft_draw_argument_value(1,0)
    end
    -- print_message_to_user(VV)
    -- print_message_to_user(pitch-AOA)


end