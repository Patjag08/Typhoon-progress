
-- basic_HUD_material

-- dofile(LockOn_Options.common_script_path.."elements_defs.lua")
-- dofile(LockOn_Options.script_path.."materials.lua")
dofile(LockOn_Options.script_path.."HUD/Device/device_defs.lua")
dofile(LockOn_Options.script_path.."HUD/Indicator/base_page.lua")
dofile(LockOn_Options.script_path.."HUD/Indicator/a2a_page.lua")
-- dofile(LockOn_Options.script_path.."HUD/Devices/dcms_hud.lua")

SHOW_MASKS = true

-- text_using_parameter
-- move_up_down_using_parameter
-- move_left_right_using_parameter
-- rotate_using_parameter
-- parameter_in_range


local half_width = GetScale()
local half_height = GetAspect() * half_width

local aspect = GetAspect()

---------------------CLIPS--------------------------------------------------

HUD_SQUARE_CLIP                   = CreateElement "ceMeshPoly"
HUD_SQUARE_CLIP.name              = "HUD_SQUARE_CLIP"
HUD_SQUARE_CLIP.primitivetype     = "triangles"
HUD_SQUARE_CLIP.vertices          = { {10, 10*aspect}, { 10,-10*aspect}, { -10,-10*aspect}, {-10,10*aspect},}
HUD_SQUARE_CLIP.indices           = {0,1,2,0,2,3}
HUD_SQUARE_CLIP.init_pos          = {0, 0.09, 0}
HUD_SQUARE_CLIP.init_rot          = {0, 0, 0}
HUD_SQUARE_CLIP.material          = "DBG_GREEN"
HUD_SQUARE_CLIP.h_clip_relation   = h_clip_relations.INCREASE_IF_LEVEL
HUD_SQUARE_CLIP.level             = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_SQUARE_CLIP.isdraw            = true
HUD_SQUARE_CLIP.change_opacity    = true
HUD_SQUARE_CLIP.collimated 		= true
HUD_SQUARE_CLIP.element_params    = {"BATTERY","A2AONOFF"}
HUD_SQUARE_CLIP.controllers       = {{"parameter_compare_with_number",0,1},{"parameter_compare_with_number",0,1}}
HUD_SQUARE_CLIP.isvisible         = false
Add(HUD_SQUARE_CLIP)

HUD_RUMBOS_CLIP                   = CreateElement "ceMeshPoly"
HUD_RUMBOS_CLIP.name              = "HUD_RUMBOS_CLIP"
HUD_RUMBOS_CLIP.primitivetype     = "triangles"
HUD_RUMBOS_CLIP.vertices          = { {0.45, 0.65*aspect}, { 0.45,0.35*aspect}, { -0.45,0.35*aspect}, {-0.45,0.65*aspect},}
HUD_RUMBOS_CLIP.indices           = {0,1,2,0,2,3}
HUD_RUMBOS_CLIP.init_pos          = {0, 0, 0}
HUD_RUMBOS_CLIP.init_rot          = {0, 0, 0}
HUD_RUMBOS_CLIP.material          = MakeMaterial(nil, {0, 255, 0, 50})
HUD_RUMBOS_CLIP.h_clip_relation   = h_clip_relations.INCREASE_IF_LEVEL
HUD_RUMBOS_CLIP.level             = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_RUMBOS_CLIP.isdraw            = true
HUD_RUMBOS_CLIP.change_opacity    = true
HUD_RUMBOS_CLIP.collimated 		  = true
HUD_RUMBOS_CLIP.element_params    = {"BATTERY"}
HUD_RUMBOS_CLIP.controllers       = {{"parameter_compare_with_number",0,1}}
HUD_RUMBOS_CLIP.isvisible         = false
Add(HUD_RUMBOS_CLIP)

-------------------------CESIMPLES------------------------------

HUD_ROLL                                 = CreateElement "ceSimple"
HUD_ROLL.name                            = "HUD_ROLL"
HUD_ROLL.init_pos                        = {0, 0.0, 0} --{0, 0, default_HUD_z_offset}
HUD_ROLL.init_rot                        = {0, 0, 0}
HUD_ROLL.element_params                  = {"HUD_ROLL","HUD_PITCH"}
HUD_ROLL.controllers                     = {{"rotate_using_parameter",0,1}}
HUD_ROLL.collimated                      = true
HUD_ROLL.use_mipfilter                   = true
HUD_ROLL.additive_alpha                  = true
HUD_ROLL.h_clip_relation                 = h_clip_relations.COMPARE
HUD_ROLL.level                           = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_ROLL.parent_element                  = "HUD_SQUARE_CLIP"
HUD_ROLL.isvisible                       = false
Add(HUD_ROLL)

HUD_ROLL_ANGLE                                 = CreateElement "ceSimple"
HUD_ROLL_ANGLE.name                            = "HUD_ROLL_ANGLE"
HUD_ROLL_ANGLE.init_pos                        = {0, -0.55, 0} --{0, 0, default_HUD_z_offset}
HUD_ROLL_ANGLE.init_rot                        = {0, 0, 0}
HUD_ROLL_ANGLE.element_params                  = {"HUD_ROLL"}
HUD_ROLL_ANGLE.controllers                     = {{"rotate_using_parameter",0,1}}
HUD_ROLL_ANGLE.collimated                      = true
HUD_ROLL_ANGLE.use_mipfilter                   = true
HUD_ROLL_ANGLE.additive_alpha                  = true
HUD_ROLL_ANGLE.h_clip_relation                 = h_clip_relations.COMPARE
HUD_ROLL_ANGLE.level                           = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_ROLL_ANGLE.parent_element                  = "HUD_SQUARE_CLIP"
HUD_ROLL_ANGLE.isvisible                       = false
Add(HUD_ROLL_ANGLE)

HUD_ROLL_STC                                 = CreateElement "ceSimple"
HUD_ROLL_STC.name                            = "HUD_ROLL_STC"
HUD_ROLL_STC.init_pos                        = {0, 0.0, 0} --{0, 0, default_HUD_z_offset}
HUD_ROLL_STC.init_rot                        = {0, 0, 0}
HUD_ROLL_STC.element_params                  = {"HUD_ROLL","HUD_PITCH"}
HUD_ROLL_STC.controllers                     = {{"rotate_using_parameter",0,0}}
HUD_ROLL_STC.collimated                      = true
HUD_ROLL_STC.use_mipfilter                   = true
HUD_ROLL_STC.additive_alpha                  = true
HUD_ROLL_STC.h_clip_relation                 = h_clip_relations.COMPARE
HUD_ROLL_STC.level                           = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_ROLL_STC.parent_element                  = "HUD_SQUARE_CLIP"
HUD_ROLL_STC.isvisible                       = false
Add(HUD_ROLL_STC)

HUD_ROLL_PI                                 = CreateElement "ceSimple"
HUD_ROLL_PI.name                            = "HUD_ROLL_PI"
HUD_ROLL_PI.init_pos                        = {0, 0.0, 0} --{0, 0, default_HUD_z_offset}
HUD_ROLL_PI.init_rot                        = {0, 0, 0}
HUD_ROLL_PI.element_params                  = {"HUD_ROLL","HUD_ALT_DIS"}
HUD_ROLL_PI.controllers                     = {{"rotate_using_parameter",0,0},{"move_up_down_using_parameter",1,-0.00000075}}
HUD_ROLL_PI.collimated                      = true
HUD_ROLL_PI.use_mipfilter                   = true
HUD_ROLL_PI.additive_alpha                  = true
HUD_ROLL_PI.h_clip_relation                 = h_clip_relations.COMPARE
HUD_ROLL_PI.level                           = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_ROLL_PI.parent_element                  = "HUD_SQUARE_CLIP"
HUD_ROLL_PI.isvisible                       = false
Add(HUD_ROLL_PI)

