dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")

indicator_type = indicator_types.COMMON
purposes       = {render_purpose.GENERAL, render_purpose.MFD_ONLY_VIEW}

BASE = 1
--ACUE = 2

page_subsets = {
	[BASE]      = LockOn_Options.script_path.."MFD-L/Indicator/base_page.lua",
	--[ACUE]      = LockOn_Options.script_path.."MFD-L/Indicator/acue_page.lua",
	--[RAD]      = LockOn_Options.script_path.."MFD-L/Indicator/radar_page.lua",
}

pages = {
	{BASE,},
	--{ACUE,},
	--{RAD,},
}

init_pageID = 1

update_screenspace_diplacement(SelfWidth/SelfHeight, false)

dedicated_viewport_arcade = dedicated_viewport