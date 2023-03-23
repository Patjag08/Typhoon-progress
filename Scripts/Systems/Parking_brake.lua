dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local parking_brake_system = GetSelf()
local dev = parking_brake_system

local sensor_data = get_base_data()

local PARAMETERS = {
    PARKING_BRAKE = get_param_handle("PARKING_BRAKE"),
}

local Parking_Brake_on = Keys.PlaneWheelBrakeOn --setting the iCommands from command defs 
local Parking_Brake_off = Keys.PlaneWheelBrakeOff
local parking_brake_click =  device_commands.ParkingBrakeSwitch--Track mouse clicks
local parking_brake_state = 0
local braking = 0

local update_time_step = 0.02  
make_default_activity(update_time_step)

parking_brake_system:listen_command(Parking_Brake_on) --listen command needs to be here to work in set command
parking_brake_system:listen_command(Parking_Brake_off)
parking_brake_system:listen_command(parking_brake_click)


function post_initialize()
    local birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_COLD" then
        parking_brake_state = 0
        dispatch_action(nil, parking_brake_click)
        parking_brake_system:performClickableAction(parking_brake_click, 1, false)

    else
        parking_brake_state = 0
    end
end


function SetCommand(command,value)
    --BATTERY iCOMMAND
    --Battery Click Command
    if command == parking_brake_click and parking_brake_state == 1 then
        parking_brake_state = 0 
        dispatch_action(nil,Parking_Brake_off)
        -- this is used to push a keyboad/icommand with a mouse click
        --print_message_to_user("BATTERY CLICK")
    elseif command == parking_brake_click and parking_brake_state == 0 then
        parking_brake_state = 1
    end

    if command == Parking_Brake_off then
        braking = 0
        set_aircraft_draw_argument_value(1,braking)
    elseif command == Parking_Brake_on then
    end

end--END SETCOMMAND

function update()
    -- WOW = sensor_data.getWOW_RightMainLandingGear()
    PARAMETERS.PARKING_BRAKE:set(parking_brake_state)
    if parking_brake_state == 1 then
        dispatch_action(nil,Parking_Brake_on)
        -- set_aircraft_draw_argument_value(1, 0)
        --print_message_to_user("1")
    elseif parking_brake_state == 0 then
        -- set_aircraft_draw_argument_value(1, 0)
        -- print_message_to_user("0")
    end
    -- print_message_to_user(braking)
    -- local ParkingSwitch= get_clickable_element_reference("Parking_Brake")
    -- ParkingSwitch:update() -- ensure the connector moves too
end



