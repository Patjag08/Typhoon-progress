local count = 0
local function counter()
	count = count + 1
	return count
end
-------DEVICE ID----------
devices = {}
devices["PARAMETERS"]				 = counter()
devices["ELECTRIC_SYSTEM"]	 = counter()
devices["UTILITIES"]				 = counter()
devices["ENGINE"]					   = counter()
devices["PARKING_BRAKE"]		 = counter()
devices["SLAT_SYSTEM"]			 = counter()
devices["FLAP_SYSTEM"]			 = counter()
devices["FCS_SYSTEM"]				 = counter()
devices["SUPERSONIC_SYSTEM"] = counter()
devices["FBW_SYSTEM"]				 = counter()
--devices["FBW_SYSTEM_API"]	 = counter()
devices["GEAR_SYSTEM"]       = counter()
devices["GROUND"]            = counter()
devices["ADI"]						   = counter()
devices["UFC"]						   = counter()
devices["HMD"]						   = counter()
devices["APU"]						   = counter()
-- devices["LOW_HT"]				 = counter()
devices["HUD"]						   = counter()
devices["MFDL"]             = counter()
devices["MFDR"]             = counter()
devices["CANOPY"]					   = counter()
devices["RADAR"]					 = counter()
devices["RWR"]						   = counter()
devices["MISC_ELEC"]				 = counter()
devices["NVG"]               = counter()