HUD_PITCH                                = CreateElement "ceSimple"
HUD_PITCH.name                           = "HUD_PITCH"
HUD_PITCH.init_pos                       = {0, 0.00, 0}
HUD_PITCH.init_rot                       = {0, 0, 0}
HUD_PITCH.element_params                 = {"HUD_PITCH","HUD_ALT_DIS"}--"HUD_FD_Y"
HUD_PITCH.controllers                    = {{"move_up_down_using_parameter",0,-0.6},{"move_up_down_using_parameter",1,-0.00000075}}
HUD_PITCH.collimated                     = true
HUD_PITCH.use_mipfilter                  = true
HUD_PITCH.additive_alpha                 = true
HUD_PITCH.h_clip_relation                = h_clip_relations.COMPARE
HUD_PITCH.level                          = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_PITCH.parent_element                 = "HUD_ROLL"
HUD_PITCH.isvisible                      = false
Add(HUD_PITCH)

HUD_VERTICAL                                = CreateElement "ceSimple"
HUD_VERTICAL.name                            = "HUD_VERTICAL"
HUD_VERTICAL.init_pos                        = {0, 0.0, 0} --{0, 0, default_HUD_z_offset}
HUD_VERTICAL.init_rot                        = {0, 0, 0}
HUD_VERTICAL.element_params                  = {"HUD_VERTICAL"}
HUD_VERTICAL.controllers                     = {{"move_up_down_using_parameter",0,0.0013} }
HUD_VERTICAL.collimated                      = true
HUD_VERTICAL.use_mipfilter                   = true
HUD_VERTICAL.additive_alpha                  = true
HUD_VERTICAL.h_clip_relation                 = h_clip_relations.COMPARE
HUD_VERTICAL.level                           = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_VERTICAL.parent_element                  = "HUD_SQUARE_CLIP"
HUD_VERTICAL.isvisible                       = false
Add(HUD_VERTICAL)


HUD_VERTICAL_GX                                = CreateElement "ceSimple"
HUD_VERTICAL_GX.name                            = "HUD_VERTICAL_GX"
HUD_VERTICAL_GX.init_pos                        = {0, 0.0, 0} --{0, 0, default_HUD_z_offset}
HUD_VERTICAL_GX.init_rot                        = {0, 0, 0}
HUD_VERTICAL_GX.element_params                  = {"HUD_GX","HUD_ALT_DIS"}
HUD_VERTICAL_GX.controllers                     = {{"move_up_down_using_parameter",0,0.023},{"move_up_down_using_parameter",1,-0.00000075}}
HUD_VERTICAL_GX.collimated                      = true
HUD_VERTICAL_GX.use_mipfilter                   = true
HUD_VERTICAL_GX.additive_alpha                  = true
HUD_VERTICAL_GX.h_clip_relation                 = h_clip_relations.COMPARE
HUD_VERTICAL_GX.level                           = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_VERTICAL_GX.parent_element                  = "HUD_SQUARE_CLIP"
HUD_VERTICAL_GX.isvisible                       = false
Add(HUD_VERTICAL_GX)

HUD_FD_Y                                = CreateElement "ceSimple"
HUD_FD_Y.name                           = "HUD_FD_Y"
HUD_FD_Y.init_pos                       = {0, -0.05, 0}
HUD_FD_Y.init_rot                       = {0, 0, 0}
HUD_FD_Y.element_params                 = {"HUD_AOA_DIS","HUD_ALT_DIS"}--"HUD_FD_Y"
HUD_FD_Y.controllers                    = {{"move_up_down_using_parameter",0,-0.6},{"move_up_down_using_parameter",1,-0.00000075}}
HUD_FD_Y.collimated                     = true
HUD_FD_Y.use_mipfilter                  = true
HUD_FD_Y.additive_alpha                 = true
HUD_FD_Y.h_clip_relation                = h_clip_relations.COMPARE
HUD_FD_Y.level                          = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_FD_Y.parent_element                 = "HUD_SQUARE_CLIP"
HUD_FD_Y.isvisible                      = false
Add(HUD_FD_Y)

HUD_AOA_Y                               = CreateElement "ceSimple"
HUD_AOA_Y.name                           = "HUD_AOA_Y"
HUD_AOA_Y.init_pos                       = {0, 0.13, 0}
HUD_AOA_Y.init_rot                       = {0, 0, 0}
HUD_AOA_Y.element_params                 = {"HUD_AOA"}--"HUD_FD_Y"
HUD_AOA_Y.controllers                    = {{"move_up_down_using_parameter",0,0.03},{"move_up_down_using_parameter",1,-0.00000075}}
HUD_AOA_Y.collimated                     = true
HUD_AOA_Y.use_mipfilter                  = true
HUD_AOA_Y.additive_alpha                 = true
HUD_AOA_Y.h_clip_relation                = h_clip_relations.COMPARE
HUD_AOA_Y.level                          = HUD_DEFAULT_NOCLIP_LEVEL +1
HUD_AOA_Y.parent_element                 = "HUD_SQUARE_CLIP"
HUD_AOA_Y.isvisible                      = false
Add(HUD_AOA_Y)

---------------TEXTURES-------------------------------
local AOA_Scale                    = CreateElement "ceTexPoly"
AOA_Scale.vertices                 = hud_vert_gen(1500,1250)
AOA_Scale.indices                  = {0,1,2,2,3,0}
AOA_Scale.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
AOA_Scale.material                 = AOA_SCALE
AOA_Scale.name                     = create_guid_string()
AOA_Scale.init_pos                 = {-0.52 , -0.37, 0}
AOA_Scale.init_rot                 = {0, 0, 0}
AOA_Scale.collimated               = true
AOA_Scale.use_mipfilter            = true
AOA_Scale.additive_alpha           = false
AOA_Scale.h_clip_relation          = h_clip_relations.COMPARE
AOA_Scale.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
AOA_Scale.parent_element           = "HUD_ROLL_STC"
Add(AOA_Scale)

local HUD_AOA_arrow                   = CreateElement "ceTexPoly"
HUD_AOA_arrow.vertices                 = hud_vert_gen(1100,1300)
HUD_AOA_arrow.indices                  = {0,1,2,2,3,0}
HUD_AOA_arrow.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_AOA_arrow.material                 = HUD_AOA
HUD_AOA_arrow.name                     = create_guid_string()
HUD_AOA_arrow.init_pos                 = {-0.45 , -0.48 ,0}
HUD_AOA_arrow.collimated               = true
HUD_AOA_arrow.use_mipfilter            = true
HUD_AOA_arrow.additive_alpha           = false
HUD_AOA_arrow.h_clip_relation          = h_clip_relations.COMPARE
HUD_AOA_arrow.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_AOA_arrow.parent_element           = "HUD_AOA_Y"
Add(HUD_AOA_arrow)

local hud_vectorv_real                     = CreateElement "ceTexPoly"
hud_vectorv_real.vertices                 = hud_vert_gen(230,230)
hud_vectorv_real.indices                  = {0,1,2,2,3,0}
hud_vectorv_real.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
hud_vectorv_real.material                 = HUD_FPV_REAL
hud_vectorv_real.name                     = create_guid_string()
hud_vectorv_real.init_pos                 = {0.005, -0.047, 0}
hud_vectorv_real.init_rot                 = {0, 0, 0}
hud_vectorv_real.collimated               = true
hud_vectorv_real.use_mipfilter            = true
hud_vectorv_real.additive_alpha           = false
hud_vectorv_real.h_clip_relation          = h_clip_relations.COMPARE
hud_vectorv_real.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_vectorv_real.parent_element           = "HUD_FD_Y"
Add(hud_vectorv_real)


