dofile(LockOn_Options.script_path.."MFD-L/Indicator/base_page.lua")
dofile(LockOn_Options.script_path.."MFD-L/Device/device_defs.lua")
--Texture declaring
local BlackColor  = {0, 0, 0, 255}       --RGBA
local WhiteColor 	= {255, 255, 255, 100} --RGBA
local MainColor 	= {255, 255, 255, 255} --RGBA
local GreenColor 	= {05, 255, 10, 180}   --RGBA
local YellowColor = {255, 255, 0, 255}   --RGBA
local OrangeColor = {79.2, 33.7, 0, 255}   --RGBA
local RedColor 		= {255, 0, 0, 255}     --RGBA
local TealColor 	= {0, 255, 255, 255}   --RGBA
local BlueColor     = {0, 5, 255, 255}


MFDL_IND_TEX_PATH = LockOn_Options.script_path.."../Textures/MFD/ACUE Page/"
Backline = MakeMaterial(MFDL_IND_TEX_PATH.."Back_line.dds", BlueColor)
TextACUE = MakeMaterial(MFDL_IND_TEX_PATH.."Text.dds", WhiteColor)
CanopylineACUE = MakeMaterial(MFDL_IND_TEX_PATH.."ACUE_Canopy_Open_White.dds", WhiteColor)
CanopyRedACUE = MakeMaterial(MFDL_IND_TEX_PATH.."ACUE_Canopy_Open_Red.dds", RedColor)
Engine_StartACUE = MakeMaterial(MFDL_IND_TEX_PATH.."Engine_start.PNG", WhiteColor)
Test1 = MakeMaterial(MFDL_IND_TEX_PATH.."MultiColour_test.PNG", WhiteColor)
Leftlpcock = MakeMaterial(MFDL_IND_TEX_PATH.."Left_LP_Cock.PNG", WhiteColor)
Rightlpcock = MakeMaterial(MFDL_IND_TEX_PATH.."Right_LP_Cock.PNG", WhiteColor)
Parkingbrake = MakeMaterial(MFDL_IND_TEX_PATH.."Park_brake.PNG", WhiteColor)
Fcsready_png = MakeMaterial(MFDL_IND_TEX_PATH.."FCS_Ready.PNG", WhiteColor)
Powergo = MakeMaterial(MFDL_IND_TEX_PATH.."Power_Go.PNG", WhiteColor)
Powernogo = MakeMaterial(MFDL_IND_TEX_PATH.."Power_NoGo.PNG", WhiteColor)
GPSLINS = MakeMaterial(MFDL_IND_TEX_PATH.."GPS_and_LINS.PNG", WhiteColor)
misctext = MakeMaterial(MFDL_IND_TEX_PATH.."Misc.PNG", WhiteColor)
Canopy = MakeMaterial(MFDL_IND_TEX_PATH.."ACUE_Canopy.PNG", WhiteColor)
Canopytwo = MakeMaterial(MFDL_IND_TEX_PATH.."ACUE_CNPY.PNG", WhiteColor)
--------------------------------------------------------------------
-- Buttontest = MakeMaterial(MFDL_IND_TEX_PATH.."Misc.PNG", WhiteColor)
--------------------------------------------------------------------

local CanopyPos = {0.82, 0.4, 0}
local CanopyRot = {0, 0, 0}

local StartEnginePos = {-0.5, 0.71, 0}
local StartEngineRot = {0, 0, 0}

local StartLeftcockPos = {-0.561, 0.6, 0}
local StartLeftcockRot = {0, 0, 0}

local StartRightcockPos = {-0.54, 0.5, 0}
local StartRightcockRot = {0, 0, 0}

local ParkingBrakePos = {-0.59, 0.4, 0}
local ParkingBrakeRot = {0, 0, 0}

local FCSReadyPos = {-0.56, 0.156, 0}
local FCSReadyRot = {0, 0, 0}

local GPSLINSPos = {0.72, -0.042, 0}
local GPSLINSRot = {0, 0, 0}

