dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")

local gettext = require("i_18n")
_ = gettext.translate

cursor_mode = 
{ 
    CUMODE_CLICKABLE = 0,
    CUMODE_CLICKABLE_AND_CAMERA  = 1,
    CUMODE_CAMERA = 2,
};

clickable_mode_initial_status  = cursor_mode.CUMODE_CLICKABLE
use_pointer_name			   = true

function default_button(hint_,device_,command_,upcommand_,arg_,arg_val_,arg_lim_)

	local   arg_val_ = arg_val_ or 1
	local   arg_lim_ = arg_lim_ or {0,1}

	return  {	
				class 				= {class_type.BTN},
				hint  				= hint_,
				device 				= device_,
				action 				= {command_},
				stop_action 		= {upcommand_},
				arg 				= {arg_},
				arg_value			= {arg_val_}, 
				arg_lim 			= {arg_lim_},
				use_release_message = {true}
			}
end

function default_1_position_tumb(hint_, device_, command_, arg_, arg_val_, arg_lim_)
	local   arg_val_ = arg_val_ or 1
	local   arg_lim_ = arg_lim_ or {0,1}
	return  {	
				class 		= {class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {arg_val_}, 
				arg_lim   	= {arg_lim_},
				updatable 	= true, 
				use_OBB 	= true
			}
end

function default_2_position_tumb(hint_, device_, command_, arg_)
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-1,1}, 
				arg_lim   	= {{0,1},{0,1}},
				updatable 	= true, 
				use_OBB 	= true
			}
end

-- default_2_position_tumb GRINNELLI F22 VERSION WITH SOUND
-- function default_2_position_tumb(hint_, device_, command_, arg_, sound_)
-- 	return  {	
-- 				class 		= {class_type.TUMB,class_type.TUMB},
-- 				hint  		= hint_,
-- 				device 		= device_,
-- 				action 		= {command_,command_},
-- 				arg 	  	= {arg_,arg_},
-- 				arg_value 	= {-1,1}, 
-- 				arg_lim   	= {{0,1},{0,1}},
-- 				updatable 	= true, 
-- 				use_OBB 	= true,
-- 				sound = sound_ and {{sound_,sound_}} or nil
-- 			}
-- end

function default_3_position_tumb(hint_,device_,command_,arg_,cycled_,inversed_)
	local cycled = true
	
	
	local val =  1
	if inversed_ then
	      val = -1
	end
	if cycled_ ~= nil then
	   cycled = cycled_
	end
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {val,-val}, 
				arg_lim   	= {{-1,1},{-1,1}},
				updatable 	= true, 
				use_OBB 	= true,
				cycle       = cycled
			}
end

function default_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_)
	
	local default = default_ or 1
	local gain = gain_ or 0.1
	local updatable = updatable_ or false
	local relative  = relative_ or false
	
	return  {	
				class 		= {class_type.LEV},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {default}, 
				arg_lim   	= {{0,1}},
				updatable 	= updatable, 
				use_OBB 	= true,
				gain		= {gain},
				relative    = {relative}, 				
			}
end

function default_movable_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_)
	
	local default = default_ or 1
	local gain = gain_ or 0.1
	local updatable = updatable_ or false
	local relative  = relative_ or false
	
	return  {	
				class 		= {class_type.MOVABLE_LEV},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {default}, 
				arg_lim   	= {{0,1}},
				updatable 	= updatable, 
				use_OBB 	= true,
				gain		= {gain},
				relative    = {relative}, 				
			}
end

function default_axis_limited(hint_,device_,command_,arg_,default_,gain_,updatable_,relative_,arg_lim_)
	local	default = default_ or 0
	local	updatable = updatable_ or false
	local	relative  = relative_ or false
	local	cycled_ = false
	local	arg_lim = arg_lim_ or {0,1}

	local	element = default_axis(hint_,device_,command_,arg_,default,gain_,updatable,relative,cycled_,attach_left_,attach_right_)
	element.arg_lim   	= {arg_lim}
	element.use_OBB 	= false
	return element
