dofile(LockOn_Options.script_path.."HMD/Device/device_defs.lua")

SHOW_MASKS = true

-- text_using_parameter
-- move_up_down_using_parameter
-- move_left_right_using_parameter
-- rotate_using_parameter
-- parameter_in_range


local half_width = GetScale()
local half_height = GetAspect() * half_width

local aspect = GetAspect()


HMD_base_clip                   = CreateElement "ceMeshPoly"
HMD_base_clip.name              = "HMD_base_clip"
HMD_base_clip.primitivetype     = "triangles"
HMD_base_clip.vertices          = { {3 * aspect, 3 * aspect}, { 3 * aspect,-3 * aspect}, { -3 * aspect,-3 * aspect}, {-3 * aspect, 3 * aspect},}
HMD_base_clip.indices           = {0,1,2,0,2,3}
HMD_base_clip.init_pos          = {0, 0, 0}
HMD_base_clip.init_rot          = {0, 0, 0}
HMD_base_clip.material          = MakeMaterial(nil,{0, 255, 0, 20})
HMD_base_clip.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
HMD_base_clip.level             = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_base_clip.isdraw            = true
HMD_base_clip.change_opacity    = true
HMD_base_clip.element_params    = {"BATTERY","HEAONOFF"}
HMD_base_clip.controllers       = {{"parameter_compare_with_number",0,1},{"parameter_compare_with_number",1,1}}
HMD_base_clip.isvisible         = false
Add(HMD_base_clip)


HMD_PITCH                                = CreateElement "ceSimple"
HMD_PITCH.name                           = "HMD_PITCH"
HMD_PITCH.init_pos                       = {0, 0.00, 0}
HMD_PITCH.init_rot                       = {0, 0, 0}
HMD_PITCH.material                       = MakeMaterial(nil,{0, 255, 0, 20})
HMD_PITCH.element_params                 = {"HMD_GLOAD"}--"HMD_FD_Y"
HMD_PITCH.controllers                    = {{"move_up_down_using_parameter",0,0.0025}}
HMD_PITCH.collimated                     = true
HMD_PITCH.use_mipfilter                  = true
HMD_PITCH.additive_alpha                 = false
HMD_PITCH.h_clip_relation                = h_clip_relations.COMPARE
HMD_PITCH.level                          = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_PITCH.parent_element                 = "HMD_base_clip"
HMD_PITCH.isvisible                      = true
Add(HMD_PITCH)

local HMD_Cross                    = CreateElement "ceTexPoly"
HMD_Cross.vertices                 = HMD_vert_gen(3000,3000)
HMD_Cross.indices                  = {0,1,2,2,3,0}
HMD_Cross.tex_coords               = tex_coord_gen(0,0,1024,1024,1024,1024)
HMD_Cross.material                 = HMD_CROSS
HMD_Cross.name                     = create_guid_string()
HMD_Cross.init_pos                 = {0.0, -0.03, 0}
HMD_Cross.init_rot                 = {0, 0, 0}
HMD_Cross.collimated               = true
HMD_Cross.use_mipfilter            = true
HMD_Cross.additive_alpha           = false
HMD_Cross.h_clip_relation          = h_clip_relations.COMPARE
HMD_Cross.level                    = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_Cross.parent_element           = "HMD_base_clip"
HMD_Cross.isvisible                = true
Add(HMD_Cross)

local AOAind                    = CreateElement "ceTexPoly"
AOAind.vertices                 = HMD_vert_gen(7000,7000)
AOAind.indices                  = {0,1,2,2,3,0}
AOAind.tex_coords               = tex_coord_gen(0,0,1024,1024,1024,1024)
AOAind.material                 = AOA_SCALE
AOAind.name                     = create_guid_string()
AOAind.init_pos                 = {-1.1, -0.03, 0}
AOAind.init_rot                 = {0, 0, 0}
AOAind.collimated               = true
AOAind.use_mipfilter            = true
AOAind.additive_alpha           = false
AOAind.h_clip_relation          = h_clip_relations.COMPARE
AOAind.level                    = HMD_DEFAULT_NOCLIP_LEVEL +1
AOAind.parent_element           = "HMD_base_clip"
AOAind.isvisible                = true
Add(AOAind)