local PowerupPos = {0, 0, 0}
local PowerupRot = {0, 0, 0}
-------------------------------------------------BACK----------------------------------------------------------------------

-- local buttons                    = CreateElement "ceTexPoly"
-- buttons.vertices                 = mfdl_vert_gen(200000, 200000)
-- buttons.indices                  = {0,1,2,0,3,2}
-- buttons.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
-- buttons.material                 = Buttontest
-- buttons.name                     = create_guid_string()
-- buttons.primitivetype            = "triangles"
-- buttons.init_pos                 = {0, 0, 0}
-- buttons.init_rot                 = {0, 0, 0}
-- buttons.collimated               = true
-- buttons.use_mipfilter            = true
-- buttons.additive_alpha           = true
-- buttons.h_clip_relation          = h_clip_relations.COMPARE
-- buttons.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
-- buttons.element_params           = {"BATTERY"}
-- buttons.controllers              = {{"parameter_compare_with_number", 0, 1}}
-- buttons.parent_element           = "MFD_base_clip"
-- Add(buttons)

local textmisc                    = CreateElement "ceTexPoly"
textmisc.vertices                 = mfdl_vert_gen(241000, 241000)
textmisc.indices                  = {0,1,2,0,3,2}
textmisc.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
textmisc.material                 = misctext
textmisc.name                     = create_guid_string()
textmisc.primitivetype            = "triangles"
textmisc.init_pos                 = {-0.5, -0.7, 0}
textmisc.init_rot                 = {0, 0, 0}
textmisc.collimated               = true
textmisc.use_mipfilter            = true
textmisc.additive_alpha           = true
textmisc.h_clip_relation          = h_clip_relations.COMPARE
textmisc.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
textmisc.element_params           = {"BATTERY"}
textmisc.controllers              = {{"parameter_compare_with_number", 0, 1}}
textmisc.parent_element           = "MFD_base_clip"
Add(textmisc)

local line                    = CreateElement "ceTexPoly"
line.vertices                 = mfdl_vert_gen(39000, 10000)
line.indices                  = {0,1,2,0,3,2}
line.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
line.material                 = Backline
line.name                     = create_guid_string()
line.primitivetype            = "triangles"
line.init_pos                 = {0, 0, 0}
line.init_rot                 = {0, 0, 0}
line.collimated               = true
line.use_mipfilter            = true
line.additive_alpha           = true
line.h_clip_relation          = h_clip_relations.COMPARE
line.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
line.element_params           = {"BATTERY"}
line.controllers              = {{"parameter_compare_with_number", 0, 1}}
line.parent_element           = "MFD_base_clip"
Add(line)

-- local test                    = CreateElement "ceTexPoly"
-- test.vertices                 = mfdl_vert_gen(59000, 59000)
-- test.indices                  = {0,1,2,0,3,2}
-- test.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
-- test.material                 = Test1
-- test.name                     = create_guid_string()
-- test.primitivetype            = "triangles"
-- test.init_pos                 = {0, 0, 0}
-- test.init_rot                 = {0, 0, 0}
-- test.collimated               = true
-- test.use_mipfilter            = true
-- test.additive_alpha           = true
-- test.h_clip_relation          = h_clip_relations.COMPARE
-- test.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
-- test.element_params           = {"BATTERY"}
-- test.controllers              = {{"parameter_compare_with_number", 0, 1}}
-- test.parent_element           = "MFD_base_clip"
-- Add(test)

