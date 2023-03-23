dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local utilites = GetSelf()
local sensor_data		= get_base_data()

local update_time_step = 0.05 --0.006
make_default_activity(update_time_step)

local parameters = 
{
    FUELCOVER = get_param_handle("FUELCOVER"),
    FUELPROBE = get_param_handle("FUELPROBE"),
    HOOK      = get_param_handle("HOOK"),
    NAVLIGHT = get_param_handle("NAVLIGHT"),
    ANTICOLLISIONLIGHT = get_param_handle("ANTICOLLISIONLIGHT"),
    FORMATIONLIGHT = get_param_handle("FORMATIONLIGHT"),
    LANDINGLIGHT = get_param_handle("LANDINGLIGHT"),
    RADARPARAM      = get_param_handle("RADARPARAM"),
    FLIRPARAM      = get_param_handle("FLIRPARAM"),
    nav_state       = get_param_handle("NAV_STATE"),
    LOW_HEIGHT      = get_param_handle("LOW_HEIGHT"),
    PARACHUTE       = get_param_handle("PARACHUTE"),
    HEAONOFF             =get_param_handle("HEAONOFF"),
    HUD2ONOFF              =get_param_handle("HUD2ONOFF"),
    HUD3ONOFF              =get_param_handle("HUD3ONOFF"),
    GEARONOFF             =get_param_handle("GEARONOFF"),
    A2AONOFF             =get_param_handle("A2AONOFF"),
    HUDONOFF             =get_param_handle("HUDONOFF"),
    LOWSPEED2            =get_param_handle("LOWSPEED1"),
    ECM            =get_param_handle("ECM"),
}

local fuel_cover_click = device_commands.FuelProbeCover
local fuel_cover_state = 0


--a2a MODES

--Hud Switch
local hudonoff_switch = device_commands.HUD
local hudstate = 1
-- RADAR



local RadarOnOff_action = Keys.PlaneRadarOnOff
local RadarSwitch = device_commands.RADARONOFF
local RadarState = 0

-- FLIR

local FLIROnOff_action = Keys.PlaneEOSOnOff
local FLIRSwitch = device_commands.FLIRONOFF
local FLIRState = 0

-- ECM

local ECM_state = 0
local ECM_switch = device_commands.ECKONOFF
local ECM_key = Keys.ActiveJamming

-- MODES
local airtoair_switch = device_commands.AIRTOAIR
local navmode_switch = device_commands.NAVMODE
local airtoair_key  = Keys.PlaneModeBVR
local navmode_key   = Keys.PlaneModeNAV

-- HMD
local HEA_switch    = device_commands.HEA
local HEA_state     = 0

--HUD
local HUD2_switch  = device_commands.HUD02
local HUD2_state   = 1

local HUD3_switch  = device_commands.HUD03
local HUD3_state   = 1

local lowspeed_state = 0

-- LIGHTS
local landinglight_switch = device_commands.LANDONOFF
local landinglight_key  = Keys.PlaneHeadLightOnOff
local Landinglight_state = 0

local formationlight_switch = device_commands.FORMATIONONOFF
local formationlight_key  = Keys.PlaneFormationLights
local formationlight_state = 0

local anticollisionlight_switch = device_commands.ACOLLISIONONOFF
local anticollisionlight_key  = Keys.PlaneAntiCollisionLights
local anticollisionlight_state = 0

local navlight_switch = device_commands.NAVONOFF
local navlighton  = Keys.PlaneNavLights_CodeModeOn
local navlightoff = Keys.PlaneNavLights_CodeModeOff
local navlight_state = 0


local hook_click = device_commands.HookSwitch
local hook_state = 0
local hook_key = Keys.PlaneHook

local fuel_probe_key = Keys.PlaneAirRefuel
local fuel_probe_click = device_commands.FuelProbeSwitch
local fuel_probe_state = 0

local iCommandPlaneStabHbar = 389 -- Barometric Altitude Hold
local iCommandPlaneStabTangBank = 386 -- Attitude Hold
local iCommandPlaneStabCancel = 408 -- Autopilot Disengage

local iCommandPlaneAutopilot = 62
local iCommandPlaneAutopilotOverrideOn = 427
local iCommandPlaneAutopilotOverrideOff = 428
local iCommandPlaneRouteAutopilot = 429
local iCommandAutopilotEmergOFF_up = 297
local iCommandAutopilotEmergOFF = 538
local iCommandPlaneStabHbarBank = 387 -- altitude and roll hold
local iCommandPlaneStabHorizon = 388 -- level flight control
local iCommandPlaneStabHrad = 390 -- radar altitude hold
local iCommandPlaneStabHbarHeading = 636
local iCommandPlaneStabPathHold = 637

