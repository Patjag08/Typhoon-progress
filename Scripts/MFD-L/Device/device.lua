dofile(LockOn_Options.script_path.."command_defs.lua")

local dev = GetSelf()
local sensor_data = get_base_data()

local update_time_step = 0.02
make_default_activity(update_time_step)

local BATTERY = get_param_handle("BATTERY")
local Canopyupdown = get_param_handle("CANOPYONOFF")
local EngineStartRPM = get_param_handle("ENGINESTART")
local EngineStartRPML = get_param_handle("ENGINESTARTL")
local EngineStartRPMR = get_param_handle("ENGINESTARTR")
local Powerstart = get_param_handle("POWERUPONOFF")
local Enginestate = 1
local EnginestateL = 1
local EnginestateR = 1
local Powerstate = 1
function post_initialize()--Causes error
    local birth = LockOn_Options.init_conditions.birth_place
    -- HUD_FD_x:set(0)
    -- HUD_enable:set(1)
    if birth == "GROUND_HOT" or birth == "AIR_HOT" then
        Enginestate = 1
        EnginestateL = 1
        EnginestateR = 1
        Powerstate = 1
    elseif birth == "GROUND_COLD"  then
        Enginestate = 0
        EnginestateL = 0
        EnginestateR = 0
        Powerstate = 0
    end
end

function SetCommand(command,value)

end
local canopy_state = sensor_data.getCanopyState()
function update()
    if sensor_data.getCanopyPos() == 0 then
        canopy_state = 0
    else
        canopy_state = 1
    end
    Canopyupdown:set(canopy_state)
    if sensor_data.getEngineLeftRPM() >= 50 and sensor_data.getEngineRightRPM() >= 50 then
        Enginestate = 1
    else
        Enginestate = 0
    end
    EngineStartRPM:set(Enginestate)
    if sensor_data.getEngineLeftRPM() >= 50 then
        EnginestateL = 1
    else
        EnginestateL = 0
    end
    EngineStartRPML:set(EnginestateL)
    if sensor_data.getEngineRightRPM() >= 50 then
        EnginestateR = 1
    else
        EnginestateR = 0
    end
    EngineStartRPMR:set(EnginestateR)
    if Enginestate == 1 and EnginestateL == 1 and EnginestateR == 1 and canopy_state == 0 then
        Powerstate = 1
    else
        Powerstate = 0
    end
    Powerstart:set(Powerstate)
    --print_message_to_user(Powerstate)
    --print_message_to_user(sensor_data.getEngineLeftRPM())
end