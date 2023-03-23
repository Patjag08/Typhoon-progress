shape_name   	   = "Cockpit_Eurofighter"
is_EDM			   = true
new_model_format   = true
ambient_light    = {255,255,255} --R,G,B, I
ambient_color_day_texture    = {72, 100, 160}
ambient_color_night_texture  = {40, 60 ,150}
ambient_color_from_devices   = {50, 50, 40}
ambient_color_from_panels	 = {35, 25, 25}

dusk_border					 = 0.4
draw_pilot					 = false

external_model_canopy_arg	 = 38


day_texture_set_value   = 0.0
night_texture_set_value = 0.1

local  aircraft = get_aircraft_type()

local controllers = LoRegisterPanelControls()

use_external_views = false

mirrors_data = 
{
    center_point 	= {-0.6,-0.40,0.00},
    width 		 	= 0.8,
    aspect 		 	= 1.7, 
	rotation 	 	= math.rad(-20);
	animation_speed = 2.0;
	near_clip 		= 0.1;
	middle_clip		= 10;
	far_clip		= 60000;
}

mirrors_draw                    = CreateGauge()
mirrors_draw.arg_number    		= 16
mirrors_draw.input   			= {0,1}
mirrors_draw.output   			= {1,0}
mirrors_draw.controller         = controllers.mirrors_draw



RudderPedals						= CreateGauge()
RudderPedals.arg_number				= 500
RudderPedals.input					= {-100,100}
RudderPedals.output					= {1,-1}
RudderPedals.controller				= controllers.base_gauge_RudderPosition

ThrottleL							= CreateGauge()
ThrottleL.arg_number				= 104
ThrottleL.input						= {0, 100}
ThrottleL.output					= {0, 1}
ThrottleL.controller				= controllers.base_gauge_ThrottleLeftPosition

ThrottleR							= CreateGauge()
ThrottleR.arg_number				= 105
ThrottleR.input						= {0, 100}
ThrottleR.output					= {0, 1}
ThrottleR.controller				= controllers.base_gauge_ThrottleRightPosition

StickPitch							= CreateGauge("parameter")
StickPitch.arg_number				= 1001
StickPitch.input					= {-1, 1}
StickPitch.output					= {1, -1}
StickPitch.controller				= "PITCH_INPUT" 

StickRoll							= CreateGauge("parameter")
StickRoll.arg_number				= 1002
StickRoll.input						= {-1, 1}
StickRoll.output					= {-1, 1}
StickRoll.controller				= "ROLL_INPUT" 

-- Battery_click					    = CreateGauge("parameter")
-- Battery_click.arg_number		    = 700
-- Battery_click.input				    = {0, 1}
-- Battery_click.output			    = {0, 1}
-- Battery_click.parameter_name	    = "BATTERY" 

Battery_click					    = CreateGauge("parameter")
Battery_click.arg_number		    = 700
Battery_click.input				    = {0, 1}
Battery_click.output			    = {0, 1}
Battery_click.parameter_name	    = "BATTERY" 

Battery_click					    = CreateGauge("parameter")
Battery_click.arg_number		    = 700
Battery_click.input				    = {0, 1}
Battery_click.output			    = {0, 1}
Battery_click.parameter_name	    = "BATTERY" 

Rightgen_click					    = CreateGauge("parameter")
Rightgen_click.arg_number		    = 702
Rightgen_click.input				= {0, 1}
Rightgen_click.output			    = {0, 1}
Rightgen_click.parameter_name	    = "RGEN"

Leftgen_click					    = CreateGauge("parameter")
Leftgen_click.arg_number		    = 703
Leftgen_click.input				    = {0, 1}
Leftgen_click.output			    = {0, 1}
Leftgen_click.parameter_name	    = "LGEN"

Gear_click					        = CreateGauge("parameter")
Gear_click.arg_number		        = 83
Gear_click.input				    = {0, 1}
Gear_click.output			        = {0, 1}
Gear_click.parameter_name	        = "GEAR" 

