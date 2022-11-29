Config                            = {}

Config.DrawDistance               = 100.0

Config.NPCJobEarnings             = {min = 1300, max = 1800}
Config.MinimumDistance            = 300

Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.Locale                     = 'pl'

Config.AuthorizedVehicles = {

	{
		model = 'p1',
		label = 'Tu bedzie auto dla taxi'
	},
}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = 893.47, y = -155.93, z = 75.90},
		Size  = {x = 1.5, y = 1.5, z = 0.8},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
	},

	VehicleSpawnPoint = {
		Pos     = {x = 903.31, y = -143.51, z = 75.65},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1,
		Heading = 323.36
	},

	VehicleDeleter = {
		Pos   = {x = 897.39, y = -151.91, z = 75.65},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1, Rotate = false
	},

	TaxiActions = {
		Pos   = {x = 899.25, y = -159.07, z = 73.20},
		Size  = {x = 1.5, y = 1.5, z = 0.7},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1, 
	},

	Cloakroom = {
		Pos     = {x = 893.94, y = -171.94, z = 74.68}, --893.94 -171.94 74.68
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 204, g = 204, b = 0},
		Type    = 21, Rotate = true
	}
}

Config.JobLocations = {
	vector3(-313.1, 229.8, 87.2),
	vector3(-752.2, 297.7, 84.9),
	vector3(-1608.0, 186.2, 58.0),
	vector3(-563.4, -163.4, 37.6),
	vector3(-289.1, -414.6, 29.6),
	vector3(-225.8, -956.9, 28.7),
	vector3(-316.3, -1539.2, 27.2),
	vector3(-140.2, -1986.6, 22.3),
	vector3(-1044.5, -2525.4, 19.6),
	vector3(-752.8, -2293.6, 12.3),
	vector3(-1006.1, -2115.8, 11.3),
	vector3(19.9, -1713.3, 28.8),
	vector3(400.5, -1914.1, 24.4),
	vector3(1246.5, -1601.6, 52.4),
	vector3(1054.9, -2266.2, 29.9),
	vector3(197.8, -3166.5, 5.3),
	vector3(1095.7, -771.7, 56.8),
	vector3(880.2, -513.4, 56.7),
	vector3(623.4, 108.4, 92.0),
	vector3(110.9, 487.2, 146.5),
	vector3(-806.8, 425.1, 91.0),
	vector3(-1637.5, -228.7, 54.2),
	vector3(-2159.1, -407.2, 12.9),
	vector3(-1854.3, -614.9, 10.6),
	vector3(-1732.3, -727.8, 9.9),
	vector3(-1182.6, -1472.0, 3.9),
	vector3(-1023.0, -1521.3, 5.1),
	vector3(-1076.2, -1010.44, 1.6),
	vector3(-1287.51, -632.07, 26.1),
	vector3(-1601.3, -1045.1, 12.5),
	vector3(-1331.1, -513.2, 32.1),
	vector3(-795.0, -668.0, -28.2),
	vector3(-513.0, -775.3, 30.7),
	vector3(-45.0, -1150.6, 25.7),
	vector3(244.5, -349.5, 43.8),
	vector3(333.8, -91.9, 67.6),
}