local Text                    = CreateElement "ceTexPoly"
Text.vertices                 = mfdl_vert_gen(39000, 10000)
Text.indices                  = {0,1,2,0,3,2}
Text.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
Text.material                 = TextACUE
Text.name                     = create_guid_string()
Text.primitivetype            = "triangles"
Text.init_pos                 = {0, 0, 0}
Text.init_rot                 = {0, 0, 0}
Text.collimated               = true
Text.use_mipfilter            = true
Text.additive_alpha           = true
Text.h_clip_relation          = h_clip_relations.COMPARE
Text.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
Text.element_params           = {"BATTERY"}
Text.controllers              = {{"parameter_compare_with_number", 0, 1}}
Text.parent_element           = "MFD_base_clip"
Add(Text)
-------------------------------------------------CANOPY----------------------------------------------------------------------
-- local CRed                    = CreateElement "ceTexPoly"
-- CRed.vertices                 = mfdl_vert_gen(5000, 5000)
-- CRed.indices                  = {0,1,2,0,3,2}
-- CRed.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
-- CRed.material                 = CanopyRedACUE
-- CRed.name                     = create_guid_string()
-- CRed.primitivetype            = "triangles"
-- CRed.init_pos                 = CanopyPos
-- CRed.init_rot                 = CanopyRot
-- CRed.collimated               = true
-- CRed.use_mipfilter            = true
-- CRed.additive_alpha           = true
-- CRed.h_clip_relation          = h_clip_relations.COMPARE
-- CRed.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
-- CRed.element_params           = {"BATTERY","CANOPYONOFF"}
-- CRed.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 1}}
-- CRed.parent_element           = "MFD_base_clip"
-- Add(CRed)

-- local CLine                    = CreateElement "ceTexPoly"
-- CLine.vertices                 = mfdl_vert_gen(5000, 5000)
-- CLine.indices                  = {0,1,2,0,3,2}
-- CLine.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
-- CLine.material                 = CanopylineACUE
-- CLine.name                     = create_guid_string()
-- CLine.primitivetype            = "triangles"
-- CLine.init_pos                 = CanopyPos
-- CLine.init_rot                 = CanopyRot
-- CLine.collimated               = true
-- CLine.use_mipfilter            = true
-- CLine.additive_alpha           = true
-- CLine.h_clip_relation          = h_clip_relations.COMPARE
-- CLine.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
-- CLine.element_params           = {"BATTERY","CANOPYONOFF"}
-- CLine.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 1}}
-- CLine.parent_element           = "MFD_base_clip"
-- Add(CLine)

local CLine                    = CreateElement "ceTexPoly"
CLine.vertices                 = mfdl_vert_gen(220000, 220000)
CLine.indices                  = {0,1,2,0,3,2}
CLine.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
CLine.material                 = Canopy
CLine.name                     = create_guid_string()
CLine.primitivetype            = "triangles"
CLine.init_pos                 = CanopyPos
CLine.init_rot                 = CanopyRot
CLine.collimated               = true
CLine.use_mipfilter            = true
CLine.additive_alpha           = true
CLine.h_clip_relation          = h_clip_relations.COMPARE
CLine.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
CLine.element_params           = {"BATTERY","CANOPYONOFF"}
CLine.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 1}}
CLine.parent_element           = "MFD_base_clip"
Add(CLine)

local CRed                    = CreateElement "ceTexPoly"
CRed.vertices                 = mfdl_vert_gen(221000, 221000)
CRed.indices                  = {0,1,2,0,3,2}
CRed.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
CRed.material                 = Canopytwo
CRed.name                     = create_guid_string()
CRed.primitivetype            = "triangles"
CRed.init_pos                 = {0.52, 0.4, 0}
CRed.init_rot                 = CanopyRot
CRed.collimated               = true
CRed.use_mipfilter            = true
CRed.additive_alpha           = true
CRed.h_clip_relation          = h_clip_relations.COMPARE
CRed.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
CRed.element_params           = {"BATTERY","CANOPYONOFF"}
CRed.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 1}}
CRed.parent_element           = "MFD_base_clip"
Add(CRed)
-------------------------------------------------ENGINE----------------------------------------------------------------------
local EngOrange                    = CreateElement "ceTexPoly"
EngOrange.vertices                 = mfdl_vert_gen(50000, 50000)
EngOrange.indices                  = {0,1,2,0,3,2}
EngOrange.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
EngOrange.material                 = Engine_StartACUE
EngOrange.name                     = create_guid_string()
EngOrange.primitivetype            = "triangles"
EngOrange.init_pos                 = StartEnginePos
EngOrange.init_rot                 = StartEngineRot
EngOrange.collimated               = true
EngOrange.use_mipfilter            = true
EngOrange.additive_alpha           = true
EngOrange.h_clip_relation          = h_clip_relations.COMPARE
EngOrange.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
EngOrange.element_params           = {"BATTERY","ENGINESTART"}
EngOrange.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 0}}
EngOrange.parent_element           = "MFD_base_clip"
Add(EngOrange)