local HUD_STATE = 0
local HUD_REFERENCE = 0

-- local PARACHUTE

local parachute_click = device_commands.DRAGCHUTE
local parachute_state = 0
local parachute_key = Keys.PlaneParachute


local AP = device_commands.AP
local AT = device_commands.AT
local HDG = device_commands.HDG
local ALT = device_commands.ALT
local TRK = device_commands.TRK
local RECOVER = device_commands.RECOVER

local LOW_HT = device_commands.LOW_HT
local low_height_state = 0

local navmode = 0
local bvrmode = 0
local vsmode = 0
local BOREmode = 0
local FIOmode = 0
local Groundmode = 0
local Gridmode = 0
local Cannonmode = 0
local helmetmode = 0


utilites:listen_command(Keys.PlaneModeNAV)
utilites:listen_command(Keys.PlaneModeBVR)
utilites:listen_command(Keys.PlaneModeVS)
utilites:listen_command(Keys.PlaneModeBore)
utilites:listen_command(Keys.PlaneModeHelmet)
utilites:listen_command(Keys.PlaneModeFI0)
utilites:listen_command(Keys.PlaneModeGround)
utilites:listen_command(Keys.PlaneModeGrid)
utilites:listen_command(Keys.PlaneModeCannon)
utilites:listen_command(Keys.PlaneModeHelmet)
utilites:listen_command(747)
utilites:listen_command(746)
utilites:listen_command(fuel_cover_click)
utilites:listen_command(fuel_probe_key)
utilites:listen_command(fuel_probe_click)
utilites:listen_command(hook_click)
utilites:listen_command(hook_state)
utilites:listen_command(iCommandHUDBrightnessDown)
utilites:listen_command(iCommandHUDBrightnessUp)
utilites:listen_command(hook_key)
utilites:listen_command(LOW_HT)
utilites:listen_command(FLIROnOff_action)
utilites:listen_command(FLIRState)
utilites:listen_command(FLIRSwitch)
utilites:listen_command(RadarOnOff_action)
utilites:listen_command(RadarSwitch)
utilites:listen_command(RadarState)
utilites:listen_command(landinglight_switch)
utilites:listen_command(landinglight_key)
utilites:listen_command(Landinglight_state)
utilites:listen_command(navlight_state)
utilites:listen_command(navlighton)
utilites:listen_command(navlightoff)
utilites:listen_command(navlight_switch)
utilites:listen_command(formationlight_switch)
utilites:listen_command(formationlight_key)
utilites:listen_command(anticollisionlight_key)
utilites:listen_command(anticollisionlight_switch)
utilites:listen_command(Keys.PlaneAutopiloth)
utilites:listen_command(Keys.PlaneStabHorizon)
utilites:listen_command(Keys.PlaneRouteAutopilot)
utilites:listen_command(Keys.PlaneStabHbar)
utilites:listen_command(Keys.PlaneSAUHorizon)
utilites:listen_command(iCommandPlaneStabHorizon)
utilites:listen_command(RECOVER)
utilites:listen_command(ECM_Click)
utilites:listen_command(ECM_key)
utilites:listen_command(HEA_state)
utilites:listen_command(HEA_switch)
utilites:listen_command(HEA_action)
utilites:listen_command(HUD2_switch)
utilites:listen_command(HUD2_state)
utilites:listen_command(HUD3_switch)
utilites:listen_command(HUD3_state)
utilites:listen_command(gear_switch)
utilites:listen_command(gear_state)
utilites:listen_command(hudonoff_switch)
utilites:listen_command(hudstate)
utilites:listen_command(lowspeed_state)
------------------------------------------------------------------FUNCTION-POST-INIT---------------------------------------------------------------------------------------------------
function post_initialize()
    birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" or birth == "AIR_HOT" then
        HideFc3Hud()
        navmode = 1
        RadarState = 0
        FLIRState = 0
        navlight_state = 0
        anticollisionlight_state = 1
        formationlight_state = 1
        dispatch_action(nil, 175)
        dispatch_action(nil, RadarOnOff_action)
        dispatch_action(nil, FLIROnOff_action)

        -- utilites:performClickableAction(navlight_switch,2,false)
        utilites:performClickableAction(RadarSwitch,1,false)
        utilites:performClickableAction(hudonoff_switch,1,false)
        utilites:performClickableAction(FlirSwitch,1,false)
        --GEAR DOWN 
    elseif birth == "GROUND_COLD" then
        RadarState = 0
        FLIRState = 0
        dispatch_action(nil, navmode_key)
        --GEAR UP
    end


