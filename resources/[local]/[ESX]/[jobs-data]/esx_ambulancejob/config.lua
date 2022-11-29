Config                            = {}

Config.DrawDistance							= 100.0
Config.MarkerColor							= { r = 102, g = 0, b = 102 }
Config.MarkerSize								= { x = 1.5, y = 1.5, z = 1.0 }
Config.DeleteMarkerSize					= { x = 3.0, y = 3.0, z = 1.0 }
Config.DeathCameraRadius					= 1.5
Config.ReviveReward							= 2000  -- revive reward, set to 0 if you don't want it enabled
Config.EnableSocietyOwnedVehicles	= false
Config.AntiCombatLog						= true -- enable anti-combat logging?
Config.Locale										= 'pl'
Config.EnablePeds = true
Config.DoctorLimit = true
Config.maxDoctor = 2
Config.doctorPrice = 10000

Config.Doctor = {
    {x = -676.59, y = 336.05, z = 83.12, heading = 313.19, type = 'legal'},

}

Config.RespawnToHospitalDelay		= 300000
Config.RemoveWeaponsAfterRPDeath	= true
Config.RemoveCashAfterRPDeath		= true
Config.RemoveItemsAfterRPDeath		= true

Config.Blips = {
    {
        Pos     = { x = -693.51, y = 311.84, z = 139.15 },
        Sprite  = 61,
        Display = 4,
        Scale   = 0.8,
        Colour  = 2,
        Label = _U('hospital')
    },
    {
        Pos     = { x = 1828.92, y = 3664.19, z = 32.96 },
        Sprite  = 61,
        Display = 4,
        Scale   = 0.8,
        Colour  = 2,
        Label = _U('hospital')
    },
    {
        Pos     = { x = -247.74, y = 6312.35, z = 38.8 },
        Sprite  = 61,
        Display = 4,
        Scale   = 0.8,
        Colour  = 2,
        Label = _U('hospital')
    },
    {
        Pos     = { x = 1201.1757, y = -1461.5619, z = 33.8568 },
        Sprite  = 436,
        Display = 4,
        Scale   = 0.8,
        Colour  = 76,
        Label = _U('firedepartment')
    },
    
    {
        Pos     = { x = 213.5345, y = -1642.0516, z = 28.7969 },
        Sprite  = 436,
        Display = 4,
        Scale   = 0.8,
        Colour  = 76,
        Label = _U('firedepartment')
    },
    {
        Pos     = { x = 1698.4231, y = 3583.9614, z = 34.5843 },
        Sprite  = 436,
        Display = 4,
        Scale   = 0.8,
        Colour  = 76,
        Label = _U('firedepartment')
    },
    {
        Pos     = { x = -368.6996, y = 6125.8955, z = 30.4908 },
        Sprite  = 436,
        Display = 4,
        Scale   = 0.8,
        Colour  = 76,
        Label = _U('firedepartment')
    }
}

Config.DeathPosition = {
	x = -682.66, y = 312.04, z = 83.08, heading = 257.48
}