local hud_horizonte                   = CreateElement "ceTexPoly"
hud_horizonte.vertices                 = hud_vert_gen(3500,2000)
hud_horizonte.indices                  = {0,1,2,2,3,0}
hud_horizonte.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
hud_horizonte.material                 = HUD_HORIZON
hud_horizonte.name                     = create_guid_string()
hud_horizonte.init_pos                 = {0, -0.07, 0}
hud_horizonte.init_rot                 = {0, 0, 0}
hud_horizonte.collimated               = true
hud_horizonte.use_mipfilter            = true
hud_horizonte.additive_alpha           = false
hud_horizonte.h_clip_relation          = h_clip_relations.COMPARE
hud_horizonte.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_horizonte.parent_element           = "HUD_PITCH"
Add(hud_horizonte)


local hud_vectorv                      = CreateElement "ceTexPoly"
hud_vectorv.vertices                 = hud_vert_gen(650,650)
hud_vectorv.indices                  = {0,1,2,2,3,0}
hud_vectorv.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
hud_vectorv.material                 = HUD_FPV
hud_vectorv.name                     = create_guid_string()
hud_vectorv.init_pos                 = {0, -0.07, 0}
hud_vectorv.init_rot                 = {0, 0, 0}
hud_vectorv.collimated               = true
hud_vectorv.use_mipfilter            = true
hud_vectorv.additive_alpha           = false
hud_vectorv.h_clip_relation          = h_clip_relations.COMPARE
hud_vectorv.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_vectorv.parent_element           = "HUD_ROLL_PI"
Add(hud_vectorv)

-- local hud_linea                      = CreateElement "ceTexPoly"
-- hud_linea.vertices                 = hud_vert_gen(5000,650)
-- hud_linea.indices                  = {0,1,2,2,3,0}
-- hud_linea.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
-- hud_linea.material                 = HUD_GEAR
-- hud_linea.name                     = create_guid_string()
-- hud_linea.init_pos                 = {0.009, -0.0835, 0}
-- hud_linea.init_rot                 = {90, 0, 0}
-- hud_linea.collimated               = true
-- hud_linea.use_mipfilter            = true
-- hud_linea.additive_alpha           = false
-- hud_linea.h_clip_relation          = h_clip_relations.COMPARE
-- hud_linea.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
-- hud_linea.parent_element           = "HUD_ROLL_STC"
-- Add(hud_linea)

local hud_bank                   = CreateElement "ceTexPoly"
hud_bank.vertices                 = hud_vert_gen(2500,2500)
hud_bank.indices                  = {0,1,2,2,3,0}
hud_bank.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
hud_bank.material                 = HUD_ANGULOS
hud_bank.name                     = create_guid_string()
hud_bank.init_pos                 = {0, -0.45, 0}
hud_bank.init_rot                 = {0, 0, 0}
hud_bank.collimated               = true
hud_bank.use_mipfilter            = true
hud_bank.additive_alpha           = false
hud_bank.h_clip_relation          = h_clip_relations.COMPARE
hud_bank.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_bank.parent_element           = "HUD_ROLL_ANGLE"
Add(hud_bank)

local hud_bank_ind                   = CreateElement "ceTexPoly"
hud_bank_ind.vertices                 = hud_vert_gen(2500,2500)
hud_bank_ind.indices                  = {0,1,2,2,3,0}
hud_bank_ind.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
hud_bank_ind.material                 = HUD_FLECHITA
hud_bank_ind.name                     = create_guid_string()
hud_bank_ind.init_pos                 = {0, -1, 0}
hud_bank_ind.init_rot                 = {0, 0, 0}
hud_bank_ind.collimated               = true
hud_bank_ind.use_mipfilter            = true
hud_bank_ind.additive_alpha           = false
hud_bank_ind.h_clip_relation          = h_clip_relations.COMPARE
hud_bank_ind.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_bank_ind.parent_element           = "HUD_ROLL_STC"
Add(hud_bank_ind)

local hud_ang_positivo_5                   = CreateElement "ceTexPoly"
hud_ang_positivo_5.vertices                 = hud_vert_gen(2000,2000)
hud_ang_positivo_5.indices                  = {0,1,2,2,3,0}
hud_ang_positivo_5.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
hud_ang_positivo_5.material                 = HUD_Angulo_positivo
hud_ang_positivo_5.name                     = create_guid_string()
hud_ang_positivo_5.init_pos                 = {0, 0.4, 0}
hud_ang_positivo_5.init_rot                 = {0, 0, 0}
hud_ang_positivo_5.collimated               = true
hud_ang_positivo_5.use_mipfilter            = true
hud_ang_positivo_5.additive_alpha           = false
hud_ang_positivo_5.h_clip_relation          = h_clip_relations.COMPARE
hud_ang_positivo_5.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_ang_positivo_5.parent_element           = "HUD_PITCH"
Add(hud_ang_positivo_5)

sign_number = 5

local hud_ang_numero_5             = CreateElement "ceStringPoly" 
hud_ang_numero_5.material          = "green_font_MPCD"             
hud_ang_numero_5.init_pos          = {-0.36, 0.41,0}      
hud_ang_numero_5.alignment         = "LeftCenter"       
hud_ang_numero_5.stringdefs        = {0.00650,0.00650, 0.0006, 0}  
hud_ang_numero_5.formats           = {tostring(sign_number),"%s"} 
hud_ang_numero_5.element_params    = {"HUD_ANG_NUM"}
hud_ang_numero_5.controllers       = {{"text_using_parameter",0}}
hud_ang_numero_5.collimated        = true
hud_ang_numero_5.use_mipfilter     = true
hud_ang_numero_5.additive_alpha    = false
hud_ang_numero_5.isvisible		 = true
hud_ang_numero_5.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_ang_numero_5.level			 = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_ang_numero_5.parent_element    = "HUD_PITCH"  
Add(hud_ang_numero_5)

sign_number = -5

local hud_ang_numero_m5             = CreateElement "ceStringPoly" 
hud_ang_numero_m5.material          = "green_font_MPCD"             
hud_ang_numero_m5.init_pos          = {-0.36, -0.56,0}      
hud_ang_numero_m5.alignment         = "LeftCenter"       
hud_ang_numero_m5.stringdefs        = {0.00650,0.00650, 0.0006, 0}  
hud_ang_numero_m5.formats           = {tostring(sign_number),"%s"} 
hud_ang_numero_m5.element_params    = {"HUD_ANG_NUM"}
hud_ang_numero_m5.controllers       = {{"text_using_parameter",0}}
hud_ang_numero_m5.collimated        = true
hud_ang_numero_m5.use_mipfilter     = true
hud_ang_numero_m5.additive_alpha    = false
hud_ang_numero_m5.isvisible		 = true
hud_ang_numero_m5.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_ang_numero_m5.level			 = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_ang_numero_m5.parent_element    = "HUD_PITCH"  
Add(hud_ang_numero_m5)


local hud_ang_negativo_5                   = CreateElement "ceTexPoly"
hud_ang_negativo_5.vertices                 = hud_vert_gen(2000,2000)
hud_ang_negativo_5.indices                  = {0,1,2,2,3,0}
hud_ang_negativo_5.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
hud_ang_negativo_5.material                 = HUD_Angulo_negativo
hud_ang_negativo_5.name                     = create_guid_string()
hud_ang_negativo_5.init_pos                 = {0, -0.6, 0}
hud_ang_negativo_5.init_rot                 = {0, 0, 0}
hud_ang_negativo_5.collimated               = true
hud_ang_negativo_5.use_mipfilter            = true
hud_ang_negativo_5.additive_alpha           = false
hud_ang_negativo_5.h_clip_relation          = h_clip_relations.COMPARE
hud_ang_negativo_5.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_ang_negativo_5.parent_element           = "HUD_PITCH"
Add(hud_ang_negativo_5)