end
------------------------------------------------------------------FUNCTION-SETCOMMAND---------------------------------------------------------------------------------------------------
function SetCommand(command,value)

    if command ==  fuel_cover_click and fuel_cover_state == 0 then
        fuel_cover_state = 1
        -- print_message_to_user("open")
    elseif command == fuel_cover_click and fuel_cover_state == 1 then
        fuel_cover_state = 0
        if fuel_probe_state == 1 then
            fuel_probe_state = 0
            dispatch_action(nil, fuel_probe_key)
        end
        -- print_message_to_user("close")
    end
    if command == hudonoff_switch and hudstate == 0 then
        hudstate = 1
    elseif command == hudonoff_switch and hudstate == 1 then
        hudstate = 0
    end
    if command == LOW_HT then 
        print_message_to_user("LOL")
    end

    if command == RECOVER then 
        dispatch_action(nil, Keys.PlaneAutopilot)
        dispatch_action(nil, Keys.PlaneSAUHorizon)
    end

    if command == AP then 
        dispatch_action(nil, Keys.PlaneAutopilot)
    end

    if command == TRK then 
        dispatch_action(nil, Keys.PlaneRouteAutopilot) 
    end

    if command == fuel_probe_click and fuel_probe_state == 0 and fuel_cover_state == 1 then
        fuel_probe_state = 1
        dispatch_action(nil, fuel_probe_key)
    elseif command == fuel_probe_click and fuel_probe_state == 1 and fuel_cover_state == 1 then
        fuel_probe_state = 0 
        dispatch_action(nil, fuel_probe_key)
    end

    if command == hook_key and hook_state == 0 then
        hook_state = 1
    elseif command == hook_key and hook_state == 1 then
        hook_state = 0
    end

    if command == hook_click then
        dispatch_action(nil,hook_key)
    end

    if command == parachute_key and parachute_state == 0 then
        parachute_state = 1
    elseif command == parachute_key and parachute_state == 1 then
        parachute_state = 0
    end


    if command == parachute_click and parachute_state == 0 then
        dispatch_action(nil,parachute_key)
    end

    if command == RadarOnOff_action and RadarState == 0 then 
        RadarState = 1 
    elseif command == RadarOnOff_action and RadarState == 1 then
        RadarState = 0 
    end
    if command == RadarSwitch then
        dispatch_action(nil,RadarOnOff_action)
    end

    if command == FLIROnOff_action and FLIRState == 0 then 
        FLIRState = 1 
    elseif command == FLIROnOff_action and FLIRState == 1 then
        FLIRState = 0 
    end
    if command == FlirSwitch then
        dispatch_action(nil,FLIROnOff_action)
    end

    if command == gear_switch and gear_state == 1 then
        gear_state = 0
    elseif command == gear_switch and gear_state == 0 then
        gear_state = 1
    end

    if command == HEA_switch and HEA_state == 0 then 
        HEA_state = 1 
    elseif command == HEA_switch and HEA_state == 1 then
        HEA_state = 0 
    end

    if command == HUD2_switch and HUD2_state == 0 then 
        HUD2_state = 1 
    elseif command == HUD2_switch and HUD2_state == 1 then
        HUD2_state = 0 
    end

    if command == HUD3_switch and HUD3_state == 0 then 
        HUD3_state = 1 
    elseif command == HUD3_switch and HUD3_state == 1 then
        HUD3_state = 0 
    end

    if command == airtoair_switch then 
        dispatch_action(nil, airtoair_key)
    elseif command == navmode_switch then
        dispatch_action(nil, navmode_key)
    end

    if command == landinglight_key and Landinglight_state == 0 then
        Landinglight_state = 1
        --print_message_to_user("BATTERY ON")--spell out what you are testing it makes it eaiser to track whats going on
    elseif command == landinglight_key and Landinglight_state == 1 then
        Landinglight_state = -1
    elseif command == landinglight_key and Landinglight_state == -1 then 
        Landinglight_state = 0
        --print_message_to_user("BATTERY OFF")
    end
    if command == landinglight_switch then 
        dispatch_action(nil, landinglight_key)
    end


    if command == navlight_switch and navlight_state == 0 then
        dispatch_action(nil, navlightoff)
        navlight_state = 1
    elseif command == navlight_switch and navlight_state == 1 then
        dispatch_action(nil, navlighton)
        navlight_state = -1
    elseif command == navlight_switch and navlight_state == -1 then
        dispatch_action(nil, navlighton)
        navlight_state = 0
    end
    if command == navlighton or navlightoff then 
        dispatch_action(nil, navlight_switch)
    end

    if command == formationlight_key and formationlight_state == 0 then
        formationlight_state = 1
        --print_message_to_user("BATTERY ON")--spell out what you are testing it makes it eaiser to track whats going on
    elseif command == formationlight_key and formationlight_state == 1 then
        formationlight_state = 0
    end
    if command == formationlight_switch then 
        dispatch_action(nil, formationlight_key)
    end

    if command == anticollisionlight_switch and anticollisionlight_state == 0 then
        anticollisionlight_state = 1
        dispatch_action(nil, 175)
        --print_message_to_user("BATTERY ON")--spell out what you are testing it makes it eaiser to track whats going on
    elseif command == anticollisionlight_switch and anticollisionlight_state == 1 then
        anticollisionlight_state = 0
        dispatch_action(nil, 175)
    end

    if command == ECM_switch and ECM_state == 0 then
        dispatch_action(nil, ECM_key)
        ECM_state = 1
    elseif command == ECM_switch and ECM_state == 1 then
        dispatch_action(nil, ECM_key)
        ECM_state = 0
    end


    if command == Keys.PlaneModeNAV  then
        navmode = 1
        bvrmode = 0
        vsmode = 0
        BOREmode = 0
        FIOmode = 0
        Groundmode = 0
        Cannonmode = 0
        Gridmode = 0
        HideFc3Hud()
        dispatch_action(nil, 749)
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeBVR  then
        bvrmode = 1
        vsmode = 0
        BOREmode = 0
        FIOmode = 0
        Groundmode = 0
        Cannonmode = 0
        Gridmode = 0
        navmode = 0
        ShowFc3Hud()
        --print_message_to_user("BVR_Mode") 
    elseif command == Keys.PlaneModeVS  then
        vsmode = 1
        bvrmode = 0
        BOREmode = 0
        FIOmode = 0
        Groundmode = 0
        Cannonmode = 0
        Gridmode = 0
        navmode = 0
        ShowFc3Hud()
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeBore  then
        BOREmode = 1
        bvrmode = 0
        vsmode = 0
        FIOmode = 0
        Groundmode = 0
        Cannonmode = 0
        Gridmode = 0
        navmode = 0
        ShowFc3Hud()
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeFI0  then
        FIOmode = 1
        bvrmode = 0
        vsmode = 0
        BOREmode = 0
        Groundmode = 0
        Cannonmode = 0
        Gridmode = 0
        navmode = 0
        ShowFc3Hud()
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeGround  then
        Groundmode = 1
        bvrmode = 0
        vsmode = 0
        BOREmode = 0
        FIOmode = 0
        Cannonmode = 0
        Gridmode = 0
        navmode = 0
        ShowFc3Hud()
        -- print_message_to_user(HMD_Mode)
    elseif command == Keys.PlaneModeCannon  then
        Cannonmode = 1
        bvrmode = 0
        vsmode = 0
        BOREmode = 0
        FIOmode = 0
        Groundmode = 0
        Gridmode = 0
        navmode = 0
        ShowFc3Hud()
    elseif command == Keys.PlaneModeGrid  then
        Gridmode = 1
        bvrmode = 0
        vsmode = 0
        BOREmode = 0
        FIOmode = 0
        Groundmode = 0
        Cannonmode = 0
        navmode = 0
        ShowFc3Hud()
    elseif command == Keys.PlaneModeHelmet  then
        Gridmode = 0
        bvrmode = 0
        vsmode = 0
        BOREmode = 0
        FIOmode = 0
        Groundmode = 0
        Cannonmode = 0
        navmode = 0
        ShowFc3Hud()
    end


    -- if command == iCommandHUDBrightnessDown then
    --     HUD_STATE = value
    --     HUD_REFERENCE = 0
    -- else command == iCommandHUDBrightnessUp then 
    --     HUD_STATE = value 
    --     HUD_REFERENCE = 1
    -- else 

    -- if command == AP then 
    --     dispatch_action(nil, iCommandPlaneAutopilot)
    -- elseif command == AT then
    --     dispatch_action(nil, iCommandPlaneStabHbar)
    -- elseif command == HDG then
    --     dispatch_action(nil, iCommandPlaneStabHorizon)
    -- elseif command == ALT then
    --     dispatch_action(nil, iCommandPlaneStabHbar)
    -- elseif command == TRK then
    --     dispatch_action(nil, iCommandPlaneRouteAutopilot)
    -- end


