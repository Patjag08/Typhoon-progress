dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
--[[
    Normalmente queremos que el system output llegue al sistem setpoint via feedback. Esto lo hacemos mediante 2 inputs:
        1. Input de referencia 
        2. Medida actual
    De este modo recibimos el input y emitimos el outpt en un tiempo continuo.
    
    Esto es un algoritmo.


    Setpoint(reference)-mesurement = error term
    aguantamos la referencia y tomamos el mesurement, la resta da un error, una desviación.
    
    Este error lo manejamos en tres partes:
        1. Parte proporcional: Lo multiplicamos por una constante Kp.
        2. Parte Integral: Se multiplica por el Gain integral y por 1/s(presumiblemebte el tiempo)   --ERROR
        3. Parte derivativa: Se multiplical por el Gain derivativo, y por un filtro dericativo (s/st+1)    -RATE OF ERROR
        
    TODO ESTO VA A UN OUTPUT VIA SUMA 1+2+3

    Continious to discrete: 
]]

----------Controller Gains----------
local Kp = 5
local Ki = 3
local Kd = 3
----------Derivative Low Pass Filter----------
local tau
----------Output Limits----------
local LimitMin = -1
local LimitMax = 1
local LimitMinInt = -0.9
local LimitMaxInt = 0.9
local LimitMaxDev = 0
local LimitMinDev = 0

----------Actuator and Process----------
local Actuator
local process

----------Sample Time in seconds----------
local T
----------Controller Memory----------
local integrator
local prevError
local Differenciator
local PrevMesurement
----------Controller Output----------
local output


local dev = GetSelf()
local sensor_data		= get_base_data()

local update_time_step = 0.006 --0.006
make_default_activity(update_time_step)

------------------------------------------------------------------FUNCTION-POST-INIT---------------------------------------------------------------------------------------------------
function post_initialize()
	local integrator = 0
    local prevError = 0
    local Differenciator = 0
    local PrevMaesurement = 0

    local outpt = 0
end
------------------------------------------------------------------FUNCTION-SETCOMMAND---------------------------------------------------------------------------------------------------
function SetCommand(command,value)


end
------------------------------------------------------------------FUNCTION-UPDATE---------------------------------------------------------------------------------------------------
function pid_update(p,i,d,setpoint,measurement)
    --ERROR

    local error = setpoint - measurement

    --PROPORTIONAL

    local p = Kp*error

    --INTEGRAL
    local i = i + 0.5 * Ki * T * (error + prevError)

    --DERIVATIVE
    local d = (2 * Kd * (measurement - PrevMaesurement) + (2 * tau - t) * d) / (2 * tau + t)

    --OUTPUT
    local outpt = p + i + d

    --LIMITS
    if p > LimitMax then
        p = LimitMax
    elseif p < LimitMin then 
        p=LimitMin
    end 

    if integrator > LimitMaxInt then
        integrator = LimitMaxInt 
    elseif integrator < LimitMinInt then
        integrator = LimitMinInt
    end 

    if output > LimitMax then
        output = LimitMax
    elseif output < LimitMin then
        outpt = LimitMin
    end

end

function update()
    ------OUR CURRENT FRAME------

    local T = T + update_time_step
    if time == 1 then
        time = 0
        --print_message_to_user(time)
    end

    pid_update()

end