local vertical_distance
for i=2,18 do 
    sign_number = i * 5
    vertical_distance = 0.513 * i
    local hud_ang_positivo                   = CreateElement "ceTexPoly"
    hud_ang_positivo.vertices                 = hud_vert_gen(2000,2000)
    hud_ang_positivo.indices                  = {0,1,2,2,3,0}
    hud_ang_positivo.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
    hud_ang_positivo.material                 = HUD_Angulo_positivo
    hud_ang_positivo.name                     = create_guid_string()
    hud_ang_positivo.init_pos                 = {0, vertical_distance-0.08, 0}
    hud_ang_positivo.init_rot                 = {0, 0, 0}
    hud_ang_positivo.collimated               = true
    hud_ang_positivo.use_mipfilter            = true
    hud_ang_positivo.additive_alpha           = false
    hud_ang_positivo.h_clip_relation          = h_clip_relations.COMPARE
    hud_ang_positivo.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
    hud_ang_positivo.parent_element           = "HUD_PITCH"
    Add(hud_ang_positivo)

    local hud_ang_numero           = CreateElement "ceStringPoly" 
    hud_ang_numero.material          = "green_font_MPCD"             
    hud_ang_numero.init_pos          = {-0.36, vertical_distance - 0.05,0}      
    hud_ang_numero.alignment         = "LeftCenter"       
    hud_ang_numero.stringdefs        = {0.00650,0.00650, 0.0006, 0}  
    hud_ang_numero.formats           = {tostring(sign_number),"%s"} 
    hud_ang_numero.element_params    = {"HUD_ANG_NUM"}
    hud_ang_numero.controllers       = {{"text_using_parameter",0}}
    hud_ang_numero.collimated        = true
    hud_ang_numero.use_mipfilter     = true
    hud_ang_numero.additive_alpha    = false
    hud_ang_numero.isvisible		 = true
    hud_ang_numero.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
    hud_ang_numero.level			 = HUD_DEFAULT_NOCLIP_LEVEL + 2
    hud_ang_numero.parent_element    = "HUD_PITCH"  
    Add(hud_ang_numero)

end

for i=2,18 do 
    sign_number = i * 5 * -1
    vertical_distance = 0.516 * i
    
    local hud_ang_negativo                  = CreateElement "ceTexPoly"
    hud_ang_negativo.vertices                 = hud_vert_gen(2000,2000)
    hud_ang_negativo.indices                  = {0,1,2,2,3,0}
    hud_ang_negativo.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
    hud_ang_negativo.material                 = HUD_Angulo_negativo
    hud_ang_negativo.name                     = create_guid_string()
    hud_ang_negativo.init_pos                 = {0, -vertical_distance-0.12, 0}
    hud_ang_negativo.init_rot                 = {0, 0, 0}
    hud_ang_negativo.collimated               = true
    hud_ang_negativo.use_mipfilter            = true
    hud_ang_negativo.additive_alpha           = false
    hud_ang_negativo.h_clip_relation          = h_clip_relations.COMPARE
    hud_ang_negativo.level                    = HUD_DEFAULT_NOCLIP_LEVEL + 2
    hud_ang_negativo.parent_element           = "HUD_PITCH"
    Add(hud_ang_negativo)

    local hud_ang_numero           = CreateElement "ceStringPoly" 
    hud_ang_numero.material          = "green_font_MPCD"             
    hud_ang_numero.init_pos          = {-0.36, -vertical_distance-0.09,0}      
    hud_ang_numero.alignment         = "LeftCenter"       
    hud_ang_numero.stringdefs        = {0.00650,0.00650, 0.0006, 0}  
    hud_ang_numero.formats           = {tostring(sign_number),"%s"} 
    hud_ang_numero.element_params    = {"HUD_ANG_NUM"}
    hud_ang_numero.controllers       = {{"text_using_parameter",0}}
    hud_ang_numero.collimated        = true
    hud_ang_numero.use_mipfilter     = true
    hud_ang_numero.additive_alpha    = false
    hud_ang_numero.isvisible		 = true
    hud_ang_numero.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
    hud_ang_numero.level			 = HUD_DEFAULT_NOCLIP_LEVEL + 2
    hud_ang_numero.parent_element    = "HUD_PITCH"  
    Add(hud_ang_numero)

end


local HUD_SPEED_DIS             = CreateElement "ceStringPoly" 
HUD_SPEED_DIS.material          = "green_font_MPCD" 
HUD_SPEED_DIS.init_pos          = {-0.43 , 0.2, 0}
HUD_SPEED_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HUD_SPEED_DIS.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}          
HUD_SPEED_DIS.formats           = {"%.0f","%s"} 
HUD_SPEED_DIS.element_params    = {"HUD_SPEED_DIS"}
HUD_SPEED_DIS.controllers       = {{"text_using_parameter",0},}
HUD_SPEED_DIS.collimated        = true
HUD_SPEED_DIS.use_mipfilter     = true
HUD_SPEED_DIS.additive_alpha    = false
HUD_SPEED_DIS.isvisible		    = true
HUD_SPEED_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HUD_SPEED_DIS.level			    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_SPEED_DIS.parent_element    = "HUD_ROLL_STC" 
Add(HUD_SPEED_DIS)

-- ------------------------------------------------------------------------

local HUD_ALT_DIS             = CreateElement "ceStringPoly" 
HUD_ALT_DIS.material          = "green_font_MPCD" 
HUD_ALT_DIS.init_pos          = {0.65, 0.2 , 0}
HUD_ALT_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HUD_ALT_DIS.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}    
HUD_ALT_DIS.formats           = {"%.0f","%s"} 
HUD_ALT_DIS.element_params    = {"HUD_ALT_DIS"}
HUD_ALT_DIS.controllers       = {{"text_using_parameter",0},}
HUD_ALT_DIS.collimated        = true
HUD_ALT_DIS.use_mipfilter     = true
HUD_ALT_DIS.additive_alpha    = false
HUD_ALT_DIS.isvisible		    = true
HUD_ALT_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HUD_ALT_DIS.level			    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_ALT_DIS.parent_element    = "HUD_ROLL_STC" 
Add(HUD_ALT_DIS)


local HUD_Circle                    = CreateElement "ceTexPoly"
HUD_Circle.vertices                 = hud_vert_gen(850,850)
HUD_Circle.indices                  = {0,1,2,2,3,0}
HUD_Circle.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_Circle.material                 = HUD_ALTCIRCLE
HUD_Circle.name                     = create_guid_string()
HUD_Circle.init_pos                 = {0.55 , 0.2 , 0}
HUD_Circle.collimated               = true
HUD_Circle.use_mipfilter            = true
HUD_Circle.additive_alpha           = false
HUD_Circle.h_clip_relation          = h_clip_relations.COMPARE
HUD_Circle.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_Circle.parent_element           = "HUD_ROLL_STC"
Add(HUD_Circle)
------------------------------------------------------GEAR--------------------------------------------------------------
--local HUD_gearN                    = CreateElement "ceTexPoly"
--HUD_gearN.vertices                 = hud_vert_gen(850,850)
--HUD_gearN.indices                  = {0,1,2,2,3,0}
--HUD_gearN.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
--HUD_gearN.material                 = HUD_GEAR
--HUD_gearN.element_params           = {"HUD_GEAR_F_STATE"}
--HUD_gearN.controllers              = {{"parameter_compare_with_number",0,1},{"parameter_compare_with_number",0,1}}
--HUD_gearN.name                     = create_guid_string()
--HUD_gearN.init_pos                 = {-0.5 , -0.90 , 0}
--HUD_gearN.collimated               = true
--HUD_gearN.use_mipfilter            = true
--HUD_gearN.additive_alpha           = false
--HUD_gearN.h_clip_relation          = h_clip_relations.COMPARE
--HUD_gearN.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
--HUD_gearN.parent_element           = "HUD_SQUARE_CLIP"
--Add(HUD_gearN)
--------------------------------------------------------------------------------------------------------------------------
local HUD_ALT_ROT_R                   = CreateElement "ceTexPoly"
HUD_ALT_ROT_R.vertices                 = hud_vert_gen(620,620)
HUD_ALT_ROT_R.indices                  = {0,1,2,0,3,2}
HUD_ALT_ROT_R.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_ALT_ROT_R.material                 = HUD_ALT_ROT
HUD_ALT_ROT_R.name                     = create_guid_string()
HUD_ALT_ROT_R.init_pos                 = {0.55, 0.2, 0} --L-R,U-D,F-B
HUD_ALT_ROT_R.init_rot                 = {0 , 0, 0}
HUD_ALT_ROT_R.element_params           = {"HUD_ALT_R"}
HUD_ALT_ROT_R.controllers              = {{"rotate_using_parameter",0,-0.0206}}
HUD_ALT_ROT_R.collimated               = true
HUD_ALT_ROT_R.use_mipfilter            = true
HUD_ALT_ROT_R.additive_alpha           = false
HUD_ALT_ROT_R.h_clip_relation          = h_clip_relations.COMPARE
HUD_ALT_ROT_R.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_ALT_ROT_R.parent_element           = "HUD_ROLL_STC"
Add(HUD_ALT_ROT_R)

