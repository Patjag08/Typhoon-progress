dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local Gear_system = GetSelf()
local sensor_data		= get_base_data()

local parameters = {
    GEAR = get_param_handle("GEAR")
    
}

local update_time_step = 0.06 --0.006 1/n = o,06 
make_default_activity(update_time_step)


local gear_click = device_commands.GearSwitch
local gear_action = Keys.PlaneGear
local gear_state = 0

Gear_system:listen_command(gear_click)
Gear_system:listen_command(gear_action)
------------------------------------------------------------------FUNCTION-POST-INIT---------------------------------------------------------------------------------------------------
function post_initialize()
    birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" or birth == "GROUND_COLD" then
        gear_state = 1
        --GEAR DOWN 
    elseif birth == "AIR_HOT" then
        gear_state = 0
        --GEAR UP
    end


end
------------------------------------------------------------------FUNCTION-SETCOMMAND---------------------------------------------------------------------------------------------------
function SetCommand(command,value)
    if command == gear_click and gear_state == 0 then 
        dispatch_action(nil, gear_action)
        gear_state = 1
    elseif command == gear_click and gear_state == 1 then
        gear_state = 0
        dispatch_action(nil, gear_action)
    end


end
------------------------------------------------------------------FUNCTION-UPDATE---------------------------------------------------------------------------------------------------
function update()
    parameters.GEAR:set(gear_state)
    -- print_message_to_user(gear_state)
    local Gearclickconector = get_clickable_element_reference("PNT_083")
    Gearclickconector:update() -- ensure the connector moves too

end