end


function multiposition_switch(hint_,device_,command_,arg_,count_,delta_,inversed_, min_)
    local min_   = min_ or 0
	local delta_ = delta_ or 0.5
	
	local inversed = 1
	if	inversed_ then
		inversed = -1
	end
	
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-delta_ * inversed,delta_ * inversed}, 
				arg_lim   	= {{min_, min_ + delta_ * (count_ -1)},
							   {min_, min_ + delta_ * (count_ -1)}},
				updatable 	= true, 
				use_OBB 	= true
			}
end

function multiposition_switch_limited(hint_,device_,command_,arg_,count_,delta_,inversed_,min_)
    local min_   = min_ or 0
	local delta_ = delta_ or 0.5
	
	local inversed = 1
	if	inversed_ then
		inversed = -1
	end
	
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-delta_ * inversed,delta_ * inversed}, 
				arg_lim   	= {{min_, min_ + delta_ * (count_ -1)},
							   {min_, min_ + delta_ * (count_ -1)}},
				updatable 	= true, 
				use_OBB 	= true,
				cycle     	= false, 
			}
end

function default_button_axis(hint_, device_,command_1, command_2, arg_1, arg_2, limit_1, limit_2)
	local limit_1_   = limit_1 or 1.0
	local limit_2_   = limit_2 or 1.0
return {
			class		=	{class_type.BTN, class_type.LEV},
			hint		=	hint_,
			device		=	device_,
			action		=	{command_1, command_2},
			stop_action =   {command_1, 0},
			arg			=	{arg_1, arg_2},
			arg_value	= 	{1, 0.5},
			arg_lim		= 	{{0, limit_1_}, {0,limit_2_}},
			animated        = {false,true},
			animation_speed = {0, 0.4},
			gain = {0, 0.1},
			relative	= 	{false, false},
			updatable 	= 	true, 
			use_OBB 	= 	true,
			use_release_message = {true, false}
	}
end

function default_animated_lever(hint_, device_, command_, arg_, animation_speed_,arg_lim_)
local arg_lim__ = arg_lim_ or {0.0,1.0}
return  {	
	class  = {class_type.TUMB, class_type.TUMB},
	hint   	= hint_, 
	device 	= device_,
	action 	= {command_, command_},
	arg 		= {arg_, arg_},
	arg_value 	= {1, 0},
	arg_lim 	= {arg_lim__, arg_lim__},
	updatable  = true, 
	gain 		= {0.1, 0.1},
	animated 	= {true, true},
	animation_speed = {animation_speed_, 0},
	cycle = true
}
end

function default_button_tumb(hint_, device_, command1_, command2_, arg_)
	return  {	
				class 		= {class_type.BTN,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command1_,command2_},
				stop_action = {command1_,0},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-1,1}, 
				arg_lim   	= {{-1,0},{0,1}},
				updatable 	= true, 
				use_OBB 	= true,
				use_release_message = {true,false}
			}
end

elements = {}

-- Systems
-- elements["PNT_083"] = default_2_position_tumb("Landing Gear Handle", devices.GEAR_SYSTEM, click_cmd.GearLevel, 83)
-- elements["PNT_107"] = default_2_position_tumb("Battery Switch", devices.ELECTRIC_SYSTEM, Keys.BatteryPower, 107)

-- Power
           --function default_2_position_tumb(hint_, device_, command_, arg_)
elements["Battery"] 		 	= default_2_position_tumb("Battery On/Off",  devices.ELECTRIC_SYSTEM, device_commands.BatterySwitchClick, 700)
elements["L_Gen"] 		 		= default_2_position_tumb("Left Gen On/Off",  devices.ELECTRIC_SYSTEM, device_commands.GenRightSwitch, 702)
elements["R_Gen"] 		 		= default_2_position_tumb("Right Gen On/Off",  devices.ELECTRIC_SYSTEM, device_commands.GenLeftSwitch, 703)
elements["Parking_Brake"] 		= default_2_position_tumb("Parking Brake On/Off",  devices.PARKING_BRAKE, device_commands.ParkingBrakeSwitch, 706)

