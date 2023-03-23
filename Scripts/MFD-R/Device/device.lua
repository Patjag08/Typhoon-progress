dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system.lua")


local dev = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step)

local HUD_mach = get_param_handle("HUD_MACH")
local HUD_GES = get_param_handle("HUD_GES")
local HUD_roll = get_param_handle("HUD_ROLL")
local HUD_vertical = get_param_handle("HUD_VERTICAL")
local HUD_pitch = get_param_handle("HUD_PITCH")
local HUD_AoA = get_param_handle("HUD_AOA")
local HUD_yaw = get_param_handle("HUD_YAW")
local HUD_speed_dis = get_param_handle("HUD_SPEED_DIS")
local HUD_alt_dis = get_param_handle("HUD_ALT_DIS")
local HUD_alt_dis_rad = get_param_handle("HUD_ALT_DIS_RAD")
local HUD_hdg_dis = get_param_handle("HUD_HDG_DIS")
local HUD_hdg_mov = get_param_handle("HUD_HDG_MOV")
local HUD_aoa_dis = get_param_handle("HUD_AOA_DIS")
local HUD_hsi_rot = get_param_handle("HUD_HSI_ROT")
local HUD_level_enable = get_param_handle("HUD_LINES")
local HUD_DIS_ENABLE = get_param_handle("HUD_DIS_ENABLE")
local BATTERY = get_param_handle("BATTERY")
local nav_state= get_param_handle("NAV_STATE")
local HUD_mach_m = get_param_handle("HUD_MACH_M")
local HUD_ANG_NUM = get_param_handle("HUD_ARG_NUM")
local HUD_ALT_R = get_param_handle("HUD_ALT_R")
local HUD_FD_y = get_param_handle("HUD_FD_Y")
local HUD_Gz = get_param_handle("HUD_GZ")
local HUD_Rumbos_MAG = get_param_handle("HUD_RUMBOS_MAG")
local HUD_GEAR_R_STATE = get_param_handle("HUD_GEAR_R_STATE")
local HUD_GEAR_L_STATE = get_param_handle("HUD_GEAR_L_STATE")
local HUD_GEAR_F_STATE = get_param_handle("HUD_GEAR_F_STATE")
local GEAR =get_param_handle("GEAR")
local HUD_GEAR_OPACITY = get_param_handle("HUD_GEAR_OPACITY")
local HUD_RADALT_OPACITY = get_param_handle("HUD_RADALT_OPACITY")

local sensor_data = get_base_data()
local ias_conversion_to_knots = 1.9504132
local ias_conversion_to_kmh = 3.6
local DEGREE_TO_RAD  = 0.0174532925199433
local RAD_TO_DEGREE  = 57.29577951308233
local METER_TO_FEET = 3.28084

function post_initialize()--Causes error
    -- HUD_FD_x:set(0)
    HUD_FD_y:set(0)
    HUD_ANG_NUM:set(1)
    -- HUD_enable:set(1)
end

function SetCommand(command,value)

end

function update()

    -- print_message_to_user(HUD_ASPECT_HEIGHT)
    HUD_mach:set(sensor_data.getMachNumber())
    HUD_DIS_ENABLE:set(PowerOnOff)
    HUD_yaw:set(sensor_data.getRateOfYaw())
    HUD_roll:set(sensor_data.getRoll())
    VV = sensor_data.getVerticalVelocity()
    if VV > 18 then 
        VV = 18
    elseif VV < -18 then 
        VV = -18
    end

    local rad_alt =(math.floor(sensor_data.getRadarAltitude() * METER_TO_FEET/10 +0.5)*10)
    local rad_alt_state = 0
    if rad_alt > 5000 then 
        rad_alt_state = 0
    elseif rad_alt <= 5000 then 
        rad_alt_state = 1
    end
    HUD_RADALT_OPACITY:set(rad_alt_state)
    HUD_vertical:set(VV)
    HUD_pitch:set(sensor_data.getPitch())
    HUD_speed_dis:set(sensor_data.getIndicatedAirSpeed() *ias_conversion_to_knots)
    HUD_alt_dis:set(math.floor(sensor_data.getBarometricAltitude() * METER_TO_FEET/10 +0.5)*10)
    HUD_ALT_R:set(sensor_data.getBarometricAltitude())
    HUD_alt_dis_rad:set(math.floor(sensor_data.getRadarAltitude() * METER_TO_FEET/10 +0.5)*10)
    HUD_mach_m:set("M")
    HUD_FD_y:set(HUD_AoA)
    HUD_Gz:set(sensor_data.getVerticalAcceleration())
    HUD_Rumbos_MAG:set(sensor_data.getMagneticHeading()* RAD_TO_DEGREE)
    -- print_message_to_user(HUD_FD_y)
    -- print_message_to_user(HUD_vertical)
    -- HUD_hdg_dis:set(sensor_data.getMagneticHeHUDng() *RAD_TO_DEGREE)
    HUD_aoa_dis:set(sensor_data.getAngleOfAttack())
    -- HUD_hsi_rot:set(sensor_data.getHeHUDng())
    local current_aoa = sensor_data.getAngleOfAttack()
    -- HUD_FD_y:set(current_aoa)
end