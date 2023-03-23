dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")

local dev = GetSelf()
local sensor_data		= get_base_data()

local update_time_step = 0.006 --0.006
make_default_activity(update_time_step)

local IAS_CONVERSION_TO_KNOTS = 1.9504132
local IAS_CONVERSION_TO_KMH = 3.6
local DEGREE_TO_RAD  = 0.0174532925199433
local RAD_TO_DEGREE  = 57.29577951308233
local METER_TO_FEET = 3.28084

local PARAMETERS = {
 RadarAltitude                                  = get_param_handle("RADAR_ALTITUDE"),
 BarometricAltitude                             = get_param_handle("BAROMETRIC_ALTITUDE"),
 AngleOfAttack                                  = get_param_handle("ANGLE_OF_ATTACK"),
 AngleOfSlide                                   = get_param_handle("ANGLE_OF_SLIDE"),
 VerticalVelocity                               = get_param_handle("VERTICAL_VELOCITY"),
 TrueAirSpeed                                   = get_param_handle("TRUE_AIRSPEED"),
 IndicatedAirSpeed                              = get_param_handle("INDICATED_AIRSPEED"),
 MachNumber                                     = get_param_handle("MACH_NUMBER"),
 VerticalAcceleration                           = get_param_handle("VERTICAL_ACCELERATION"),
 HorizontalAcceleration                         = get_param_handle("HORIZONTAL_ACCELERATION"),
 LateralAcceleration                            = get_param_handle("LATERAL_ACCELERATION"),
 RateOfRoll                                     = get_param_handle("RATE_OF_ROLL"),
 RateOfYaw                                      = get_param_handle("RATE_OF_YAW"),
 RateOfPitch                                    = get_param_handle("RATE_OF_PITCH"),
 Roll                                           = get_param_handle("ROLL"),
 MagneticHeading                                = get_param_handle("MAGNETIC_HEADING"),
 Pitch                                          = get_param_handle("PITCH"),
 Heading                                        = get_param_handle("HEADING"),
 EngineLeftFuelConsumption                      = get_param_handle("ENGINE_LEFT_FUEL_CONSUMPTION"),
 EngineRightFuelConsumption                     = get_param_handle("ENGINE_RIGHT_FUEL_CONSUMPTION"),
 EngineLeftTemperatureBeforeTurbine             = get_param_handle("ENGINE_LEFT_TEMPERATURE_BEGORE_TURBINE"),
 EngineRightTemperatureBeforeTurbine            = get_param_handle("ENGINE_RIGHT_TEMPERATURE_BEFORE_TURBINE"),
 EngineLeftRPM                                  = get_param_handle("ENGINE_LEFT_RPM"),
 EngineRightRPM                                 = get_param_handle("ENGINE_RIGHT_RPM"),
 WOW_RightMainLandingGear                       = get_param_handle("WOW_RIGHT_MAIN_LANDINGEAR"),
 WOW_LeftMainLandingGear                        = get_param_handle("WOW_LEFT_MAIN_LANDINGGEAR"),
 WOW_NoseLandingGear                            = get_param_handle("WOW_NOSE_LANDINGEAR"),
 RightMainLandingGearDown                       = get_param_handle("RIGHT_MAIN_GEAR_DOWN"),
 LeftMainLandingGearDown                        = get_param_handle("LEFT_MAIN_GEAR_DOWN"),
 NoseLandingGearDown                            = get_param_handle("NOSE_GEAR_DOWN"),
 RightMainLandingGearUp                         = get_param_handle("RIGHT_MAIN_GEAR_UP"),
 LeftMainLandingGearUp                          = get_param_handle("LEFT_MAIN_GEAR_UP"),
 NoseLandingGearUp                              = get_param_handle("NOSE_GEAR_UP"),
 LandingGearHandlePos                           = get_param_handle("LANDING_GEAR_HANDLE_POS"),
 StickRollPosition                              = get_param_handle("STICK_ROLL_POS"),
 StickPitchPosition                             = get_param_handle("STICK_PITCH_POS"),
 RudderPosition                                 = get_param_handle("RUDDER_POS"),
 ThrottleLeftPosition                           = get_param_handle("THROTTLE_LEFT_POS"),
 ThrottleRightPosition                          = get_param_handle("TROTTLE_RIGHT_POS"),
 CanopyPos                                      = get_param_handle("CANOPY_POS"),
 CanopyState                                    = get_param_handle("CANOPY_STATE"),
 FlapsRetracted                                 = get_param_handle("FLAPS_RETRACTED"),
 SpeedBrakePos                                  = get_param_handle("SPEED_BRAKE_POS"),
 FlapsPos                                       = get_param_handle("FLAPS_POS"),
 TotalFuelWeight                                = get_param_handle("TOTAL_FUEL_WEIGHT"),
 SelfAirspeed                                   = get_param_handle("SELF_AIRSPEED"),
 SelfCoordinates                                = get_param_handle("SELF_COORDINATES"),
 SelfVelocity                                   = get_param_handle("SELF_VELOCITY"),
 AC_Static                                      = get_param_handle("AC_STATIC"),

 -----------------ELEC-------------------------------
 BATTERY           = get_param_handle("BATTERY"),
 LGEN              = get_param_handle("LGEN"),
 RGEN              = get_param_handle("RGEN"),

 -----------------ENGINE-----------------------------
 APU                     = get_param_handle("APU"),
 BOOST_L                 = get_param_handle("BOOST_L"),
 BOOST_R                 = get_param_handle("BOOST_R"),
 AIR_DRIVE               = get_param_handle("AIR_DRIVE"),
 ECS                     = get_param_handle("ECS"),
 COCK_L                  = get_param_handle("COCK_L"),
 COCK_R                  = get_param_handle("COCK_R"),
 ---------------PARKING-------------------------------
 PARKING_BRAKE = get_param_handle("PARKING_BRAKE"),
}