elements["Fuel_prove_Cover"]    = default_2_position_tumb("Fuel Cover", devices.UTILITIES, device_commands.FuelProbeCover, 750)
elements["Fuel_Probe"]    		= default_2_position_tumb("Fuel Prove Switch", devices.UTILITIES, device_commands.FuelProbeSwitch, 751)
elements["HOOK"]    			= default_2_position_tumb("Hook Up/Down", devices.UTILITIES, device_commands.HookSwitch, 707)
elements["PNT_083"]				= default_2_position_tumb("Gear Up/Down", devices.GEAR_SYSTEM, device_commands.GearSwitch, 83)

elements["RCOVER"]      		= default_2_position_tumb("Right LP COCK Cover", devices.ENGINE, device_commands.RCOVER, 799)
elements["R_Engine_Crank"]    	= default_2_position_tumb("Right LP COCK Switch", devices.ENGINE, device_commands.FuelPumpRight, 705)
elements["LCOVER"]      		= default_2_position_tumb("Left LP COCK Cover", devices.ENGINE, device_commands.LCOVER, 699)
elements["L_Engine_Crank"]    	= default_2_position_tumb("Left LP COCK Switch", devices.ENGINE, device_commands.FuelPumpLeft, 698)

elements["APU-C"]	 		        = default_button_tumb("APU On/Standby/Off", devices.ENGINE, device_commands.APUON, device_commands.APUSTANDBYOFF,728 )  -- Falta la funcion 
elements["ECS"]	 		        = default_2_position_tumb("Environmental Control System On/Off", devices.ENGINE, device_commands.ECS,729 )  -- Falta la funcion 
elements["AIR_DRIVE"]	 		= default_3_position_tumb("Environmental Control System On/Off", devices.ENGINE, device_commands.AIRDRIVE,730 )  -- Falta la funcion 

elements["Canopy_click"]	    = default_2_position_tumb("Canopy Open/Close", devices.CANOPY, device_commands.CanopySwitch, 701)

-- Autopilot
elements["AP"]	   				= default_button("Autopilot On/Off", devices.UTILITIES, device_commands.AP, nil, nil, nil)
elements["AT"]	   				= default_button("Autothrottle On/Off", devices.UTILITIES, device_commands.AT, nil, nil, nil)
elements["HDG"]	   				= default_button("Mantain Heading", devices.UTILITIES, device_commands.HDG, nil, nil, nil)
elements["TRK"]	    			= default_button("Follow route", devices.UTILITIES, device_commands.TRK, nil, nil, nil)
elements["ALT"]	   				= default_button("Altitude Mantain", devices.UTILITIES, device_commands.ALT, nil, nil, nil)
elements["DIS_RECOVER"]	   		= default_button("Disorientation Recover", devices.UTILITIES, device_commands.RECOVER, nil)