local HUD_ALT_RAD             = CreateElement "ceStringPoly" 
HUD_ALT_RAD.material          = "green_font_MPCD" 
HUD_ALT_RAD.init_pos          = {0.92, 0.18 , 0}
HUD_ALT_RAD.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HUD_ALT_RAD.stringdefs        = {0.00650, 0.00650, 0.0006, 0.0}    
HUD_ALT_RAD.formats           = {"%.0f","%s"} 
HUD_ALT_RAD.element_params    = {"HUD_ALT_DIS_RAD", "HUD_RADALT_OPACITY"}
HUD_ALT_RAD.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
HUD_ALT_RAD.collimated        = true
HUD_ALT_RAD.use_mipfilter     = true
HUD_ALT_RAD.additive_alpha    = false
HUD_ALT_RAD.isvisible		    = true
HUD_ALT_RAD.h_clip_relation   = h_clip_relations.COMPARE 
HUD_ALT_RAD.level			    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_ALT_RAD.parent_element    = "HUD_ROLL_STC" 
Add(HUD_ALT_RAD)

local HUD_ALT_RAD_R               = CreateElement "ceStringPoly" 
HUD_ALT_RAD_R.material            = "green_font_MPCD"             
HUD_ALT_RAD_R.init_pos            = {0.86, 0.25 , 0}      
HUD_ALT_RAD_R.alignment           = "RightCenter"       
HUD_ALT_RAD_R.stringdefs          = {0.00650,0.00650, 0.0006, 0}  
HUD_ALT_RAD_R.formats             = {tostring("R"),"%s"} 
HUD_ALT_RAD_R.element_params      = {"HUD_ALT_DIS_RAD", "HUD_RADALT_OPACITY"}
HUD_ALT_RAD_R.controllers         = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
HUD_ALT_RAD_R.h_clip_relation     = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
HUD_ALT_RAD_R.level			      = HUD_DEFAULT_NOCLIP_LEVEL + 2
HUD_ALT_RAD_R.parent_element      = "HUD_ROLL_STC"  
Add(HUD_ALT_RAD_R)

-- --------------------------------------------------------------------


local HUD_MACH_DIS             = CreateElement "ceStringPoly" 
HUD_MACH_DIS.material          = "green_font_MPCD" 
HUD_MACH_DIS.init_pos          = {-0.62 , 0.1, 0}
HUD_MACH_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HUD_MACH_DIS.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}          
HUD_MACH_DIS.formats           = {"%.2f","%s"} 
HUD_MACH_DIS.element_params    = {"HUD_MACH","HUD2ONOFF"}
HUD_MACH_DIS.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
HUD_MACH_DIS.collimated        = true
HUD_MACH_DIS.use_mipfilter     = true
HUD_MACH_DIS.additive_alpha    = false
HUD_MACH_DIS.isvisible		    = true
HUD_MACH_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HUD_MACH_DIS.level			    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_MACH_DIS.parent_element    = "HUD_ROLL_STC" 
Add(HUD_MACH_DIS)

local HUD_GS_DIS             = CreateElement "ceStringPoly" 
HUD_GS_DIS.material          = "green_font_MPCD" 
HUD_GS_DIS.init_pos          = {-0.62 , 0.1, 0}
HUD_GS_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HUD_GS_DIS.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}          
HUD_GS_DIS.formats           = {"%.0f","%s"} 
HUD_GS_DIS.element_params    = {"HUD_SPEED_DIS","HUD2ONOFF"}
HUD_GS_DIS.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
HUD_GS_DIS.collimated        = true
HUD_GS_DIS.use_mipfilter     = true
HUD_GS_DIS.additive_alpha    = false
HUD_GS_DIS.isvisible		 = true
HUD_GS_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HUD_GS_DIS.level			 = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_GS_DIS.parent_element    = "HUD_ROLL_STC" 
Add(HUD_GS_DIS)


local hud_macho             = CreateElement "ceStringPoly" 
hud_macho.material          = "green_font_MPCD"             
hud_macho.init_pos          = {-0.73 , 0.18 , 0}     
hud_macho.alignment         = "LeftCenter"       
hud_macho.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_macho.formats           = {"M","%s"} 
hud_macho.element_params    = {"HUD_ANG_NUM","HUD2ONOFF"}
hud_macho.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
hud_macho.collimated        = true
hud_macho.use_mipfilter     = true
hud_macho.additive_alpha    = false
hud_macho.isvisible		    = true
hud_macho.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_macho.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_macho.parent_element    = "HUD_ROLL_STC"  
Add(hud_macho)

local hud_ground             = CreateElement "ceStringPoly" 
hud_ground.material          = "green_font_MPCD"             
hud_ground.init_pos          = {-0.73 , 0.18 , 0}     
hud_ground.alignment         = "LeftCenter"       
hud_ground.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_ground.formats           = {"GS","%s"} 
hud_ground.element_params    = {"HUD_ANG_NUM","HUD2ONOFF"}
hud_ground.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
hud_ground.collimated        = true
hud_ground.use_mipfilter     = true
hud_ground.additive_alpha    = false
hud_ground.isvisible    	 = true
hud_ground.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_ground.level	  	     = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_ground.parent_element    = "HUD_ROLL_STC"  
Add(hud_ground)

local hud_TEST             = CreateElement "ceStringPoly" 
hud_TEST.material          = "green_font_MPCD"             
hud_TEST.init_pos          = {-0 , 0 , 0}     
hud_TEST.alignment         = "Center"       
hud_TEST.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_TEST.formats           = {"A2A","%s"} 
hud_TEST.element_params    = {"HUD_ANG_NUM","HUD2ONOFF"}
hud_TEST.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
hud_TEST.collimated        = true
hud_TEST.use_mipfilter     = true
hud_TEST.additive_alpha    = false
hud_TEST.isvisible         = true
hud_TEST.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_TEST.level	  	       = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_TEST.parent_element    = "HUD_ROLL_STC"  
Add(hud_ground)

------------------------------------------------------------------------------------
local hud_Ngear             = CreateElement "ceStringPoly" 
hud_Ngear.material          = "green_font_MPCD"             
hud_Ngear.init_pos          = {-0.515 , -0.90 , 0}     
hud_Ngear.alignment         = "Center"       
hud_Ngear.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_Ngear.formats           = {"D","%s"} 
hud_Ngear.element_params    = {"HUD_ANG_NUM","NOSEGEAR"}
hud_Ngear.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
hud_Ngear.collimated        = true
hud_Ngear.use_mipfilter     = true
hud_Ngear.additive_alpha    = false
hud_Ngear.isvisible		    = true
hud_Ngear.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_Ngear.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_Ngear.parent_element    = "HUD_ROLL_STC"  
Add(hud_Ngear)

local hud_NgearIN             = CreateElement "ceStringPoly" 
hud_NgearIN.material          = "green_font_MPCD"             
hud_NgearIN.init_pos          = {-0.515 , -0.8 , 0}     
hud_NgearIN.alignment         = "Center"       
hud_NgearIN.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_NgearIN.formats           = {"U","%s"} 
hud_NgearIN.element_params    = {"HUD_ANG_NUM","NOSEGEAR"}
hud_NgearIN.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
hud_NgearIN.collimated        = true
hud_NgearIN.use_mipfilter     = true
hud_NgearIN.additive_alpha    = false
hud_NgearIN.isvisible		    = true
hud_NgearIN.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_NgearIN.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_NgearIN.parent_element    = "HUD_ROLL_STC"  
Add(hud_NgearIN)

