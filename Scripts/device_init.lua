dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")
dofile(LockOn_Options.script_path.."Terrain.lua")
dofile(LockOn_Options.script_path.."materials.lua") 
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
dofile(LockOn_Options.script_path.."avRadar_example/radarexample_device_init.lua")

-- set panel
layoutGeometry = {}

mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")

attributes = {
	"support_for_cws",
	-- "avNightVisionGoggles",
}
---------------------------------------------
MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua"}

creators = {}

creators[devices.ELECTRIC_SYSTEM] 	={"avSimpleElectricSystem"			,LockOn_Options.script_path.."Systems/electric_system.lua"}
creators[devices.PARAMETERS] 		={"avLuaDevice"			,LockOn_Options.script_path.."Systems/Parameters.lua"}
creators[devices.CANOPY] 			={"avLuaDevice"			,LockOn_Options.script_path.."Systems/canopy_system.lua"}
creators[devices.UTILITIES] 		={"avLuaDevice"			,LockOn_Options.script_path.."Systems/utilites.lua"}
creators[devices.ENGINE] 			={"avLuaDevice"			,LockOn_Options.script_path.."Systems/engine_system.lua"}
creators[devices.PARKING_BRAKE] 	={"avLuaDevice"			,LockOn_Options.script_path.."Systems/Parking_brake.lua"}
creators[devices.SLAT_SYSTEM]       ={"avLuaDevice"         ,LockOn_Options.script_path.."Systems/slat_system.lua"}
creators[devices.FLAP_SYSTEM]       ={"avLuaDevice"         ,LockOn_Options.script_path.."Systems/flap_system.lua"}
creators[devices.FCS_SYSTEM]        ={"avLuaDevice"         ,LockOn_Options.script_path.."Systems/fcs_system.lua"}
creators[devices.SUPERSONIC_SYSTEM] ={"avLuaDevice"         ,LockOn_Options.script_path.."Systems/supersonic_system.lua"}
creators[devices.FBW_SYSTEM]        ={"avLuaDevice"         ,LockOn_Options.script_path.."Systems/fbw_system.lua"}
-- creators[devices.FBW_SYSTEM_API]    ={"avLuaDevice"         ,LockOn_Options.script_path.."Systems/fbw_system_api.lua"}
creators[devices.GEAR_SYSTEM]     	={"avLuaDevice"          ,LockOn_Options.script_path.."Systems/gear_system.lua"}
creators[devices.GROUND]     		={"avLuaDevice"          ,LockOn_Options.script_path.."Systems/ground.lua"}
creators[devices.ADI]             	={"avLuaDevice"         ,LockOn_Options.script_path.."ADI/Device/device.lua"}
creators[devices.UFC]             	={"avLuaDevice"         ,LockOn_Options.script_path.."UFC/Device/device.lua"}
-- creators[devices.LOW_HT]            ={"avLuaDevice"         ,LockOn_Options.script_path.."LOW_HT/Device/device.lua"}
creators[devices.HMD]             	={"avLuaDevice"         ,LockOn_Options.script_path.."HMD/Device/device.lua"}
creators[devices.APU]             	={"avLuaDevice"         ,LockOn_Options.script_path.."Systems/engine_system.lua"}
creators[devices.HUD]             	={"avLuaDevice"         ,LockOn_Options.script_path.."HUD/Device/device.lua"}
creators[devices.MFDL]             	={"avLuaDevice"         ,LockOn_Options.script_path.."MFD-L/Device/device.lua"}
creators[devices.MFDR]             	={"avLuaDevice"         ,LockOn_Options.script_path.."MFD-R/Device/device.lua"}
creators[devices.RADAR]				={"avSimpleRadar"		,LockOn_Options.script_path.."avRadar_example/Device/Radar_init.lua"}
creators[devices.MISC_ELEC]			={"avSimpleElectricSystem",LockOn_Options.script_path.."avRWR_example/miscSystems/simple_electric_system.lua"}
creators[devices.RWR]				={"avSimpleRWR"			,LockOn_Options.script_path.."avRWR_example/Device/RWR_init.lua"}
creators[devices.NVG]				={"avNightVisionGoggles"}
	

-- Indicators
indicators = {}
--ADI
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."ADI/Indicator/init.lua",--init script
 nil,
  {	
	{"ADI-CENTER","ADI-DOWN","ADI-RIGHT"}, -- initial geometry anchor , triple of connector names 
	{sx_l =  0,  -- center position correction in meters (forward , backward)
	 sy_l =  0,  -- center position correction in meters (up , down)
	 sz_l =  0,  -- center position correction in meters (left , right)
	 sh   =  0,  -- half height correction 
	 sw   =  0,  -- half width correction 
	 rz_l =  0,  -- rotation corrections  
	 rx_l =  0,
	 ry_l =  0}
  }
} 

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HUD/Indicator/init.lua",--init script
 nil,
  {	
	{"HUD-CENTER"}, -- initial geometry anchor , triple of connector names 
	{sx_l =  0.0,  -- center position correction in meters (forward , backward)
	 sy_l =  0.0,  -- center position correction in meters (up , down)
	 sz_l =  0.00,  -- center position correction in meters (left , right)
	 sh   =  0,  -- half height correction 
	 sw   =  0,  -- half width correction 
	 rz_l =  0,  -- rotation corrections  
	 rx_l =  0,
	 ry_l =  0}
  }
} 