local HMD_Circle                    = CreateElement "ceTexPoly"
HMD_Circle.vertices                 = HMD_vert_gen(4750,4750)
HMD_Circle.indices                  = {0,1,2,2,3,0}
HMD_Circle.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HMD_Circle.material                 = HMD_ALTCIRCLE
HMD_Circle.name                     = create_guid_string()
HMD_Circle.init_pos                 = {0.80 , 0.85 , 0}
HMD_Circle.collimated               = true
HMD_Circle.use_mipfilter            = true
HMD_Circle.additive_alpha           = false
HMD_Circle.h_clip_relation          = h_clip_relations.COMPARE
HMD_Circle.level                    = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_Circle.parent_element           = "HMD_PITCH"
Add(HMD_Circle)



local hud_macho             = CreateElement "ceStringPoly" 
hud_macho.material          = "font_Display_green"             
hud_macho.init_pos          = {-1.65 , 0.85 , 0}    
hud_macho.alignment         = "LeftCenter"       
hud_macho.stringdefs        = {0.02, 0.02, 0.002, 0.0}   
hud_macho.formats           = {"M","%s"} 
hud_macho.element_params    = {"HMD_MACH_M","HUD2ONOFF"}
hud_macho.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
hud_macho.collimated        = true
hud_macho.use_mipfilter     = true
hud_macho.additive_alpha    = false
hud_macho.isvisible		    = true
hud_macho.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_macho.level			    = HMD_DEFAULT_NOCLIP_LEVEL +1
hud_macho.parent_element    = "HMD_PITCH"  
Add(hud_macho)


-- --------------------------------------------------------------------

local HMD_SPEED_DIS             = CreateElement "ceStringPoly" 
HMD_SPEED_DIS.material          = "font_Display_green" 
HMD_SPEED_DIS.init_pos          = {-0.69 , 0.85 , 0}
HMD_SPEED_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HMD_SPEED_DIS.stringdefs        = {0.02, 0.02, 0.002, 0.0}          
HMD_SPEED_DIS.formats           = {"%.0f","%s"} 
HMD_SPEED_DIS.element_params    = {"HMD_SPEED_DIS"}
HMD_SPEED_DIS.controllers       = {{"text_using_parameter",0},}
HMD_SPEED_DIS.collimated        = true
HMD_SPEED_DIS.use_mipfilter     = true
HMD_SPEED_DIS.additive_alpha    = false
HMD_SPEED_DIS.isvisible		    = true
HMD_SPEED_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HMD_SPEED_DIS.level			    = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_SPEED_DIS.parent_element    = "HMD_PITCH" 
Add(HMD_SPEED_DIS)

-- ------------------------------------------------------------------------

local HMD_ALT_DIS             = CreateElement "ceStringPoly" 
HMD_ALT_DIS.material          = "font_Display_green" 
HMD_ALT_DIS.init_pos          = {1.1 , 0.85 , 0}
HMD_ALT_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HMD_ALT_DIS.stringdefs        = {0.02, 0.02, 0.002, 0.0}    
HMD_ALT_DIS.formats           = {"%.0f","%s"} 
HMD_ALT_DIS.element_params    = {"HMD_ALT_DIS"}
HMD_ALT_DIS.controllers       = {{"text_using_parameter",0},}
HMD_ALT_DIS.collimated        = true
HMD_ALT_DIS.use_mipfilter     = true
HMD_ALT_DIS.additive_alpha    = false
HMD_ALT_DIS.isvisible		    = true
HMD_ALT_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HMD_ALT_DIS.level			    = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_ALT_DIS.parent_element    = "HMD_PITCH" 
Add(HMD_ALT_DIS)

