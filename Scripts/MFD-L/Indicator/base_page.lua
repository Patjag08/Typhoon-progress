dofile(LockOn_Options.script_path.."MFD-L/Device/device_defs.lua")

local half_width = GetScale()
local half_height = GetAspect() * half_width

local x_size        = 1	--MFD_SIZE-- * MFD_SCALE
local y_size        = 1	--MFD_SIZE --* MFD_SCALE
local corner		= 0.9


local vert		= {	{-x_size, y_size * corner},
					{ x_size, y_size * corner},
					{ x_size,-y_size * corner},
					{-x_size,-y_size * corner},
					
					{-x_size, 		y_size * corner},
					{ x_size, 		y_size * corner},
					{ x_size * corner, y_size},
					{-x_size * corner, y_size},
					
					{-x_size, 		-y_size * corner},
					{ x_size, 		-y_size * corner},
					{ x_size * corner,-y_size},
					{-x_size * corner,-y_size},
				}
local indi		 	= {	0, 1, 2, 0, 2, 3,
						4, 5, 6, 4, 6, 7,
						8, 9, 10, 8, 10, 11,
						} --default_box_indices


local aspect = GetAspect()

MFD_base_clip                   = CreateElement "ceMeshPoly"
MFD_base_clip.name              = "MFD_base_clip"
MFD_base_clip.primitivetype     = "triangles"
MFD_base_clip.vertices          = { {1, aspect}, { 1,-aspect}, { -1,-aspect}, {-1,aspect},}
MFD_base_clip.indices           = {0,1,2,0,2,3}
MFD_base_clip.init_pos          = {0, 0, 0}
MFD_base_clip.init_rot          = {0, 0, 0}
MFD_base_clip.material          = "DBG_BLACK"
MFD_base_clip.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
MFD_base_clip.level             = MFDL_DEFAULT_NOCLIP_LEVEL
MFD_base_clip.isdraw            = true
MFD_base_clip.change_opacity    = true
MFD_base_clip.element_params    = {}
MFD_base_clip.controllers       = {}
MFD_base_clip.isvisible         = true
Add(MFD_base_clip)