-- Utiles
elements["RADAR"] 		 		= default_2_position_tumb("RADAR On/Off",  devices.UTILITIES, device_commands.RADARONOFF, 717)
elements["A/A"] 		 		= default_button("Air to Air mode",  devices.UTILITIES, device_commands.AIRTOAIR, nil,nil,nil)
elements["NAV_C"] 		 		= default_button("Navigation mode",  devices.UTILITIES, device_commands.NAVMODE, nil,nil,nil)
elements["GND"]					= default_button("Air to Ground mode", devices.UTILITES, Keys.PlaneModeGround, nil,nil,nil)
elements["A/S"]					= default_button("Air to Ground mode", devices.UTILITES, Keys.PlaneModeGround, nil,nil,nil)
elements["Nav_Light"]	 		= default_3_position_tumb("Navigation Lights On/Off", devices.UTILITIES, device_commands.NAVONOFF, 735)
elements["LDG_LIGHT"] 			= default_3_position_tumb("OFF/Landing/Taxi", devices.UTILITIES, device_commands.LANDONOFF, 740)
elements["AntiCollision"] 		= default_2_position_tumb("Anti Collision Lights On/Off", devices.UTILITIES, device_commands.ACOLLISIONONOFF, 741) 
elements["Form_Lights"] 		= default_axis("Formation Lights On/Off", devices.UTILITIES, device_commands.FORMATIONONOFF, 742, 0, 0.1,true,false) 
elements["R_BoostPump"] 		= default_2_position_tumb("R Boost Pump On/Off",  devices.ENGINE, device_commands.RBOOST, 726)
elements["L_BoostPump"] 		= default_2_position_tumb("L Boost Pump On/Off",  devices.ENGINE, device_commands.LBOOST, 727)
elements["PARACHUTE"] 		 	= default_2_position_tumb("Delpoy Parachute",  devices.UTILITIES, device_commands.DRAGCHUTE, 752)


-- Usless
elements["MAW"] 		 		= default_2_position_tumb("MAW On/Off",  devices.UTILITIES, device_commands.MAWONOFF, 713)
elements["INT"] 		 		= default_2_position_tumb("INT On/Off",  devices.UTILITIES, device_commands.INTONOFF, 714)
elements["XPDR"] 		 		= default_2_position_tumb("XPDR On/Off",  devices.UTILITIES, device_commands.XPDRONOFF, 715)
elements["FLIR"] 		 		= default_2_position_tumb("FLIR On/Off",  devices.UTILITIES, device_commands.FLIRONOFF, 716)
elements["HEA"] 		 		= default_2_position_tumb("HEA On/Off",  devices.UTILITIES, device_commands.HEA, 718)  --HMD Switch
elements["ECM"] 		 		= default_2_position_tumb("ECK On/Off",  devices.UTILITIES, device_commands.ECKONOFF, 719)
elements["R_ALT"] 		 		= default_2_position_tumb("R ALT On/Off",  devices.UTILITIES, device_commands.R_ALTONOFF, 720)
elements["HTA"] 		 		= default_2_position_tumb("FBW On/Off",  devices.FBW_SYSTEM, device_commands.FBWONOFF, 721)
elements["Mids"] 		 		= default_2_position_tumb("MIDS On/Off",  devices.UTILITIES, device_commands.MidsONOFF, 722)
elements["Radio_02"] 		 	= default_2_position_tumb("Radio 2 On/Off",  devices.UTILITIES, device_commands.Radio_02ONOFF, 723)
elements["Radio_01"] 		 	= default_2_position_tumb("Radio 1 On/Off",  devices.UTILITIES, device_commands.Radio_01ONOFF, 724)
elements["Voice"] 		 		= default_2_position_tumb("VOICE On/Off",  devices.UTILITIES, device_commands.VoiceONOFF, 725)

---HUD

elements["HUD02"]			    	= default_button("HUD BUTTON 2", devices.UTILITIES, device_commands.HUD02 , 726)
elements["HUD01"]					= default_button("HUD BUTTON 1", devices.HUD, device_commands.HUD01 , nil,nil,nil)
elements["HUD03"]					= default_button("HUD BUTTON 3", devices.UTILITIES, device_commands.HUD03 , nil,nil,nil)
elements["HUD04"]					= default_button("HUD BUTTON 4", devices.HUD, device_commands.HUD04 , nil,nil,nil)
elements["HUD05"]					= default_button("HUD BUTTON 5", devices.HUD, device_commands.HUD05 , nil,nil,nil)
elements["HUDONOFF"]			    = default_2_position_tumb("HUD SWITCH", devices.UTILITIES, device_commands.HUD , 772)