------------------------------------------------------------------FUNCTION-POST-INIT---------------------------------------------------------------------------------------------------
function post_initialize()
	

end
------------------------------------------------------------------FUNCTION-SETCOMMAND---------------------------------------------------------------------------------------------------
function SetCommand(command,value)


end
------------------------------------------------------------------FUNCTION-UPDATE---------------------------------------------------------------------------------------------------
function update()

    PARAMETERS.RadarAltitude                           :set( sensor_data.getRadarAltitude() )
    PARAMETERS.BarometricAltitude                      :set( sensor_data.getBarometricAltitude() )
    PARAMETERS.AngleOfAttack                           :set( sensor_data.getAngleOfAttack() )
    PARAMETERS.AngleOfSlide                            :set( sensor_data.getAngleOfAttack() )
    PARAMETERS.VerticalVelocity                        :set( sensor_data.getVerticalVelocity() )
    PARAMETERS.TrueAirSpeed                            :set( sensor_data.getTrueAirSpeed())
    PARAMETERS.IndicatedAirSpeed                       :set( sensor_data.getIndicatedAirSpeed())
    PARAMETERS.MachNumber                              :set( sensor_data.getMachNumber() )
    PARAMETERS.VerticalAcceleration                    :set( sensor_data.getVerticalAcceleration() )
    PARAMETERS.HorizontalAcceleration                  :set( sensor_data.getHorizontalAcceleration() )
    PARAMETERS.LateralAcceleration                     :set( sensor_data.getLateralAcceleration() )
    PARAMETERS.RateOfRoll                              :set( sensor_data.getRateOfRoll() )
    PARAMETERS.RateOfYaw                               :set( sensor_data.getRateOfYaw() )
    PARAMETERS.RateOfPitch                             :set( sensor_data.getRateOfPitch() )
    PARAMETERS.Roll                                    :set( sensor_data.getRoll() )
    PARAMETERS.MagneticHeading                         :set( sensor_data.getMagneticHeading() )
    PARAMETERS.Pitch                                   :set( sensor_data.getPitch() )
    PARAMETERS.Heading                                 :set( sensor_data.getHeading() )
    PARAMETERS.EngineLeftFuelConsumption               :set( sensor_data.getEngineLeftFuelConsumption() )
    PARAMETERS.EngineRightFuelConsumption              :set( sensor_data.getEngineRightFuelConsumption() )
    PARAMETERS.EngineLeftTemperatureBeforeTurbine      :set( sensor_data.getEngineLeftTemperatureBeforeTurbine() )
    PARAMETERS.EngineRightTemperatureBeforeTurbine     :set( sensor_data.getEngineRightTemperatureBeforeTurbine() )
    PARAMETERS.EngineLeftRPM                           :set( sensor_data.getEngineLeftRPM() )
    PARAMETERS.EngineRightRPM                          :set( sensor_data.getEngineRightRPM() )
    PARAMETERS.WOW_RightMainLandingGear                :set( sensor_data.getWOW_RightMainLandingGear() )
    PARAMETERS.WOW_LeftMainLandingGear                 :set( sensor_data.getWOW_LeftMainLandingGear() )
    PARAMETERS.WOW_NoseLandingGear                     :set( sensor_data.getWOW_NoseLandingGear() )
    PARAMETERS.RightMainLandingGearDown                :set( sensor_data.getRightMainLandingGearDown() )
    PARAMETERS.LeftMainLandingGearDown                 :set( sensor_data.getLeftMainLandingGearDown() )
    PARAMETERS.NoseLandingGearDown                     :set( sensor_data.getNoseLandingGearDown() )
    PARAMETERS.RightMainLandingGearUp                  :set( sensor_data.getRightMainLandingGearUp() )
    PARAMETERS.LeftMainLandingGearUp                   :set( sensor_data.getLeftMainLandingGearUp() )
    PARAMETERS.NoseLandingGearUp                       :set( sensor_data.getNoseLandingGearUp() )
    PARAMETERS.LandingGearHandlePos                    :set( sensor_data.getLandingGearHandlePos() )
    PARAMETERS.StickRollPosition                       :set( sensor_data.getStickRollPosition() )
    PARAMETERS.StickPitchPosition                      :set( sensor_data.getStickPitchPosition() )
    PARAMETERS.RudderPosition                          :set( sensor_data.getRudderPosition() )
    PARAMETERS.ThrottleLeftPosition                    :set( sensor_data.getThrottleLeftPosition() )
    PARAMETERS.ThrottleRightPosition                   :set( sensor_data.getThrottleRightPosition() )
    PARAMETERS.CanopyPos                               :set( sensor_data.getCanopyPos() )
    PARAMETERS.CanopyState                             :set( sensor_data.getCanopyState() )
    PARAMETERS.FlapsRetracted                          :set( sensor_data.getFlapsRetracted() )
    PARAMETERS.SpeedBrakePos                           :set( sensor_data.getSpeedBrakePos() )
    PARAMETERS.FlapsPos                                :set( sensor_data.getFlapsPos() )
    PARAMETERS.TotalFuelWeight                         :set( sensor_data.getTotalFuelWeight() )
    PARAMETERS.SelfAirspeed                            :set( sensor_data.getSelfAirspeed() )
    PARAMETERS.SelfCoordinates                         :set( sensor_data.getSelfCoordinates() )
    PARAMETERS.SelfVelocity                            :set( sensor_data.getSelfVelocity())

    if PARAMETERS.SelfVelocity:get() < 5 and PARAMETERS.WOW_RightMainLandingGear:get() == 1 and PARAMETERS.WOW_LeftMainLandingGear:get() == 1 then 
        PARAMETERS.AC_Static:set(1)
    else
        PARAMETERS.AC_Static:set(0)
    end