-- UFC
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."UFC/Indicator/init.lua",--init script
 nil,
  {	
	{"UFC-CENTER","UFC-DOWN","UFC-RIGHT"}, -- initial geometry anchor , triple of connector names 
	{sx_l =  0,  -- center position correction in meters (forward , backward)
	 sy_l =  0,  -- center position correction in meters (up , down)
	 sz_l =  0,  -- center position correction in meters (left , right)
	 sh   =  0,  -- half height correction 
	 sw   =  0,  -- half width correction 
	 rz_l =  0,  -- rotation corrections  
	 rx_l =  0,
	 ry_l =  0}
  }
} 

-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."avRadar_example/indicator/init.lua",--init script
--  nil,
--   {	
-- 	{"MFD-R-CENTER","MFD-R-DOWN","MFD-R-RIGHT"}, -- initial geometry anchor , triple of connector names 
-- 	{sx_l =  0,  -- center position correction in meters (forward , backward)
-- 	 sy_l =  0,  -- center position correction in meters (up , down)
-- 	 sz_l =  0,  -- center position correction in meters (left , right)
-- 	 sh   =  0,  -- half height correction 
-- 	 sw   =  0,  -- half width correction 
-- 	 rz_l =  0,  -- rotation corrections  
-- 	 rx_l =  0,
-- 	 ry_l =  0}
--   }
-- } 

--indicators[#indicators + 1] = 	{
	--"ccIndicator",
	--LockOn_Options.script_path.."avRWR_example/indicator/init.lua",
	--nil,
	--{	
		--{"TEWS-PLASHKA-CENTER","TEWS-PLASHKA-DOWN","TEWS-PLASHKA-RIGHT"},
		--{
		--sz_l = 0.0,sx_l = 0.0, sy_l =  0.0  -- -0.14	-- -0.3
		--},
		--1
	--}
--}			

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HMD/Indicator/init.lua",--init script
 	nil,
  	{	
		{}, -- initial geometry anchor , triple of connector names 
		{sx_l =  0,  -- center position correction in meters (forward , backward)
		sy_l =  0.0,  -- center position correction in meters (up , down)
		sz_l =  0.0,  -- center position correction in meters (left , right)
		sh   =  0,  -- half height correction 
		sw   =  0,  -- half width correction 
		rz_l =  0,  -- rotation corrections  
		rx_l =  0,
		ry_l =  0}
 	}
} 


indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."APU/Indicator/init.lua",--init script
 nil,
  {	
	{"APU"}, -- initial geometry anchor , triple of connector names 
	{sx_l =  0,  -- center position correction in meters (forward , backward)
	 sy_l =  -0.0012,  -- center position correction in meters (up , down)
	 sz_l =  0,  -- center position correction in meters (left , right)
	 sh   =  0,  -- half height correction 
	 sw   =  0,  -- half width correction 
	 rz_l =  0,  -- rotation corrections  
	 rx_l =  0,
	 ry_l =  0}
  }
} 

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."MFD-L/Indicator/init.lua",--init script
 nil,
  {	
	{"MFD-L-CENTER","MFD-L-DOWN","MFD-L-RIGHT"}, -- initial geometry anchor , triple of connector names 
	{sx_l =  0,  -- center position correction in meters (forward , backward)
	 sy_l =  0,  -- center position correction in meters (up , down)
	 sz_l =  0,  -- center position correction in meters (left , right)
	 sh   =  0,  -- half height correction 
	 sw   =  0,  -- half width correction 
	 rz_l =  0,  -- rotation corrections  
	 rx_l =  0,
	 ry_l =  0}
  }
} 

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."MFD-R/Indicator/init.lua",--init script
 nil,
  {	
	{"MFD-R-CENTER","MFD-R-DOWN","MFD-R-RIGHT"}, -- initial geometry anchor , triple of connector names 
	{sx_l =  0,  -- center position correction in meters (forward , backward)
	 sy_l =  0,  -- center position correction in meters (up , down)
	 sz_l =  0,  -- center position correction in meters (left , right)
	 sh   =  0,  -- half height correction 
	 sw   =  0,  -- half width correction 
	 rz_l =  0,  -- rotation corrections  
	 rx_l =  0,
	 ry_l =  0}
  }
} 

-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."LOW_HT/Indicator/init.lua",--init script
--  	nil,
--   	{	
-- 		{"LOW_HT_CENTER"}, -- initial geometry anchor , triple of connector names 
-- 		{sx_l =  0,  -- center position correction in meters (forward , backward)
-- 		sy_l =  0.0,  -- center position correction in meters (up , down)
-- 		sz_l =  0.0,  -- center position correction in meters (left , right)
-- 		sh   =  0,  -- half height correction 
-- 		sw   =  0,  -- half width correction 
-- 		rz_l =  0,  -- rotation corrections  
-- 		rx_l =  0,
-- 		ry_l =  0}
--  	}
-- } 
---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
---------------------------------------------
