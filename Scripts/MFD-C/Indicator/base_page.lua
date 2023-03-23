dofile(LockOn_Options.script_path.."HUD/Device/device_defs.lua")

local half_width = GetScale()
local half_height = GetAspect() * half_width

local aspect = GetAspect()


-- HUD_base_clip                   = CreateElement "ceMeshPoly"
-- HUD_base_clip.name              = "HUD_base_clip"
-- HUD_base_clip.primitivetype     = "triangles"
-- HUD_base_clip.vertices          = { {0, aspect}, { 1.2,0}, { 0,-aspect}, {-1.2,0}, {0.8,aspect/1.19}, {0.8,-aspect/1.19},{-0.8,-aspect/1.19},{-0.8,aspect/1.19},
--                                     {0.5,aspect/1.04},{1,aspect/1.4},{1,-aspect/1.4},{0.5,-aspect/1.04},{-0.5,-aspect/1.04},{-1,-aspect/1.4},{-1,aspect/1.4},{-0.5,aspect/1.04}}
-- HUD_base_clip.indices           = {0,1,2,0,2,3,0,4,1,1,5,2,2,6,3,3,7,0,0,8,4,4,9,1,1,10,5,5,11,2,2,12,6,6,13,3,3,14,7,7,15,0}
-- HUD_base_clip.init_pos          = {-0.01, 0, 0}
-- HUD_base_clip.init_rot          = {0, 0, 0}
-- HUD_base_clip.material          = "HUD_COLLIMATOR"
-- HUD_base_clip.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
-- HUD_base_clip.level             = HUD_DEFAULT_NOCLIP_LEVEL +1
-- HUD_base_clip.isdraw            = true
-- HUD_base_clip.change_opacity    = true
-- HUD_base_clip.element_params    = {"BATTERY","NAV_STATE"}
-- HUD_base_clip.controllers       = {{"parameter_compare_with_number",0,1},{"parameter_compare_with_number",1,1}}
-- HUD_base_clip.isvisible         = true
-- HUD_base_clip.collimated 		= false
-- Add(HUD_base_clip)

HUD_base_clip                   = CreateElement "ceMeshPoly"
HUD_base_clip.name              = "HUD_base_clip"
HUD_base_clip.primitivetype     = "triangles"
HUD_base_clip.vertices          = { {0,     0}, 
                                  {  0,     1.05 * aspect}, 
                                  {  0.5,   1},
                                  {  0.9,   0.75},
                                  {  1.12 , 0.4},
                                  {  1.2,   0},
                                  {  1.12, -0.45}, 
                                  {  0.87, -0.8},
                                  {  0.5,  -1.04},
                                  {  0,    -1.1 * aspect}, 
                                  { -0.5,  -1.04},
                                  { -0.87, -0.8},
                                  { -1.12, -0.45}, 
                                  { -1.2,   0},
                                  { -1.12,  0.4},
                                  { -0.9,   0.75},
                                  { -0.5,   1}}
HUD_base_clip.indices           = {0,1,2, 0,2,3, 0,3,4, 0,4,5, 0,5,6, 0,6,7, 0,7,8, 0,8,9, 0,9,10, 0,10,11, 0,11,12, 0,12,13, 0,13,14, 0,14,15, 0,15,16, 0,1,16}
HUD_base_clip.init_pos          = {-0.01, 0, 0}
HUD_base_clip.init_rot          = {0, 0, -15}
HUD_base_clip.material          = "HUD_COLLIMATOR"
HUD_base_clip.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
HUD_base_clip.level             = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_base_clip.isdraw            = true
HUD_base_clip.change_opacity    = true
HUD_base_clip.element_params    = {"BATTERY"}
HUD_base_clip.controllers       = {{"parameter_compare_with_number",0,1}}
HUD_base_clip.isvisible         = false
HUD_base_clip.collimated 		= false
Add(HUD_base_clip)
