dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")

-- set panel
layoutGeometry = {}

mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")

attributes = {
	-- "support_for_cws",
	-- "avNightVisionGoggles",
}
---------------------------------------------
MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua"}

creators = {}


creators[devices.HUD]             	={"avLuaDevice"         ,LockOn_Options.script_path.."HUD/Device/device.lua"}
-- creators[devices.NVG]				={"avNightVisionGoggles"}
	

-- Indicators
indicators = {}
--HUD
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HUD/Indicator/init.lua",--init script
 nil,
  {	
	{"PTN-HUD-CENTER"}, -- initial geometry anchor , triple of connector names 
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

---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
---------------------------------------------