-- local EngText                    = CreateElement "ceTexPoly"
-- EngText.vertices                 = mfdl_vert_gen(5000, 5000)
-- EngText.indices                  = {0,1,2,0,3,2}
-- EngText.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
-- EngText.material                 = EnginetextACUE
-- EngText.name                     = create_guid_string()
-- EngText.primitivetype            = "triangles"
-- EngText.init_pos                 = StartEnginePos
-- EngText.init_rot                 = StartEngineRot
-- EngText.collimated               = true
-- EngText.use_mipfilter            = true
-- EngText.additive_alpha           = true
-- EngText.h_clip_relation          = h_clip_relations.COMPARE
-- EngText.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
-- EngText.element_params           = {"BATTERY"}
-- EngText.controllers              = {{"parameter_compare_with_number", 0, 1}}
-- EngText.parent_element           = "MFD_base_clip"
-- Add(CLine)
-------------------------------------------------LPCOCK----------------------------------------------------------------------
local llpcock                    = CreateElement "ceTexPoly"
llpcock.vertices                 = mfdl_vert_gen(221000, 221000)
llpcock.indices                  = {0,1,2,0,3,2}
llpcock.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
llpcock.material                 = Leftlpcock
llpcock.name                     = create_guid_string()
llpcock.primitivetype            = "triangles"
llpcock.init_pos                 = StartLeftcockPos
llpcock.init_rot                 = StartLeftcockRot
llpcock.collimated               = true
llpcock.use_mipfilter            = true
llpcock.additive_alpha           = true
llpcock.h_clip_relation          = h_clip_relations.COMPARE
llpcock.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
llpcock.element_params           = {"BATTERY","ENGINESTARTL"}
llpcock.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 0}}
llpcock.parent_element           = "MFD_base_clip"
Add(llpcock)

local rlpcock                    = CreateElement "ceTexPoly"
rlpcock.vertices                 = mfdl_vert_gen(221000, 221000)
rlpcock.indices                  = {0,1,2,0,3,2}
rlpcock.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
rlpcock.material                 = Rightlpcock
rlpcock.name                     = create_guid_string()
rlpcock.primitivetype            = "triangles"
rlpcock.init_pos                 = StartRightcockPos
rlpcock.init_rot                 = StartRightcockRot
rlpcock.collimated               = true
rlpcock.use_mipfilter            = true
rlpcock.additive_alpha           = true
rlpcock.h_clip_relation          = h_clip_relations.COMPARE
rlpcock.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
rlpcock.element_params           = {"BATTERY","ENGINESTARTR"}
rlpcock.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 0}}
rlpcock.parent_element           = "MFD_base_clip"
Add(rlpcock)
-------------------------------------------------Parking brake----------------------------------------------------------------------
local pbrake                    = CreateElement "ceTexPoly"
pbrake.vertices                 = mfdl_vert_gen(221000, 221000)
pbrake.indices                  = {0,1,2,0,3,2}
pbrake.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
pbrake.material                 = Parkingbrake
pbrake.name                     = create_guid_string()
pbrake.primitivetype            = "triangles"
pbrake.init_pos                 = ParkingBrakePos
pbrake.init_rot                 = ParkingBrakeRot
pbrake.collimated               = true
pbrake.use_mipfilter            = true
pbrake.additive_alpha           = true
pbrake.h_clip_relation          = h_clip_relations.COMPARE
pbrake.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
pbrake.element_params           = {"BATTERY","PARKING_BRAKE"}
pbrake.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 1}}
pbrake.parent_element           = "MFD_base_clip"
Add(pbrake)
-------------------------------------------------FCS/Power----------------------------------------------------------------------
local fcsready                    = CreateElement "ceTexPoly"
fcsready.vertices                 = mfdl_vert_gen(211000, 211000)
fcsready.indices                  = {0,1,2,0,3,2}
fcsready.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
fcsready.material                 = Fcsready_png
fcsready.name                     = create_guid_string()
fcsready.primitivetype            = "triangles"
fcsready.init_pos                 = FCSReadyPos
fcsready.init_rot                 = FCSReadyRot
fcsready.collimated               = true
fcsready.use_mipfilter            = true
fcsready.additive_alpha           = true
fcsready.h_clip_relation          = h_clip_relations.COMPARE
fcsready.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
fcsready.element_params           = {"BATTERY"}
fcsready.controllers              = {{"parameter_compare_with_number", 0, 1}}
fcsready.parent_element           = "MFD_base_clip"
Add(fcsready)