local hud_Rgear             = CreateElement "ceStringPoly" 
hud_Rgear.material          = "green_font_MPCD"             
hud_Rgear.init_pos          = {-0.38 , -0.90 , 0}     
hud_Rgear.alignment         = "Center"       
hud_Rgear.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_Rgear.formats           = {"D","%s"} 
hud_Rgear.element_params    = {"HUD_ANG_NUM","RIGHTGEAR"}
hud_Rgear.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
hud_Rgear.collimated        = true
hud_Rgear.use_mipfilter     = true
hud_Rgear.additive_alpha    = false
hud_Rgear.isvisible		    = true
hud_Rgear.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_Rgear.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_Rgear.parent_element    = "HUD_ROLL_STC"  
Add(hud_Rgear)

local hud_RgearIN             = CreateElement "ceStringPoly" 
hud_RgearIN.material          = "green_font_MPCD"             
hud_RgearIN.init_pos          = {-0.38 , -0.8 , 0}     
hud_RgearIN.alignment         = "Center"       
hud_RgearIN.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_RgearIN.formats           = {"U","%s"} 
hud_RgearIN.element_params    = {"HUD_ANG_NUM","RIGHTGEAR"}
hud_RgearIN.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
hud_RgearIN.collimated        = true
hud_RgearIN.use_mipfilter     = true
hud_RgearIN.additive_alpha    = false
hud_RgearIN.isvisible		    = true
hud_RgearIN.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_RgearIN.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_RgearIN.parent_element    = "HUD_ROLL_STC"  
Add(hud_RgearIN)

local hud_Lgear             = CreateElement "ceStringPoly" 
hud_Lgear.material          = "green_font_MPCD"             
hud_Lgear.init_pos          = {-0.65 , -0.90 , 0}     
hud_Lgear.alignment         = "Center"       
hud_Lgear.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_Lgear.formats           = {"D","%s"} 
hud_Lgear.element_params    = {"HUD_ANG_NUM","LEFTGEAR"}
hud_Lgear.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,1}}
hud_Lgear.collimated        = true
hud_Lgear.use_mipfilter     = true
hud_Lgear.additive_alpha    = false
hud_Lgear.isvisible		    = true
hud_Lgear.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_Lgear.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_Lgear.parent_element    = "HUD_ROLL_STC"  
Add(hud_Lgear)

local hud_LgearIN             = CreateElement "ceStringPoly" 
hud_LgearIN.material          = "green_font_MPCD"             
hud_LgearIN.init_pos          = {-0.65 , -0.8 , 0}     
hud_LgearIN.alignment         = "Center"       
hud_LgearIN.stringdefs        = {0.00850, 0.00850, 0.0008, 0.0}   
hud_LgearIN.formats           = {"U","%s"} 
hud_LgearIN.element_params    = {"HUD_ANG_NUM","LEFTGEAR"}
hud_LgearIN.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",1,0}}
hud_LgearIN.collimated        = true
hud_LgearIN.use_mipfilter     = true
hud_LgearIN.additive_alpha    = false
hud_LgearIN.isvisible		    = true
hud_LgearIN.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_LgearIN.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 2
hud_LgearIN.parent_element    = "HUD_ROLL_STC"  
Add(hud_LgearIN)

local HUD_gear                    = CreateElement "ceTexPoly"
HUD_gear.vertices                 = hud_vert_gen(850,850)
HUD_gear.indices                  = {0,1,2,2,3,0}
HUD_gear.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_gear.material                 = HUD_GEAR
HUD_gear.name                     = create_guid_string()
HUD_gear.init_pos                 = {-0.5 , -0.82 , 0}
HUD_gear.collimated               = true
HUD_gear.use_mipfilter            = true
HUD_gear.additive_alpha           = false
hud_Ngear.isvisible		          = true
HUD_gear.h_clip_relation          = h_clip_relations.COMPARE
HUD_gear.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_gear.parent_element           = "HUD_SQUARE_CLIP"
Add(HUD_gear)


------------------------------------------------------------------------------------
local HUD_GZ_DIS             = CreateElement "ceStringPoly" 
HUD_GZ_DIS.material          = "green_font_MPCD" 
HUD_GZ_DIS.init_pos          = {-0.62 , -0.4, 0}
HUD_GZ_DIS.alignment         = "RightCenter" --Left/Right/Center; Top/Down/Center
HUD_GZ_DIS.stringdefs        = {0.00850, 0.00850, 0.0006, 0.0}          
HUD_GZ_DIS.formats           = {"%.1f","%s"} 
HUD_GZ_DIS.element_params    = {"HUD_GZ"}
HUD_GZ_DIS.controllers       = {{"text_using_parameter",0},}
HUD_GZ_DIS.collimated        = true
HUD_GZ_DIS.use_mipfilter     = true
HUD_GZ_DIS.additive_alpha    = false
HUD_GZ_DIS.isvisible		    = true
HUD_GZ_DIS.h_clip_relation   = h_clip_relations.COMPARE 
HUD_GZ_DIS.level			    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_GZ_DIS.parent_element    = "HUD_ROLL_STC" 
Add(HUD_GZ_DIS)


-------------------------------------------------------------------------------------------------


local HUD_VV_IND                   = CreateElement "ceTexPoly"
HUD_VV_IND.vertices                 = hud_vert_gen(1000,1000)
HUD_VV_IND.indices                  = {0,1,2,2,3,0}
HUD_VV_IND.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_VV_IND.material                 = HUD_VV
HUD_VV_IND.name                     = create_guid_string()
HUD_VV_IND.init_pos                 = {0.55 , -0.25 , 0}
HUD_VV_IND.collimated               = true
HUD_VV_IND.use_mipfilter            = true
HUD_VV_IND.additive_alpha           = false
HUD_VV_IND.h_clip_relation          = h_clip_relations.COMPARE
HUD_VV_IND.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_VV_IND.parent_element           = "HUD_ROLL_STC"
Add(HUD_VV_IND)

for i = 1,3 do
    sign_number = i
    vertical_distance = 0.065 * i
    local hud_vv_num1         = CreateElement "ceStringPoly" 
    hud_vv_num1.material          = "green_font_MPCD"             
    hud_vv_num1.init_pos          = {0.5, vertical_distance-0.25,0}      
    hud_vv_num1.alignment         = "LeftCenter"       
    hud_vv_num1.stringdefs        = {0.00650,0.00650, 0.0006, 0}  
    hud_vv_num1.formats           = {tostring(sign_number),"%s"} 
    hud_vv_num1.element_params    = {"HUD_ANG_NUM"}
    hud_vv_num1.controllers       = {{"text_using_parameter",0}}
    hud_vv_num1.collimated        = true
    hud_vv_num1.use_mipfilter     = true
    hud_vv_num1.additive_alpha    = false
    hud_vv_num1.isvisible		 = true
    hud_vv_num1.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
    hud_vv_num1.level			 = HUD_DEFAULT_NOCLIP_LEVEL + 2
    hud_vv_num1.parent_element    = "HUD_ROLL_STC"  
    Add(hud_vv_num1)
end

