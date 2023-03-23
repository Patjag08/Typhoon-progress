dofile(LockOn_Options.script_path.."HUD/Device/device_defs.lua")

local half_width = GetScale()
local half_height = GetAspect() * half_width

local aspect = GetAspect()

HUD_base_clip                   = CreateElement "ceMeshPoly"
HUD_base_clip.name              = "HUD_base_clip"
HUD_base_clip.primitivetype     = "triangles"
HUD_base_clip.vertices          = { {1, 1}, {-1, 1}, {  1, -1}, { -1,  -1}}
HUD_base_clip.indices           = {0,1,2, 0,2,3}
HUD_base_clip.init_pos          = {-0.01, 0, 0}
HUD_base_clip.init_rot          = {0, 0, -15}
HUD_base_clip.material          = "HUD_COLLIMATOR"
HUD_base_clip.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
HUD_base_clip.level             = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_base_clip.isdraw            = true
HUD_base_clip.change_opacity    = true
HUD_base_clip.element_params    = {}
HUD_base_clip.controllers       = {}
HUD_base_clip.isvisible         = false
HUD_base_clip.collimated 		= false
Add(HUD_base_clip)
