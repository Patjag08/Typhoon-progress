dofile(LockOn_Options.script_path.."APU/Device/device_defs.lua")

SHOW_MASKS = true

-- text_using_parameter
-- move_up_down_using_parameter
-- move_left_right_using_parameter
-- rotate_using_parameter
-- parameter_in_range


local half_width = GetScale()
local half_height = GetAspect() * half_width

local aspect = GetAspect()


APU_base_clip                   = CreateElement "ceMeshPoly"
APU_base_clip.name              = "APU_base_clip"
APU_base_clip.primitivetype     = "triangles"
APU_base_clip.vertices          = { {0.1 * aspect, 0.1 * aspect}, { 0.1 * aspect,-0.1 * aspect}, { -0.1 * aspect,-0.1 * aspect}, {-0.1 * aspect, 0.1 * aspect},}
APU_base_clip.indices           = {0,1,2,0,2,3}
APU_base_clip.init_pos          = {-0.37, -0.17, 0.01}
APU_base_clip.init_rot          = {0, 0, 90 - 14}
APU_base_clip.material          = MakeMaterial(nil,{0, 255, 0, 255})
APU_base_clip.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
APU_base_clip.level             = APU_DEFAULT_NOCLIP_LEVEL +1
APU_base_clip.isdraw            = true
APU_base_clip.change_opacity    = true
APU_base_clip.element_params    = {"BATTERY"}
APU_base_clip.controllers       = {{"parameter_compare_with_number",0,1}}
APU_base_clip.isvisible         = true
Add(APU_base_clip)

APU_base_clip_2                   = CreateElement "ceMeshPoly"
APU_base_clip_2.name              = "APU_base_clip_2"
APU_base_clip_2.primitivetype     = "triangles"
APU_base_clip_2.vertices          = { {0.1 * aspect, 0.1 * aspect}, { 0.1 * aspect,-0.1 * aspect}, { -0.1 * aspect,-0.1 * aspect}, {-0.1 * aspect, 0.1 * aspect},}
APU_base_clip_2.indices           = {0,1,2,0,2,3}
APU_base_clip_2.init_pos          = {-0.39, -0.17, 0.01}
APU_base_clip_2.init_rot          = {0, 0, 90 - 14}
APU_base_clip_2.material          = MakeMaterial(nil,{255, 255, 0, 255})
APU_base_clip_2.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
APU_base_clip_2.level             = APU_DEFAULT_NOCLIP_LEVEL +1
APU_base_clip_2.isdraw            = true
APU_base_clip_2.change_opacity    = true
APU_base_clip_2.element_params    = {"APU"}
APU_base_clip_2.controllers       = {{"parameter_compare_with_number",0,1}}
APU_base_clip_2.isvisible         = true
Add(APU_base_clip_2)



local apu_text             = CreateElement "ceStringPoly" 
apu_text.material          = "font_Display_green"             
apu_text.init_pos          = {-0.05 , 0.0 , 0}    
apu_text.alignment         = "LeftCenter"       
apu_text.stringdefs        = {0.00850,0.00850, 0.0008, 0}     
apu_text.formats           = {"APU","%s"} 
apu_text.element_params    = {"BATTERY","BATTERY"}
apu_text.controllers       = {{"text_using_parameter",0},{"parameter_compare_with_number",0,1}}
apu_text.collimated        = true
apu_text.use_mipfilter     = true
apu_text.additive_alpha    = false
apu_text.isvisible		    = true
apu_text.h_clip_relation   = h_clip_relations.COMPARE -- INCREASE_IF_LEVEL-- --REWRITE_LEVEL
apu_text.level			    = APU_DEFAULT_NOCLIP_LEVEL +1
apu_text.parent_element    = "APU_base_clip"  
Add(apu_text)

local APUON_LINE                   = CreateElement "ceTexPoly"
APUON_LINE.vertices                 = APU_vert_gen(1100,1000)
APUON_LINE.indices                  = {0,1,2,2,3,0}
APUON_LINE.tex_coords               = tex_coord_gen(0,0,1024,1024,1024,1024)
APUON_LINE.material                 = APU_LINE
APUON_LINE.name                     = create_guid_string()
APUON_LINE.init_pos                 = {0.04 , 0.07 , -0.0}  
APUON_LINE.init_rot                 = {0, 0, 0}
APUON_LINE.collimated               = true
APUON_LINE.use_mipfilter            = true
APUON_LINE.additive_alpha           = false
APUON_LINE.h_clip_relation          = h_clip_relations.COMPARE
APUON_LINE.level                    = APU_DEFAULT_NOCLIP_LEVEL +1
APUON_LINE.parent_element           = "APU_base_clip_2"
Add(APUON_LINE)

local APUON_LINE_2                   = CreateElement "ceTexPoly"
APUON_LINE_2.vertices                 = APU_vert_gen(1400,1000)
APUON_LINE_2.indices                  = {0,1,2,2,3,0}
APUON_LINE_2.tex_coords               = tex_coord_gen(0,0,1024,1024,1024,1024)
APUON_LINE_2.material                 = APU_LINE
APUON_LINE_2.name                     = create_guid_string()
APUON_LINE_2.init_pos                 = {0.0 , -0.07 , -0.02}  
APUON_LINE_2.init_rot                 = {0, 0, 0}
APUON_LINE_2.collimated               = true
APUON_LINE_2.use_mipfilter            = true
APUON_LINE_2.additive_alpha           = false
APUON_LINE_2.h_clip_relation          = h_clip_relations.COMPARE
APUON_LINE_2.level                    = APU_DEFAULT_NOCLIP_LEVEL +1
APUON_LINE_2.parent_element           = "APU_base_clip_2"
Add(APUON_LINE_2)
-- --------------------------------------------------------------------