for i = 1,3 do
    sign_number = i
    vertical_distance = 0.065 * i
    local hud_vv_num1         = CreateElement "ceStringPoly" 
    hud_vv_num1.material          = "green_font_MPCD"             
    hud_vv_num1.init_pos          = {0.5, -vertical_distance-0.26,0}      
    hud_vv_num1.alignment         = "LeftCenter"       
    hud_vv_num1.stringdefs        = {0.00650,0.00650, 0.0006, 0}  
    hud_vv_num1.formats           = {tostring(sign_number),"%s"} 
    hud_vv_num1.element_params    = {"HUD_ANG_NUM"}
    hud_vv_num1.controllers       = {{"text_using_parameter",0}}
    hud_vv_num1.collimated        = true
    hud_vv_num1.use_mipfilter     = true
    hud_vv_num1.additive_alpha    = false
    hud_vv_num1.isvisible		 = true
    hud_vv_num1.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
    hud_vv_num1.level			 = HUD_DEFAULT_NOCLIP_LEVEL + 2
    hud_vv_num1.parent_element    = "HUD_ROLL_STC"  
    Add(hud_vv_num1)
end

local HUD_VV_arrow                   = CreateElement "ceTexPoly"
HUD_VV_arrow.vertices                 = hud_vert_gen(900,900)
HUD_VV_arrow.indices                  = {0,1,2,2,3,0}
HUD_VV_arrow.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_VV_arrow.material                 = HUD_VV_arr
HUD_VV_arrow.name                     = create_guid_string()
HUD_VV_arrow.init_pos                 = {0.58 , -0.25 , 0}
HUD_VV_arrow.collimated               = true
HUD_VV_arrow.use_mipfilter            = true
HUD_VV_arrow.additive_alpha           = false
HUD_VV_arrow.h_clip_relation          = h_clip_relations.COMPARE
HUD_VV_arrow.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_VV_arrow.parent_element           = "HUD_VERTICAL"
Add(HUD_VV_arrow)


local HUD_GX_arrow                   = CreateElement "ceTexPoly"
HUD_GX_arrow.vertices                 = hud_vert_gen(1200,1200)
HUD_GX_arrow.indices                  = {0,1,2,2,3,0}
HUD_GX_arrow.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_GX_arrow.material                 = HUD_VV_arr
HUD_GX_arrow.name                     = create_guid_string()
HUD_GX_arrow.init_pos                 = {0.25 , -0.0658 , 0}
HUD_GX_arrow.collimated               = true
HUD_GX_arrow.use_mipfilter            = true
HUD_GX_arrow.additive_alpha           = false
HUD_GX_arrow.h_clip_relation          = h_clip_relations.COMPARE
HUD_GX_arrow.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_GX_arrow.parent_element           = "HUD_VERTICAL_GX"
Add(HUD_GX_arrow)

local HUD_GX_arrow_2                   = CreateElement "ceTexPoly"
HUD_GX_arrow_2.vertices                 = hud_vert_gen(1200,1200)
HUD_GX_arrow_2.indices                  = {0,1,2,2,3,0}
HUD_GX_arrow_2.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_GX_arrow_2.material                 = HUD_VV_arr_inverted
HUD_GX_arrow_2.name                     = create_guid_string()
HUD_GX_arrow_2.init_pos                 = {-0.25 , -0.0658 , 0}
HUD_GX_arrow_2.collimated               = true
HUD_GX_arrow_2.use_mipfilter            = true
HUD_GX_arrow_2.additive_alpha           = false
HUD_GX_arrow_2.h_clip_relation          = h_clip_relations.COMPARE
HUD_GX_arrow_2.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_GX_arrow_2.parent_element           = "HUD_VERTICAL_GX"
Add(HUD_GX_arrow_2)

local HUD_rumbos_arrow                   = CreateElement "ceTexPoly"
HUD_rumbos_arrow.vertices                 = hud_vert_gen(500,500)
HUD_rumbos_arrow.indices                  = {0,1,2,2,3,0}
HUD_rumbos_arrow.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
HUD_rumbos_arrow.material                 = HUD_ALT_ROT
HUD_rumbos_arrow.name                     = create_guid_string()
HUD_rumbos_arrow.init_pos                 = {0.0 , 0.29 , 0}
HUD_rumbos_arrow.collimated               = true
HUD_rumbos_arrow.use_mipfilter            = true
HUD_rumbos_arrow.additive_alpha           = false
HUD_rumbos_arrow.h_clip_relation          = h_clip_relations.COMPARE
HUD_rumbos_arrow.level                    = HUD_DEFAULT_NOCLIP_LEVEL +2
HUD_rumbos_arrow.parent_element           = "HUD_ROLL_STC"
Add(HUD_rumbos_arrow)

HUD_RUMBOS_LR                                 = CreateElement "ceSimple"
HUD_RUMBOS_LR.name                            = "HUD_RUMBOS_LR"
HUD_RUMBOS_LR.init_pos                        = {0, 0.5, 0} --{0, 0, default_HUD_z_offset}
HUD_RUMBOS_LR.init_rot                        = {0, 0, 0}
HUD_RUMBOS_LR.element_params                  = {"HUD_RUMBOS_MAG"}
HUD_RUMBOS_LR.controllers                     = {{"move_left_right_using_parameter",0,-0.0032}}
HUD_RUMBOS_LR.collimated                      = true
HUD_RUMBOS_LR.use_mipfilter                   = true
HUD_RUMBOS_LR.additive_alpha                  = false
HUD_RUMBOS_LR.h_clip_relation                 = h_clip_relations.COMPARE
HUD_RUMBOS_LR.level                           = HUD_DEFAULT_NOCLIP_LEVEL +3
HUD_RUMBOS_LR.parent_element                  = "HUD_RUMBOS_CLIP"
HUD_RUMBOS_LR.isvisible                       = false
Add(HUD_RUMBOS_LR)

HUD_RUMBOS_LR_2                                 = CreateElement "ceSimple"
HUD_RUMBOS_LR_2.name                            = "HUD_RUMBOS_LR_2"
HUD_RUMBOS_LR_2.init_pos                        = {0, 0.5, 0} --{0, 0, default_HUD_z_offset}
HUD_RUMBOS_LR_2.init_rot                        = {180, 0, }
HUD_RUMBOS_LR_2.element_params                  = {"HUD_RUMBOS_MAG"}
HUD_RUMBOS_LR_2.controllers                     = {{"move_left_right_using_parameter",0,0.0032}}
HUD_RUMBOS_LR_2.collimated                      = true
HUD_RUMBOS_LR_2.use_mipfilter                   = true
HUD_RUMBOS_LR_2.additive_alpha                  = false
HUD_RUMBOS_LR_2.h_clip_relation                 = h_clip_relations.COMPARE
HUD_RUMBOS_LR_2.level                           = HUD_DEFAULT_NOCLIP_LEVEL +3
HUD_RUMBOS_LR_2.parent_element                  = "HUD_RUMBOS_CLIP"
HUD_RUMBOS_LR_2.isvisible                       = false
Add(HUD_RUMBOS_LR_2)

for i = 0, 76 do  
    point_distance = i * 0.16

    local HUD_Rumbos                  = CreateElement "ceTexPoly"
    HUD_Rumbos.vertices                 = hud_vert_gen(50,50)
    HUD_Rumbos.indices                  = {0,1,2,2,3,0}
    HUD_Rumbos.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
    HUD_Rumbos.material                 = HUD_ROSA_RUMBOS
    HUD_Rumbos.name                     = create_guid_string()
    HUD_Rumbos.init_pos                 = {point_distance -0.21 , 0.0 , 0}
    HUD_Rumbos.collimated               = true
    HUD_Rumbos.use_mipfilter            = true
    HUD_Rumbos.additive_alpha           = false
    HUD_Rumbos.h_clip_relation          = h_clip_relations.COMPARE
    HUD_Rumbos.level                    = HUD_DEFAULT_NOCLIP_LEVEL +3
    HUD_Rumbos.parent_element           = "HUD_RUMBOS_LR"
    Add(HUD_Rumbos)

end