Config.AuthorizedVehicles = {
	{
		grade = 0,
		model = 'zendrack',
		label = 'EMS1',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'sprinter7',
		label = 'EMS2',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'sprinter5',
		label = 'EMS3',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'sprinter4.ytd',
		label = '.EMS4',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'sprinter3',
		label = 'EMS5',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'sprinter1',
		label = 'EMS6',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'sprinter',
		label = 'EMS7',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'smur',
		label = 'EMS8',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'sheriffx6',
		label = 'EMS9',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'polmp4',
		label = 'EMS10',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'polgs350',
		label = 'EMS11',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'polaventa',
		label = 'EMS12',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'pol718',
		label = 'EMS13',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'mini',
		label = 'EMS14',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'inem_vwcrafter',
		label = 'EMS15',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'hcampana',
		label = 'EMS16',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'fk2',
		label = 'EMS17',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'f150',
		label = 'EMS18',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'ems_gs1200',
		label = 'EMS19',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'EC135',
		label = 'EMS20',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'anpc_trailer',
		label = 'EMS21',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'anpc_l200',
		label = 'EMS22',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
	{
		grade = 0,
		model = 'ambulance22',
		label = 'EMS23',
		livery = 0,
		extras = {
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,
			[12] = 1,
		}
	},
}


Config.Zones = {
	--[[HospitalInteriorElevator1 = { -- Pillbox main elevator
		Pos	= { x = 335.9275, y = -580.0391, z = 27.9511 },
		Teleport = { x = 335.2135, y = -581.6018, z = 27.9511, heading = 158.56 },
		Type = 1
	},

	HospitalInteriorElevator2 = {
		Pos	= { x = 335.9061, y = -579.9466, z = 42.341 },
		Teleport = { x = 335.2173, y = -581.7332, z = 42.3353, heading = 160.73 },
		Type = 1
	},

	HospitalInteriorElevator3 = {
		Pos	= { x = 335.8353, y = -580.11, z = 47.2909 },
		Teleport = { x = 335.2168, y = -581.7358, z = 47.2742, heading = 162.76 },
		Type = 1
	},

	HospitalInteriorElevator4 = {
		Pos	= { x = 335.8838, y = -579.9323, z = 73.1204 },
		Teleport = { x = 335.2468, y = -581.6038, z = 73.1188, heading = 156.18 },
		Type = 1
	},

	HospitalInteriorEntering1 = { -- Pillbox second elevator
		Pos	= { x = 331.0914, y = -593.0497, z = 27.9511 },
		Teleport = { x = 331.8472, y = -591.3918, z = 42.332, heading = 341.5 },
		Type = 1
	},

	HospitalInteriorExit1 = {
		Pos	= { x = 331.064, y = -593.1516, z = 42.332 },
		Teleport = { x = 331.8382, y = -591.4169, z = 27.9511, heading = 340.78 },
		Type = 1
	},

	HospitalInteriorEntering2 = { -- LSFD floor
		Pos	= { x = 1128.2247, y = -1510.0708, z = 38.7765 },
		Teleport = { x = 1121.6097, y = -1516.8363, z = 29.725, heading = 327.27 },
		Type = 1
	},

	HospitalInteriorExit2 = {
		Pos	= { x = 1121.6097, y = -1516.8363, z = 29.725 },
		Teleport = { x = 1128.2247, y = -1510.0708, z = 38.7765, heading = 269.64 },
		Type = 1
	},

	HospitalInteriorEntering3 = { -- LSFD back
		Pos	= { x = 1102.2629, y = -1528.6625, z = 34.0826 },
		Teleport = { x = 1175.8319, y = -1556.2474, z = 29.5386, heading = 321.82 },
		Type = 1
	},

	HospitalInteriorExit3 = {
		Pos	= { x = 1175.8319, y = -1556.2474, z = 29.5386 },
		Teleport = { x = 1102.2629, y = -1528.6625, z = 34.0826, heading = 176.2 },
		Type = 1
	},

	HospitalInteriorEntering4 = { -- Eclipse Rooftop
		Pos	= { x = -668.6606, y = 350.3919, z = 82.2046 },
		Teleport = { x = -689.8287, y = 322.7919, z = 139.198, heading = 85.39 },
		Type = 1
	},

	HospitalInteriorExit4 = {
		Pos	= { x = -689.8287, y = 322.7919, z = 139.198 },
		Teleport = { x = -668.6606, y = 350.3919, z = 82.2046, heading = 175.63 },
		Type = 1
	},]]

	--ECLIPSE
	AmbulanceActions = {
		Pos	= { x = -663.8, y = 319.53, z = 82.12 },
		Type = 1
	},

	Pharmacy = {
		Pos	= { x = -702.17, y = 323.26, z = 82.12 },
		Type = 1
	},

	BossActions = {
		Pos	= { x = -682.46, y = 358.25, z = 82.12 },
		Type = 1
	},

	VehicleSpawner = {
		Pos	= { x = -699.83, y = 306.43, z = 81.95 },
		Type = 1
	},

	VehicleSpawnPoint = {
		Pos	= { x = -699.83, y = 306.43, z = 81.95 },
		Heading = 341.2,
		Type = -1
	},

	VehicleDeleter = {
		Pos	= { x = -699.29, y = 312.72, z = 81.96 },
		Type = 1
	},

	HeliDeleter = {
		Pos	= { x = -710.12, y = 322.97, z = 139.15 },
		Type = 1
	},

	HeliSpawner = {
		Pos	= { x = -704.33, y = 323.28, z = 139.15 },
		Type = 1
	},

	HeliSpawnPoint = {
		Pos	= { x = -704.33, y = 323.28, z = 139.15 },
		Heading = 248.17,
		Type = -1
	},

	--SANDY
	AmbulanceActions2 = {
		Pos	= { x = 1825.18, y = 3674.97, z = 33.27 },
		Type = 1
	},

	Pharmacy2 = {
		Pos	= { x = 1843.61, y = 3681.47, z = 33.27 },
		Type = 1
	},

	BossActions2 = {
		Pos	= { x = 1839.89, y = 3686.69, z = 33.27 },
		Type = 1
	},

	VehicleSpawner2 = {
		Pos	= { x = 1836.93, y = 3699.06, z = 33.19 },
		Type = 1
	},

	VehicleSpawnPoint2 = {
		Pos	= { x = 1836.93, y = 3699.06, z = 33.19 },
		Heading = 341.2,
		Type = -1
	},

	VehicleDeleter2 = {
		Pos	= { x = 1827.18, y = 3693.6, z = 33.22 },
		Type = 1
	},

	HeliDeleter2 = {
		Pos	= { x = 1826.54, y = 3656.83, z = 33.05},
		Type = 1
	},

	HeliSpawner2 = {
		Pos	= { x = 1817.74, y = 3651.31, z = 33.24 },
		Type = 1
	},

	HeliSpawnPoint2 = {
		Pos	= { x = 1817.74, y = 3651.31, z = 33.24 },
		Heading = 248.17,
		Type = -1
	},

	--PLAETO
	AmbulanceActions3 = {
		Pos	= { x = -260.15, y = 6318.75, z = 31.43 },
		Type = 1
	},

	Pharmacy3 = {
		Pos	= { x = -250.34, y = 6311.53, z = 31.43 },
		Type = 1
	},

	BossActions3 = {
		Pos	= { x = -256.74, y = 6306.47, z = 31.43 },
		Type = 1
	},

	VehicleSpawner3 = {
		Pos	= { x = -244.0, y = 6339.05, z = 31.35 },
		Type = 1
	},

	VehicleSpawnPoint3 = {
		Pos	= { x = -244.0, y = 6339.05, z = 31.35 },
		Heading = 341.2,
		Type = -1
	},

	VehicleDeleter3 = {
		Pos	= { x = -237.31, y = 6332.31, z = 31.36 },
		Type = 1
	},

	HeliDeleter3 = {
		Pos	= { x = -249.97, y = 6317.4, z = 38.66 },
		Type = 1
	},

	HeliSpawner3 = {
		Pos	= { x = -255.43, y = 6323.24, z = 38.66  },
		Type = 1
	},

	HeliSpawnPoint3 = {
		Pos	= { x = -255.43, y = 6323.24, z = 38.66  },
		Heading = 248.17,
		Type = -1
	}
}