end
------------------------------------------------------------------FUNCTION-UPDATE---------------------------------------------------------------------------------------------------
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
        
    
end

local time = 0


function update()

    -- dispatch_action(nil,ICommandHUDBrightnessDown)
    parameters.FUELCOVER:set(fuel_cover_state)
    parameters.FUELPROBE:set(fuel_probe_state)
    parameters.LANDINGLIGHT:set(Landinglight_state)
    parameters.FORMATIONLIGHT:set(formationlight_state)
    set_aircraft_draw_argument_value(88,formationlight_state)
    parameters.ANTICOLLISIONLIGHT:set(anticollisionlight_state)
    -- print_message_to_user(formationlight_state)
    parameters.NAVLIGHT:set(navlight_state)
    -- print_message_to_user(low_height_state)
    parameters.HOOK:set(hook_state)
    parameters.PARACHUTE:set(parachute_state)
    -- parameters.RADARPARAM:set(RadarState)
    -- parameters.FLIRPARAM:set(FLIRState)
    parameters.nav_state:set(navmode)
    --parameters.A2AONOFF:set(bvrmode)
    parameters.HEAONOFF:set(HEA_state)
    parameters.HUD2ONOFF:set(HUD2_state)
    parameters.HUD3ONOFF:set(HUD3_state)
    parameters.GEARONOFF:set(gear_state)
    parameters.ECM:set(ECM_state)
    time = time + update_time_step
    if time >= 1.25 then
        time = 0
    end
    parameters.HUDONOFF:set(hudstate)
    if navlight_state == 0 then
        set_aircraft_draw_argument_value(191,1) 
        set_aircraft_draw_argument_value(192,1)
        -- set_cockpit_draw_argument_value(735,-1)
    elseif navlight_state == 1 then 
        if time <= 0.15 then
            set_aircraft_draw_argument_value(191,1) 
            set_aircraft_draw_argument_value(192,1)
        elseif time >= 0.30 and time <= 0.45 then 
            set_aircraft_draw_argument_value(191,1) 
            set_aircraft_draw_argument_value(192,1)
        else
            set_aircraft_draw_argument_value(191,0) 
            set_aircraft_draw_argument_value(192,0)
        end
        -- set_cockpit_draw_argument_value(735,0)
    elseif navlight_state == -1 then
        set_aircraft_draw_argument_value(191,0) 
        set_aircraft_draw_argument_value(192,0)

    end


    if anticollisionlight_state == 1 then
        if time <= 0.62 then
            set_aircraft_draw_argument_value(190,1) 
            set_aircraft_draw_argument_value(194,0)
        elseif time > 0.62 then
            set_aircraft_draw_argument_value(190,0) 
            set_aircraft_draw_argument_value(194,1)
        end
    end
    if anticollisionlight_state == 0 then 
        set_aircraft_draw_argument_value(190,-1) 
        set_aircraft_draw_argument_value(194,-1)
    end


    --print_message_to_user(hudstate)

    -- print_message_to_user(navmode)
    local FuelSwitchConnector = get_clickable_element_reference("Fuel_Probe")
    FuelSwitchConnector:update() -- ensure the connector moves too

    -- print_message_to_user(low_height_state)
    -- if HUD_REFERENCE < HUD_STATE then 
    --     dispatch_action(nil, iCommandHUDBrightnessDown, HUD_STATE)
    -- elseif HUD_REFERENCE > HUD_STATE then 
    --     dispatch_action(nil, iCommandHUDBrightnessUp, HUD_STATE)
    -- end
    local navlightconector = get_clickable_element_reference("Nav_Light")
    navlightconector:update() -- ensure the connector moves too

    local anticollconector = get_clickable_element_reference("AntiCollision")
    anticollconector:update() -- ensure the connector moves too

    --gear_state:update() -- ensure the connector moves too
end