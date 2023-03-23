dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system.lua")


local hmd_system = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step)

local parameters = 
{
    HMD = get_param_handle("HMD")
}

local HMD_Mode = 0

hmd_system:listen_command(Keys.PlaneModeNAV)
hmd_system:listen_command(Keys.PlaneModeBVR)
hmd_system:listen_command(Keys.PlaneModeVS)
hmd_system:listen_command(Keys.PlaneModeBore)
hmd_system:listen_command(Keys.PlaneModeHelmet)
hmd_system:listen_command(Keys.PlaneModeFI0)
hmd_system:listen_command(Keys.PlaneModeGround)
hmd_system:listen_command(Keys.PlaneModeGrid)
hmd_system:listen_command(Keys.PlaneModeCannon)
hmd_system:listen_command(747)
hmd_system:listen_command(746)

local HMD_roll = get_param_handle("HMD_ROLL")
local HMD_pitch = get_param_handle("HMD_PITCH")
local HMD_gload = get_param_handle("HMD_GLOAD")
local HMD_mach = get_param_handle("HMD_MACH")
local HMD_GZ = get_param_handle("HMD_GZ")
local HMD_mach_m = get_param_handle("HMD_MACH_M")
local HMD_yaw = get_param_handle("HMD_YAW")
local HMD_speed_dis = get_param_handle("HMD_SPEED_DIS")
local HMD_alt_dis = get_param_handle("HMD_ALT_DIS")
local HMD_hdg_dis = get_param_handle("HMD_HDG_DIS")
local HMD_hdg_mov = get_param_handle("HMD_HDG_MOV")
local HMD_aoa_dis = get_param_handle("HMD_AOA_DIS")
local HMD_hsi_rot = get_param_handle("HMD_HSI_ROT")
local HMD_level_enable = get_param_handle("HMD_LINES")
local HMD_DIS_ENABLE = get_param_handle("HMD_DIS_ENABLE")
local BATTERY = get_param_handle("BATTERY")

local sensor_data = get_base_data()
local ias_conversion_to_knots = 1.9504132
local ias_conversion_to_kmh = 3.6
local DEGREE_TO_RAD  = 0.0174532925199433
local RAD_TO_DEGREE  = 57.29577951308233
local METER_TO_FEET = 3.28084

function HideFc3Hud()
    local i = 100
    for i =  100, 1, -1 do 
        dispatch_action(nil, 747)
    end
        
end
    
function ShowFc3Hud()
local i = 100
for i =  100, 1, -1 do 
    dispatch_action(nil, 746)
end
        

function post_initialize()--Causes error
    -- HideFc3Hud()
    -- HMD_FD_x:set(0)
    -- HMD_FD_y:set(0)
    -- HMD_level_enable:set(1)
    -- HMD_enable:set(1)
end

    
end

function SetCommand(command,value)
    
    if command == Keys.PlaneModeHelmet and HMD_Mode == 0 then
        HMD_Mode = 1
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeNAV and HMD_Mode == 1 then
        HMD_Mode = 0
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeBVR and HMD_Mode == 1 then
        HMD_Mode = 0
        -- print_message_to_user(HMD_Mode) 
    elseif command == Keys.PlaneModeVS and HMD_Mode == 1 then
        HMD_Mode = 0
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeBore and HMD_Mode == 1 then
        HMD_Mode = 0
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeFI0 and HMD_Mode == 1 then
        HMD_Mode = 0
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeGround and HMD_Mode == 1 then
        HMD_Mode = 0
        -- print_message_to_user(HMD_Mode)
    -- elseif command == Keys.PlaneModeCannon and HMD_Mode == 1 then
    --     HMD_Mode = 0
    end

    -- if command == iCommandHUDBrightnessDown then
    --     HUD_STATE = value
    --     HUD_REFERENCE = 0
    -- else command == iCommandHUDBrightnessUp then 
    --     HUD_STATE = value 
    --     HUD_REFERENCE = 1
    -- else 

end

function update()
    parameters.HMD:set(HMD_Mode)
    HMD_DIS_ENABLE:set(PowerOnOff)
    HMD_yaw:set(sensor_data.getRateOfYaw())
    HMD_roll:set(sensor_data.getRoll())
    HMD_pitch:set(sensor_data.getPitch())
    HMD_mach_m:set("M")
    local mach = sensor_data.getMachNumber()
    -- print_message_to_user(mach)									-- Speed in MACH
    HMD_mach:set(mach)
    HMD_gload:set(sensor_data.getVerticalAcceleration())
    HMD_speed_dis:set(sensor_data.getIndicatedAirSpeed() *ias_conversion_to_knots)
    HMD_alt_dis:set(math.floor(sensor_data.getBarometricAltitude() * METER_TO_FEET/10 +0.5)*10)
    -- HMD_hdg_dis:set(sensor_data.getMagneticHeHMDng() *RAD_TO_DEGREE)
    HMD_aoa_dis:set(sensor_data.getAngleOfAttack() *RAD_TO_DEGREE)
    HMD_GZ:set(sensor_data.getVerticalAcceleration())
    -- HMD_hsi_rot:set(sensor_data.getHeHMDng())
    -- local current_aoa = sensor_data.getAngleOfAttack()
    -- HMD_FD_y:set(current_aoa)
end