-- --------------------------------------------------------------------
local HMD_GS_DIS             = CreateElement "ceStringPoly" 
HMD_GS_DIS.material          = "font_Display_green" 
HMD_GS_DIS.init_pos          = {-1.4 , 0.65 , 0}
HMD_GS_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HMD_GS_DIS.stringdefs        = {0.02, 0.02, 0.002, 0.0}          
HMD_GS_DIS.formats           = {"%.0f","%s"} 
HMD_GS_DIS.element_params    = {"HUD_SPEED_DIS","HUD2ONOFF"}
HMD_GS_DIS.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
HMD_GS_DIS.collimated        = true
HMD_GS_DIS.use_mipfilter     = true
HMD_GS_DIS.additive_alpha    = false
HMD_GS_DIS.isvisible		    = true
HMD_GS_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HMD_GS_DIS.level			    = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_GS_DIS.parent_element    = "HMD_PITCH" 
Add(HMD_GS_DIS)

local hud_GS             = CreateElement "ceStringPoly" 
hud_GS.material          = "font_Display_green"             
hud_GS.init_pos          = {-1.65 , 0.85 , 0}    
hud_GS.alignment         = "LeftCenter"       
hud_GS.stringdefs        = {0.02, 0.02, 0.002, 0.0}   
hud_GS.formats           = {"GS","%s"} 
hud_GS.element_params    = {"HMD_MACH_M","HUD2ONOFF"}
hud_GS.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
hud_GS.collimated        = true
hud_GS.use_mipfilter     = true
hud_GS.additive_alpha    = false
hud_GS.isvisible		    = true
hud_GS.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_GS.level			    = HMD_DEFAULT_NOCLIP_LEVEL +1
hud_GS.parent_element    = "HMD_PITCH"  
Add(hud_GS)
-----------------------------------------------------------------------


local HMD_MACH_DIS             = CreateElement "ceStringPoly" 
HMD_MACH_DIS.material          = "font_Display_green" 
HMD_MACH_DIS.init_pos          = {-1.4 , 0.65 , 0}
HMD_MACH_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HMD_MACH_DIS.stringdefs        = {0.02, 0.02, 0.002, 0.0}          
HMD_MACH_DIS.formats           = {"%.2f","%s"} 
HMD_MACH_DIS.element_params    = {"HMD_MACH","HUD2ONOFF"}
HMD_MACH_DIS.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
HMD_MACH_DIS.collimated        = true
HMD_MACH_DIS.use_mipfilter     = true
HMD_MACH_DIS.additive_alpha    = false
HMD_MACH_DIS.isvisible		    = true
HMD_MACH_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HMD_MACH_DIS.level			    = HMD_DEFAULT_NOCLIP_LEVEL +1
HMD_MACH_DIS.parent_element    = "HMD_PITCH" 
Add(HMD_MACH_DIS)



local HUD_GZ_DIS             = CreateElement "ceStringPoly" 
HUD_GZ_DIS.material          = "font_Display_green" 
HUD_GZ_DIS.init_pos          = {-1.4 , 0, 0}
HUD_GZ_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HUD_GZ_DIS.stringdefs        = {0.02, 0.02, 0.002, 0.0}       
HUD_GZ_DIS.formats           = {"%.1f","%s"} 
HUD_GZ_DIS.element_params    = {"HUD_GZ"}
HUD_GZ_DIS.controllers       = {{"text_using_parameter",0},}
HUD_GZ_DIS.collimated        = true
HUD_GZ_DIS.use_mipfilter     = true
HUD_GZ_DIS.additive_alpha    = false
HUD_GZ_DIS.isvisible		    = true
HUD_GZ_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HUD_GZ_DIS.level			    = HMD_DEFAULT_NOCLIP_LEVEL +1
HUD_GZ_DIS.parent_element    = "HMD_PITCH" 
Add(HUD_GZ_DIS)