for i = 1, 36 do
    sign_number = i
    point_distance = i * 0.32
    if i >9 then
        point_distance = i * 0.32 -0.24
    else 
        point_distance = i * 0.32 -0.202
    end
    local hud_hdg_num               = CreateElement "ceStringPoly" 
    hud_hdg_num.material            = "green_font_MPCD"             
    hud_hdg_num.init_pos            = {point_distance, 0.05,0}      
    hud_hdg_num.alignment           = "LeftCenter"       
    hud_hdg_num.stringdefs          = {0.00650,0.00650, 0.0006, 0}  
    hud_hdg_num.formats             = {tostring(sign_number),"%s"} 
    hud_hdg_num.element_params       = {"HUD_Rumbos_MAG"}
    hud_hdg_num.controllers         = {{"text_using_parameter",0}}
    hud_hdg_num.collimated          = true
    hud_hdg_num.use_mipfilter       = true
    hud_hdg_num.additive_alpha      = false
    hud_hdg_num.isvisible		    = true
    hud_hdg_num.h_clip_relation     = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
    hud_hdg_num.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 3
    hud_hdg_num.parent_element      = "HUD_RUMBOS_LR"  
    Add(hud_hdg_num)


end

local hud_hdg_num_01               = CreateElement "ceStringPoly" 
hud_hdg_num_01.material            = "green_font_MPCD"             
hud_hdg_num_01.init_pos            = {37 * 0.32 -0.24, 0.05,0}      
hud_hdg_num_01.alignment           = "LeftCenter"       
hud_hdg_num_01.stringdefs          = {0.00650,0.00650, 0.0006, 0}  
hud_hdg_num_01.formats             = {tostring("01"),"%s"} 
hud_hdg_num_01.element_params       = {"HUD_Rumbos_MAG"}
hud_hdg_num_01.controllers         = {{"text_using_parameter",0}}
hud_hdg_num_01.collimated          = true
hud_hdg_num_01.use_mipfilter       = true
hud_hdg_num_01.additive_alpha      = false
hud_hdg_num_01.isvisible		    = true
hud_hdg_num_01.h_clip_relation     = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
hud_hdg_num_01.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 3
hud_hdg_num_01.parent_element      = "HUD_RUMBOS_LR"  
Add(hud_hdg_num_01)


for i =1, 9 do 
    point_distance = i * 0.32
    local hud_hdg_num_0                 = CreateElement "ceStringPoly" 
    hud_hdg_num_0.material              = "green_font_MPCD"             
    hud_hdg_num_0.init_pos              = {point_distance-0.24, 0.05,0}      
    hud_hdg_num_0.alignment             = "LeftCenter"       
    hud_hdg_num_0.stringdefs            = {0.00650,0.00650, 0.0006, 0}  
    hud_hdg_num_0.formats               = {tostring("0"),"%s"} 
    hud_hdg_num_0.element_params        = {"HUD_Rumbos_MAG"}
    hud_hdg_num_0.controllers           = {{"text_using_parameter",0}}
    hud_hdg_num_0.collimated            = true
    hud_hdg_num_0.use_mipfilter         = true
    hud_hdg_num_0.additive_alpha        = false
    hud_hdg_num_0.isvisible		        = true
    hud_hdg_num_0.h_clip_relation       = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
    hud_hdg_num_0.level			        = HUD_DEFAULT_NOCLIP_LEVEL + 3
    hud_hdg_num_0.parent_element        = "HUD_RUMBOS_LR"  
    Add(hud_hdg_num_0)
end




-- local hud_hdg_num               = CreateElement "ceStringPoly" 
-- hud_hdg_num.material            = "font_Display_green"             
-- hud_hdg_num.init_pos            = {point_distance, 0.05,0}      
-- hud_hdg_num.alignment           = "LeftCenter"       
-- hud_hdg_num.stringdefs          = {0.00650,0.00650, 0.0006, 0}  
-- hud_hdg_num.formats             = {tostring(sign_number),"%s"} 
-- hud_hdg_num.element_params       = {"HUD_Rumbos_MAG"}
-- hud_hdg_num.controllers         = {{"text_using_parameter",0}}
-- hud_hdg_num.collimated          = true
-- hud_hdg_num.use_mipfilter       = true
-- hud_hdg_num.additive_alpha      = true
-- hud_hdg_num.isvisible		    = true
-- hud_hdg_num.h_clip_relation     = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
-- hud_hdg_num.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 3
-- hud_hdg_num.parent_element      = "HUD_RUMBOS_LR"  
-- Add(hud_hdg_num)

for i = 1, 4 do  
    point_distance = i * 0.16

    local HUD_Rumbos_F                  = CreateElement "ceTexPoly"
    HUD_Rumbos_F.vertices                 = hud_vert_gen(50,50)
    HUD_Rumbos_F.indices                  = {0,1,2,2,3,0}
    HUD_Rumbos_F.tex_coords               = tex_coord_gen(0,0,2048,2048,2048,2048)
    HUD_Rumbos_F.material                 = HUD_ROSA_RUMBOS_2
    HUD_Rumbos_F.name                     = create_guid_string()
    HUD_Rumbos_F.init_pos                 = {point_distance + 0.21 , 0.0 , 0}
    HUD_Rumbos_F.init_rot                 = {0, 0, 0}
    HUD_Rumbos_F.collimated               = true
    HUD_Rumbos_F.use_mipfilter            = true
    HUD_Rumbos_F.additive_alpha           = false
    HUD_Rumbos_F.h_clip_relation          = h_clip_relations.COMPARE
    HUD_Rumbos_F.level                    = HUD_DEFAULT_NOCLIP_LEVEL +3
    HUD_Rumbos_F.parent_element           = "HUD_RUMBOS_LR_2"
    Add(HUD_Rumbos_F)
    if i == 2 then 
        local hud_hdg_num_35               = CreateElement "ceStringPoly" 
        hud_hdg_num_35.material            = "green_font_MPCD"             
        hud_hdg_num_35.init_pos            = {point_distance+ 0.237, -0.05,0}   
        hud_hdg_num_35.init_rot            = {180, 0, 0}   
        hud_hdg_num_35.alignment           = "LeftCenter"       
        hud_hdg_num_35.stringdefs          = {0.00650,0.00650, 0.0006, 0}  
        hud_hdg_num_35.formats             = {tostring("35"),"%s"} 
        hud_hdg_num_35.element_params      = {"HUD_Rumbos_MAG"}
        hud_hdg_num_35.controllers         = {{"text_using_parameter",0}}
        hud_hdg_num_35.collimated          = true
        hud_hdg_num_35.use_mipfilter       = true
        hud_hdg_num_35.additive_alpha      = false
        hud_hdg_num_35.isvisible		   = true
        hud_hdg_num_35.h_clip_relation     = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
        hud_hdg_num_35.level			   = HUD_DEFAULT_NOCLIP_LEVEL + 3
        hud_hdg_num_35.parent_element      = "HUD_RUMBOS_LR_2"  
        Add(hud_hdg_num_35)
    elseif i == 1 then

        local hud_hdg_num_36                = CreateElement "ceStringPoly" 
        hud_hdg_num_36.material             = "green_font_MPCD"             
        hud_hdg_num_36.init_pos             = {0.237, -0.05,0}  
        hud_hdg_num_36.init_rot             = {180, 0, 0}      
        hud_hdg_num_36.alignment            = "LeftCenter"       
        hud_hdg_num_36.stringdefs           = {0.00650,0.00650, 0.0006, 0}  
        hud_hdg_num_36.formats              = {tostring("36"),"%s"} 
        hud_hdg_num_36.element_params       = {"HUD_Rumbos_MAG"}
        hud_hdg_num_36.controllers          = {{"text_using_parameter",0}}
        hud_hdg_num_36.collimated           = true
        hud_hdg_num_36.use_mipfilter        = true
        hud_hdg_num_36.additive_alpha          = false
        hud_hdg_num_36.isvisible		    = true
        hud_hdg_num_36.h_clip_relation      = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
        hud_hdg_num_36.level			    = HUD_DEFAULT_NOCLIP_LEVEL + 3
        hud_hdg_num_36.parent_element        = "HUD_RUMBOS_LR_2"  
        Add(hud_hdg_num_36)
    end

end