local gopower                    = CreateElement "ceTexPoly"
gopower.vertices                 = mfdl_vert_gen(211000, 211000)
gopower.indices                  = {0,1,2,0,3,2}
gopower.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
gopower.material                 = Powergo
gopower.name                     = create_guid_string()
gopower.primitivetype            = "triangles"
gopower.init_pos                 = PowerupPos
gopower.init_rot                 = PowerupRot
gopower.collimated               = true
gopower.use_mipfilter            = true
gopower.additive_alpha           = true
gopower.h_clip_relation          = h_clip_relations.COMPARE
gopower.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
gopower.element_params           = {"BATTERY","POWERUPONOFF"}
gopower.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 1}}
gopower.parent_element           = "MFD_base_clip"
Add(gopower)

local nogopower                    = CreateElement "ceTexPoly"
nogopower.vertices                 = mfdl_vert_gen(211000, 211000)
nogopower.indices                  = {0,1,2,0,3,2}
nogopower.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
nogopower.material                 = Powernogo
nogopower.name                     = create_guid_string()
nogopower.primitivetype            = "triangles"
nogopower.init_pos                 = PowerupPos
nogopower.init_rot                 = PowerupRot
nogopower.collimated               = true
nogopower.use_mipfilter            = true
nogopower.additive_alpha           = true
nogopower.h_clip_relation          = h_clip_relations.COMPARE
nogopower.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
nogopower.element_params           = {"BATTERY","POWERUPONOFF"}
nogopower.controllers              = {{"parameter_compare_with_number", 0, 1},{"parameter_compare_with_number", 1, 0}}
nogopower.parent_element           = "MFD_base_clip"
Add(nogopower)

local GPSandLINS                    = CreateElement "ceTexPoly"
GPSandLINS.vertices                 = mfdl_vert_gen(211000, 211000)
GPSandLINS.indices                  = {0,1,2,0,3,2}
GPSandLINS.tex_coords               = tex_coord_gen(0,0,512,512,512,512)
GPSandLINS.material                 = GPSLINS
GPSandLINS.name                     = create_guid_string()
GPSandLINS.primitivetype            = "triangles"
GPSandLINS.init_pos                 = GPSLINSPos
GPSandLINS.init_rot                 = GPSLINSRot
GPSandLINS.collimated               = true
GPSandLINS.use_mipfilter            = true
GPSandLINS.additive_alpha           = true
GPSandLINS.h_clip_relation          = h_clip_relations.COMPARE
GPSandLINS.level                    = MFDL_DEFAULT_NOCLIP_LEVEL
GPSandLINS.element_params           = {"BATTERY"}
GPSandLINS.controllers              = {{"parameter_compare_with_number", 0, 1}}
GPSandLINS.parent_element           = "MFD_base_clip"
Add(GPSandLINS)