canopy_click					    = CreateGauge("parameter")
canopy_click.arg_number		           = 701
canopy_click.input				    = {0, 1}
canopy_click.output			        = {0, 1}
canopy_click.parameter_name	        = "CANOPY" 

fbw_click					        = CreateGauge("parameter")
fbw_click.arg_number		        = 721
fbw_click.input				        = {0, 1}
fbw_click.output			        = {0, 1}
fbw_click.parameter_name	        = "FBWONOFF" 

landing_light					    = CreateGauge("parameter")
landing_light.arg_number		    = 740
landing_light.input				    = {-1, 0, 1}
landing_light.output			    = {1, 0, -1}
landing_light.parameter_name	    = "LANDINGLIGHT" 

nav_light					        = CreateGauge("parameter")
nav_light.arg_number		        = 735
nav_light.input				        = {-1, 1}
nav_light.output			        = {-1, 1}
nav_light.parameter_name	        = "NAVLIGHT" 

acoll_light					        = CreateGauge("parameter")
acoll_light.arg_number		        = 741
acoll_light.input				    = {0, 1}
acoll_light.output			        = {0, 1}
acoll_light.parameter_name	        = "ANTICOLLISIONLIGHT" 

hook_click					        = CreateGauge("parameter")
hook_click.arg_number		        = 707
hook_click.input				    = {0, 1}
hook_click.output			        = {0, 1}
hook_click.parameter_name	        = "HOOK"

-- parachute_click					    = CreateGauge("parameter")
-- parachute_click.arg_number		    = 752
-- parachute_click.input			    = {0, 1}
-- parachute_click.output		        = {0, 1}
-- parachute_click.parameter_name      = "PARACHUTE"

RADAR_click					        = CreateGauge("parameter")
RADAR_click.arg_number		        = 717
RADAR_click.input				    = {0, 1}
RADAR_click.output			        = {0, 1}
RADAR_click.parameter_name	        = "RADARPARAM"

FLIR_click					        = CreateGauge("parameter")
FLIR_click.arg_number		        = 716
FLIR_click.input				    = {0, 1}
FLIR_click.output			        = {0, 1}
FLIR_click.parameter_name	        = "FLIRPARAM"

FBW_Click					        = CreateGauge("parameter")
FBW_Click.arg_number		        = 721
FBW_Click.input				        = {0, 1}
FBW_Click.output			        = {0, 1}
FBW_Click.parameter_name	        = "FBWPARAM"

FBW_Click					        = CreateGauge("parameter")
FBW_Click.arg_number		        = 742
FBW_Click.input				        = {0, 1}
FBW_Click.output			        = {0, 1}
FBW_Click.parameter_name	        = "FORMATIONLIGHT"


ECM_Click					        = CreateGauge("parameter")
ECM_Click.arg_number		        = 719
ECM_Click.input				        = {0, 1}
ECM_Click.output			        = {0, 1}
ECM_Click.parameter_name	        = "ECM"

-- GenLeftSwitch					    = CreateGauge("parameter")
-- GenLeftSwitch.arg_number		    = 702
-- GenLeftSwitch.input				    = {0, 1}
-- GenLeftSwitch.output			    = {0, 1}
-- GenLeftSwitch.parameter_name	    = "GenLeftSwitch"

-- GenRightSwitch					    = CreateGauge("parameter")
-- GenRightSwitch.arg_number		    = 703
-- GenRightSwitch.input				= {0, 1}
-- GenRightSwitch.output			   = {0, 1}
-- GenRightSwitch.parameter_name	    = "GenRightSwitch"

-- EngineSwitch					    = CreateGauge("parameter")
-- EngineSwitch.arg_number		        = 123
-- EngineSwitch.input				    = {0, 1}
-- EngineSwitch.output			        = {-1, 1}
-- EngineSwitch.parameter_name	        = "EngineSwitch"

--need_to_be_closed = true
-- need_to_be_closed = false