end

--[[ available functions

 --getRadarAltitude
 --getBarometricAltitude
 --getAngleOfAttack
 --getAngleOfSlide
 --getVerticalVelocity
 --getTrueAirSpeed
 --getIndicatedAirSpeed
 --getMachNumber
 --getVerticalAcceleration --Ny
 --getHorizontalAcceleration --Nx
 --getLateralAcceleration --Nz
 --getRateOfRoll
 --getRateOfYaw
 --getRateOfPitch
 --getRoll
 --getMagneticHeading
 --getPitch
 --getHeading
 --getEngineLeftFuelConsumption
 --getEngineRightFuelConsumption
 --getEngineLeftTemperatureBeforeTurbine
 --getEngineRightTemperatureBeforeTurbine
 --getEngineLeftRPM
 --getEngineRightRPM
 --getWOW_RightMainLandingGear
 --getWOW_LeftMainLandingGear
 --getWOW_NoseLandingGear
 --getRightMainLandingGearDown
 --getLeftMainLandingGearDown
 --getNoseLandingGearDown
 --getRightMainLandingGearUp
 --getLeftMainLandingGearUp
 --getNoseLandingGearUp
 --getLandingGearHandlePos
 --getStickRollPosition
 --getStickPitchPosition
 --getRudderPosition
 --getThrottleLeftPosition
 --getThrottleRightPosition
 --getHelicopterCollective
 --getHelicopterCorrection
 --getCanopyPos
 --getCanopyState
 --getFlapsRetracted
 --getSpeedBrakePos
 --getFlapsPos
 --getTotalFuelWeight
 --getSelfAirspeed()
 --getSelfCoordinates()
 --getSelfVelocity()

--]]