-- elements["LOW_HT"] 				= default_axis_limited("Low Height Advisory",  devices.UTILITES, device_commands.LOW_HT,743,0,0.1334,false,false,0.5)
for i,o in pairs(elements) do
	if  o.class[1] == class_type.TUMB or 
	   (o.class[2]  and o.class[2] == class_type.TUMB) or
	   (o.class[3]  and o.class[3] == class_type.TUMB)  then
	   o.updatable = true
	   o.use_OBB   = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------MFDL------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
elements["MFDL-01"]					= default_button("MFD BUTTON 1", devices.MFDL, device_commands.MFDL1 , nil,nil,nil)
elements["MFDL-02"]					= default_button("MFD BUTTON 2", devices.MFDL, device_commands.MFDL2 , nil,nil,nil)
elements["MFDL-03"]					= default_button("MFD BUTTON 3", devices.MFDL, device_commands.MFDL3 , nil,nil,nil)
elements["MFDL-04"]					= default_button("MFD BUTTON 4", devices.MFDL, device_commands.MFDL4 , nil,nil,nil)
elements["MFDL-05"]					= default_button("MFD BUTTON 5", devices.MFDL, device_commands.MFDL5 , nil,nil,nil)
elements["MFDL-06"]					= default_button("MFD BUTTON 6", devices.MFDL, device_commands.MFDL6 , nil,nil,nil)
elements["MFDL-07"]					= default_button("MFD BUTTON 7", devices.MFDL, device_commands.MFDL7 , nil,nil,nil)
elements["MFDL-08"]					= default_button("MFD BUTTON 8", devices.MFDL, device_commands.MFDL8 , nil,nil,nil)
elements["MFDL-09"]					= default_button("MFD BUTTON 9", devices.MFDL, device_commands.MFDL9 , nil,nil,nil)
elements["MFDL-010"]					= default_button("MFD BUTTON 10", devices.MFDL, device_commands.MFDL10 , nil,nil,nil)
elements["MFDL-011"]					= default_button("MFD BUTTON 11", devices.MFDL, device_commands.MFDL11 , nil,nil,nil)
elements["MFDL-012"]					= default_button("MFD BUTTON 12", devices.MFDL, device_commands.MFDL12 , nil,nil,nil)
elements["MFDL-013"]					= default_button("MFD BUTTON 13", devices.MFDL, device_commands.MFDL13 , nil,nil,nil)
elements["MFDL-014"]					= default_button("MFD BUTTON 14", devices.MFDL, device_commands.MFDL14 , nil,nil,nil)
elements["MFDL-015"]					= default_button("MFD BUTTON 15", devices.MFDL, device_commands.MFDL15 , nil,nil,nil)
elements["MFDL-016"]					= default_button("MFD BUTTON 16", devices.MFDL, device_commands.MFDL16 , nil,nil,nil)
elements["MFDL-017"]					= default_button("MFD BUTTON 17", devices.MFDL, device_commands.MFDL17 , nil,nil,nil)
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------MFDR------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
elements["MFDR-01"]					= default_button("MFD BUTTON 1", devices.MFDR, device_commands.MFDR1 , nil,nil,nil)
elements["MFDR-02"]					= default_button("MFD BUTTON 2", devices.MFDR, device_commands.MFDR2 , nil,nil,nil)
elements["MFDR-03"]					= default_button("MFD BUTTON 3", devices.MFDR, device_commands.MFDR3 , nil,nil,nil)
elements["MFDR-04"]					= default_button("MFD BUTTON 4", devices.MFDR, device_commands.MFDR4 , nil,nil,nil)
elements["MFDR-05"]					= default_button("MFD BUTTON 5", devices.MFDR, device_commands.MFDR5 , nil,nil,nil)
elements["MFDR-06"]					= default_button("MFD BUTTON 6", devices.MFDR, device_commands.MFDR6 , nil,nil,nil)
elements["MFDR-07"]					= default_button("MFD BUTTON 7", devices.MFDR, device_commands.MFDR7 , nil,nil,nil)
elements["MFDR-08"]					= default_button("MFD BUTTON 8", devices.MFDR, device_commands.MFDR8 , nil,nil,nil)
elements["MFDR-09"]					= default_button("MFD BUTTON 9", devices.MFDR, device_commands.MFDR9 , nil,nil,nil)
elements["MFDR-010"]					= default_button("MFD BUTTON 10", devices.MFDR, device_commands.MFDR10 , nil,nil,nil)
elements["MFDR-011"]					= default_button("MFD BUTTON 11", devices.MFDR, device_commands.MFDR11 , nil,nil,nil)
elements["MFDR-012"]					= default_button("MFD BUTTON 12", devices.MFDR, device_commands.MFDR12 , nil,nil,nil)
elements["MFDR-013"]					= default_button("MFD BUTTON 13", devices.MFDR, device_commands.MFDR13 , nil,nil,nil)
elements["MFDR-014"]					= default_button("MFD BUTTON 14", devices.MFDR, device_commands.MFDR14 , nil,nil,nil)
elements["MFDR-015"]					= default_button("MFD BUTTON 15", devices.MFDR, device_commands.MFDR15 , nil,nil,nil)
elements["MFDR-016"]					= default_button("MFD BUTTON 16", devices.MFDR, device_commands.MFDR16 , nil,nil,nil)
elements["MFDR-017"]					= default_button("MFD BUTTON 17", devices.MFDR, device_commands.MFDR17 , nil,nil,nil)
---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------MFDC------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
elements["MFDC-01"]					= default_button("MFD BUTTON 1", devices.MFDC, device_commands.MFDC1 , nil,nil,nil)
elements["MFDC-02"]					= default_button("MFD BUTTON 2", devices.MFDC, device_commands.MFDC2 , nil,nil,nil)
elements["MFDC-03"]					= default_button("MFD BUTTON 3", devices.MFDC, device_commands.MFDC3 , nil,nil,nil)
elements["MFDC-04"]					= default_button("MFD BUTTON 4", devices.MFDC, device_commands.MFDC4 , nil,nil,nil)
elements["MFDC-05"]					= default_button("MFD BUTTON 5", devices.MFDC, device_commands.MFDC5 , nil,nil,nil)
elements["MFDC-06"]					= default_button("MFD BUTTON 6", devices.MFDC, device_commands.MFDC6 , nil,nil,nil)
elements["MFDC-07"]					= default_button("MFD BUTTON 7", devices.MFDC, device_commands.MFDC7 , nil,nil,nil)
elements["MFDC-08"]					= default_button("MFD BUTTON 8", devices.MFDC, device_commands.MFDC8 , nil,nil,nil)
elements["MFDC-09"]					= default_button("MFD BUTTON 9", devices.MFDC, device_commands.MFDC9 , nil,nil,nil)
elements["MFDC-010"]					= default_button("MFD BUTTON 10", devices.MFDC, device_commands.MFDC10 , nil,nil,nil)
elements["MFDC-011"]					= default_button("MFD BUTTON 11", devices.MFDC, device_commands.MFDC11 , nil,nil,nil)
elements["MFDC-012"]					= default_button("MFD BUTTON 12", devices.MFDC, device_commands.MFDC12 , nil,nil,nil)
elements["MFDC-013"]					= default_button("MFD BUTTON 13", devices.MFDC, device_commands.MFDC13 , nil,nil,nil)
elements["MFDC-014"]					= default_button("MFD BUTTON 14", devices.MFDC, device_commands.MFDC14 , nil,nil,nil)
elements["MFDC-015"]					= default_button("MFD BUTTON 15", devices.MFDC, device_commands.MFDC15 , nil,nil,nil)
elements["MFDC-016"]					= default_button("MFD BUTTON 16", devices.MFDC, device_commands.MFDC16 , nil,nil,nil)
elements["MFDC-017"]					= default_button("MFD BUTTON 17", devices.MFDC, device_commands.MFDC17 , nil,nil,nil)
---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------