--put this line into your device_init.lua
--dofile(LockOn_Options.script_path.."avRadar_example/radarexample_device_init.lua")

--[[
in the part where you define your AC, you need to specify the radar:


Sensors = {
		RADAR = "N-019", -- Radar type
		--RADAR = "AN/APQ-159",
		},

]]--

		


		
	creators[130]	= 	{ 
									"avSimpleElectricSystem",
									LockOn_Options.script_path.."avRadar_example/miscSystems/simple_electric_system.lua"
								}
								
	creators[131]		= {	"avSimpleRadar"			,
							LockOn_Options.script_path.."avRadar_example/Device/Radar_init.lua"}
------------------------------------------------------------------------------------------------------------								  
-- INDICATORS ----------------------------------------------------------------------------------------------
----
	indicators[#indicators + 1] = 	{
										"ccIndicator",
										
										LockOn_Options.script_path.."avRadar_example/indicator/init.lua",
										nil,
									--	devices.avionics,
										{	
											{},
											{
											sz_l = 0.0,sx_l = -0.50, sy_l =  -0.07  -- -0.14	-- -0.3
											},
											1
										}
									}			

	



------------------------------------------------------------------------------------------------------------								
------------------------------------------------------------------------------------------------------------								
------------------------------------------------------------------------------------------------------------								
		
								
								