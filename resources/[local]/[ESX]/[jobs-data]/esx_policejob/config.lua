Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 0, g = 130, b = 204 }
Config.Marker 			 		  = {Type = 27, r = 0, g = 127, b = 22}
Config.EnableArmoryManagement     = true
Config.EnableLicenses             = true
Config.EnableHandcuffTimer        = true
Config.HandcuffTimer              = 15 * 60000
Config.MaxInService               = -1
Config.Locale                     = 'pl'
Config.ReceiveAmmo = 250
Config.Colors = {
	{ label = _U('black'), value = 'black'},
	{ label = _U('white'), value = 'white'},
	{ label = _U('grey'), value = 'grey'},
	{ label = _U('red'), value = 'red'},
	{ label = _U('pink'), value = 'pink'},
	{ label = _U('blue'), value = 'blue'},
	{ label = _U('yellow'), value = 'yellow'},
	{ label = _U('green'), value = 'green'},
	{ label = _U('orange'), value = 'orange'},
	{ label = _U('brown'), value = 'brown'},
	{ label = _U('purple'), value = 'purple'},
	{ label = _U('chrome'), value = 'chrome'},
	{ label = _U('gold'), value = 'gold'}
}
Config.PoliceStations = {

	MissionRow = {
			Cloakrooms = {
				{ x = 460.83, y = -996.35, z = 29.69 }, 
			},


			Armories = {
				{ x = 482.68, y = -996.13, z = 29.69}, 
			},

			Vehicles = {
				{
					Spawner    = { x = 427.63, y = -986.49, z = 24.70 },
					SpawnPoint = { x = 431.54, y = -985.44, z = 24.7 },
					Heading    = 176.53
				},
				{
					Spawner    = { x = 459.35, y = -986.60, z = 24.70 },
					SpawnPoint = { x = 454.26, y = -985.44, z = 24.7 },
					Heading    = 176.53
				},
			},
			VehicleDeleters = {
				{ x = 450.26, y = -976.03, z = 24.7 },
				{ x = 435.39, y = -976.1, z = 24.7 },
				{ x = 475.92, y = -1023.64, z = 27.0 },
			},

			BossActions = {
				{ x = 460.5, y = -985.33, z = 29.50 },
			},
	},
	--[[VineWood = {
			Cloakrooms = {
				{ x = 618.75, y = 14.67, z = 81.78 }, 
			},


			Armories = {
				{ x = 624.19, y = -27.61, z = 81.78}, 
			},

			Vehicles = {
				{
					Spawner    = { x = 625.07, y = 20.28, z = 86.95 },
					SpawnPoint = { x = 620.83, y = 26.59, z = 87.45 },
					Heading    = 249.89
				},
			},
			VehicleDeleters = {
				{ x = 617.01, y = 28.18, z = 87.85 },
			},

			BossActions = {
				{ x = 629.56, y = -8.86, z = 81.78 },
			},
	},
	Davis = {
			Cloakrooms = {
				{ x = -382.51, y = -1609.79, z = 28.29 }, 
			},


			Armories = {
				{ x = 368.35, y = -1600.08, z = 28.29 },  
			},

			Vehicles = {
				{
					Spawner    = { x = 373.47, y = -1617.33, z = 28.29 },
					SpawnPoint = { x = 378.51, y = -1630.51, z = 27.31},
					Heading    = 317.52
				},
			},
			VehicleDeleters = {
				{ x = 386.46, y = -1635.47, z = 28.29 },
			},

			BossActions = {
				{ x = 388.54, y = -1601.39, z = 28.29 },
			},
	},	]]
	Sandy = {
			Cloakrooms = {
				{ x = 1849.11, y = 3695.73, z = 33.27}, 
			},


			Armories = {
				{ x = 1842.0, y = 3691.04, z = 33.27},  
			},

			Vehicles = {
				{
					Spawner    = { x = 1855.64, y = 3702.24, z = 33.27 },
					SpawnPoint = { x = 1861.7, y = 3704.48, z = 32.45},
					Heading    = 214.57
				},
			},
			VehicleDeleters = {
				{ x = 1867.28, y = 3694.59, z = 32.65},
			},

			BossActions = {
				{ x = 1861.89, y = 3689.17, z = 33.27},
			},
	},
	--[[Paleto = {
			Cloakrooms = {
				{ x = -453.07, y = 6013.78, z = 30.72}, 
			},


			Armories = {
				{ x = -437.03, y = 5997.43, z = 30.72},  
			},

			Vehicles = {
				{
					Spawner    = { x = -457.35, y = 6018.48, z = 30.49 },
					SpawnPoint = { x = -462.22, y = 6020.98, z = 30.34},
					Heading    = 318.17
				},
			},
			VehicleDeleters = {
				{ x = -471.27, y = 6010.99, z = 30.34},
			},

			BossActions = {
				{ x = -447.16, y = 6014.29, z = 35.51},
			},
	}]]

}

Config.Dzwonek = {
    MissionRowPD = {
        Coords = { x = 441.29, y = -981.81, z = 31.99 },
    },
}

Config.ClothesZone = {
	{x = 462.89, y = -996.45, z = 29.69}, --MR
}

Config.Ilosc = {
	{x = 439.36, y = -985.48, z = 30.89},
}

Config.RepairVeh = {
	{x = 426.66, y = -979.40, z =  24.46}, --MR

}
 
Config.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
	{x = 448.65,  y = -981.25, z = 43.69}, --MR

		}
	}
}
Config.BoatZones = {
	PoliceBoatGarage = {
		Pos = {
			{x = 1538.69,  y = 3901.5, z = 30.35},
			{x = 2000.42,  y = 4500, z = 33.437}
		}
	}
}

Config.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 436.76,  y = -994.22, z = 25.7}, --MR
			{x = 445.93,  y = -994.23, z = 25.7}, --MR
		}
	}
}

Config.Helicopters = {
	{ model = 'polmav', label = 'Police Maverick', livery = 2 }
}
Config.Boats = {
	{ model = 'predator', label = 'Police Predator', livery = 0 }
}
Config.VehicleGroups = {
    'Adam', -- 1
    'Offroad', -- 2
    'SEU', -- 3
    'Unmarked', -- 4
    'Motory', -- 5
    'SWAT', -- 6
    'Eagle', -- 7
	'licencje'
}

Config.AuthorizedVehicles = {
	{
		grade = 3,
		model = 'code3f250',
		label = 'Ford F250',
		groups = {2},
		livery = 0,
		extras = {
			[1] = 1, -- bomby na dachu
			[2] = 1, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 1, -- bomby chuj wie gdzie
			[11] = 1 -- bomby przy rejestracji
		}
	},
	{
		grade = 3,
		model = 'code316fpiu',
		label = 'Ford Explorer 2016 ',
		groups = {2},
		livery = 0,
		extras = {
			[1] = 1, -- bomby na dachu
			[2] = 1, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 0, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0 -- bomby przy rejestracji
		}
	},
	{
		grade = 2,
		model = 'code318tahoe',
		label = 'Chevrolet Tahoe 2018',
		groups = {2},
		livery = 0,
		extras = {
			[1] = 1, -- bomby na dachu
			[2] = 1, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 1, -- bomby chuj wie gdzie
			[11] = 1, -- bomby przy rejestracji
			[12] = 1 -- coś XD
		}
	},
	{
		grade = 4,
		model = 'code319silv',
		label = 'Chevrolet Silverado 2019',
		groups = {2},
		livery = 0,
		--extras = {
		--	[1] = 1, -- bomby na dachu
		--	[2] = 1, -- bomby na podszybiu
		--	[3] = 1, -- bumper
		--	[4] = 1, -- bomby w progach
		--	[5] = 1, -- radary w środku
		--	[6] = 1, -- wkładka na fotel pasażera
		--	[7] = 1, -- bomba na lusterku
		--	[8] = 1, -- bomba na lusterku
		--	[9] = 1, -- radary na klapie
		--	[10] = 1, -- bomby chuj wie gdzie
		--	[11] = 1, -- bomby przy rejestracji
		--	[12] = 1 -- coś XD
		--}
	},
	{
		grade = 6,
		model = 'code320exp',
		label = 'Ford Explorer 2020',
		groups = {2},
		livery = 0,
		--extras = {
		--	[1] = 1, -- bomby na dachu
		--	[2] = 1, -- bomby na podszybiu
		--	[3] = 1, -- bumper
		--	[4] = 1, -- bomby w progach
		--	[5] = 1, -- radary w środku
		--	[6] = 1, -- wkładka na fotel pasażera
		--	[7] = 1, -- bomba na lusterku
		--	[8] = 1, -- bomba na lusterku
		--	[9] = 1, -- radary na klapie
		--	[10] = 1, -- bomby chuj wie gdzie
		--	[11] = 1, -- bomby przy rejestracji
		--	[12] = 1 -- coś XD
		--}
	},
	{
		grade = 7,
		model = '20f350c',
		label = 'Ford F350',
		groups = {2},
		livery = 0,
		extras = {
			[1] = 1, -- bomby na dachu
			[2] = 1, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 1, -- bomby chuj wie gdzie
			[11] = 1, -- bomby przy rejestracji
			[12] = 1 -- coś XD
		}
	},
	{
		grade = 4,
		model = 'legacyf150',
		label = 'Ford F150',
		groups = {2},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 5,
		model = 'legacyram',
		label = 'Dodge RAM 2500',
		groups = {2},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 5,
		model = 'legacytahoe',
		label = 'Chevrolet Tahoe 2020',
		groups = {2},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
		{
		grade = 0,
		model = 'legacycvpi',
		label = 'Ford Crown Victoria',
		groups = {1},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
		{
		grade = 1,
		model = 'legacycharg',
		label = 'Dodge Charger 2018',
		groups = {1},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
		{
		grade = 3,
		model = 'legacycharg2',
		label = 'Dodge Charger 2014',
		groups = {1},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
		{
		grade = 4,
		model = 'legacycap',
		label = 'Chevrolet Caprice',
		groups = {1},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
		{
		grade = 2,
		model = 'code3fpis',
		label = 'Ford PIS',
		groups = {1},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 7,
		model = 'camaro',
		label = 'Chevrolet Camaro',
		groups = {3},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 3,
		model = 'code3mustang',
		label = 'Ford Mustang',
		groups = {3},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 4,
		model = 'pd_snake',
		label = 'Ford Mustang Shelby',
		groups = {3},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 5,
		model = 'challenger18',
		label = 'Dodge Challenger',
		groups = {3},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 10,
		model = 'vipergts',
		label = 'Dodge Viper',
		groups = {3},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 8,
		model = 'pd_supra',
		label = 'Toyota Supra',
		groups = {3},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
		{
		grade = 4,
		model = 'pitbull',
		label = 'Pitbull',
		groups = {6},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 4,
		model = 'bearcat',
		label = 'Bearcat',
		groups = {6},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 2,
		model = 'bmwbike',
		label = 'Motorcycle BMW',
		groups = {5},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 4,
		model = 'code3bmw',
		label = 'Motorcycle BMW B',
		groups = {5},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 10,
		model = 'code3harley',
		label = 'Harley',
		groups = {5},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 7,
		model = 'kawasaki',
		label = 'Kawasaki',
		groups = {5},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 3,
		model = 'code3gator',
		label = 'Gator',
		groups = {5},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 1,
		model = 'pdbike',
		label = 'Rower',
		groups = {5},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_c8',
		label = 'Chevrolet Corvette c8',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_911',
		label = 'Porsche 911',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_dem',
		label = 'Dodge Challenger Demon',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_hell',
		label = 'Dodge Charger Hellcat',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_jes',
		label = 'Koenigsegg Jesko',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_rs5',
		label = 'Audi RS5 ABT',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_svr',
		label = 'Jaguar SVR',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_esc',
		label = 'Cadillac Escalade',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
	{
		grade = 13,
		model = 'nm_wagon',
		label = 'Mercedes-Benz G-CLASS',
		groups = {4},
		livery = 0,
		extras = {
			[1] = 0, -- bomby na dachu
			[2] = 0, -- bomby na podszybiu
			[3] = 1, -- bumper
			[4] = 1, -- bomby w progach
			[5] = 1, -- radary w środku
			[6] = 1, -- wkładka na fotel pasażera
			[7] = 1, -- bomba na lusterku
			[8] = 1, -- bomba na lusterku
			[9] = 1, -- radary na klapie
			[10] = 0, -- bomby chuj wie gdzie
			[11] = 0, -- bomby przy rejestracji
			[12] = 0 -- coś XD
		}
	},
}

Config.Uniforms = {
	-- PODSTAWOWE STROJE 
	kadet = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 310,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 35,
			['pants_1'] = 129,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 38,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 91,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 322,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	oficershort = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 309,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 59,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	oficerlong = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 310,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 59,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	sierzantshort = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 309,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 57,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	sierzantlong = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 310,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 57,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	sierzantboj = {
		male = {
		   ['tshirt_1'] = 144,  ['tshirt_2'] = 0,
		   ['torso_1'] = 319,   ['torso_2'] = 0,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 30,
		   ['pants_1'] = 31,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 135,      ['helmet_2'] = 1,
		   ['chain_1'] = 144,    ['chain_2'] = 0,
		   ['bproof_1'] = 57,     ['bproof_2'] = 0,
		   ['mask_1'] = 141,      ['mask_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0,
		   ['bags_1'] = 0,     ['bags_2'] = 0
	   },
	   female = {
		   ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
		   ['torso_1'] = 328,   ['torso_2'] = 0,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 44,
		   ['pants_1'] = 30,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 134,  ['helmet_2'] = 1,
		   ['bproof_1'] = 0,     ['bproof_2'] = 0,
		   ['mask_1'] = 121,      ['mask_2'] = 0,
		   ['chain_1'] = 0,    ['chain_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0
	   }
   },
	porucznikshort = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 309,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 59,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	poruczniklong = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 310,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 59,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	porucznikboj = {    
		male = {
		   ['tshirt_1'] = 144,  ['tshirt_2'] = 0,
		   ['torso_1'] = 319,   ['torso_2'] = 1,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 30,
		   ['pants_1'] = 31,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 135,      ['helmet_2'] = 1,
		   ['chain_1'] = 144,    ['chain_2'] = 0,
		   ['bproof_1'] = 57,     ['bproof_2'] = 0,
		   ['mask_1'] = 141,      ['mask_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0,
		   ['bags_1'] = 0,     ['bags_2'] = 0
	   },
	   female = {
		   ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
		   ['torso_1'] = 328,   ['torso_2'] = 1,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 44,
		   ['pants_1'] = 30,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 134,  ['helmet_2'] = 1,
		   ['bproof_1'] = 0,     ['bproof_2'] = 0,
		   ['mask_1'] = 121,      ['mask_2'] = 0,
		   ['chain_1'] = 0,    ['chain_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0
	   }
   },
	kapitanshort = {
		male = {
			['tshirt_1'] = 149,  ['tshirt_2'] = 0,
			['torso_1'] = 319,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 0,   ['bproof_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 141,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	kapitanlong = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 310,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 57,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	kapitanboj = {
		male = {
		   ['tshirt_1'] = 144,  ['tshirt_2'] = 0,
		   ['torso_1'] = 293,   ['torso_2'] = 1,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 31,
		   ['pants_1'] = 31,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 135,      ['helmet_2'] = 1,
		   ['chain_1'] = 144,    ['chain_2'] = 0,
		   ['bproof_1'] = 57,     ['bproof_2'] = 0,
		   ['mask_1'] = 141,      ['mask_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0,
		   ['bags_1'] = 0,     ['bags_2'] = 0
	   },
	   female = {
		   ['tshirt_1'] = 152,  ['tshirt_2'] = 0,
		   ['torso_1'] = 328,   ['torso_2'] = 1,
		   ['decals_1'] = 0,   ['decals_2'] = 0,
		   ['arms'] = 44,
		   ['pants_1'] = 30,   ['pants_2'] = 0,
		   ['shoes_1'] = 25,   ['shoes_2'] = 0,
		   ['helmet_1'] = 134,  ['helmet_2'] = 1,
		   ['bproof_1'] = 0,     ['bproof_2'] = 0,
		   ['mask_1'] = 121,      ['mask_2'] = 0,
		   ['chain_1'] = 0,    ['chain_2'] = 0,
		   ['ears_1'] = -1,     ['ears_2'] = 0
	   }
   },
	commandershort = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 309,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 58,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	commanderlong = {
		male = {
			['tshirt_1'] = 150,  ['tshirt_2'] = 0,
			['torso_1'] = 310,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 129,   ['pants_2'] = 1,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,      ['helmet_2'] = 0,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 58,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 82,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 328,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 134,  ['helmet_2'] = 1,
			['bproof_1'] = 0,     ['bproof_2'] = 0,
			['mask_1'] = 121,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	galowy = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 310,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 132,   ['pants_2'] = 5,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 113,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 0,   ['bproof_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	motocykl = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 294,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 131,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 0,   ['bproof_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	aiad = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 294,   ['torso_2'] = 1,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 131,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['bproof_1'] = 0,   ['bproof_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0, 	['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['mask_1'] = 0,  	['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	swatalways = {
		male = {
			['tshirt_1'] = 144,  ['tshirt_2'] = 0,
			['torso_1'] = 319,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 30,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 144,      ['helmet_2'] = 6,
			['chain_1'] = 144,    ['chain_2'] = 0,
			['bproof_1'] = 60,     ['bproof_2'] = 0,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['bproof_1'] = 40,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	swatlight = {
		male = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 293,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 131,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 144,      ['helmet_2'] = 6,
			['chain_1'] = 143,    ['chain_2'] = 0,
			['bproof_1'] = 49,     ['bproof_2'] = 2,
			['mask_1'] = 141,      ['mask_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['bproof_1'] = 40,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	swatheavy = {
		male = {
			['tshirt_1'] = 153,  ['tshirt_2'] = 0,
			['torso_1'] = 322,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 131,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 117,      ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['bproof_1'] = 44,     ['bproof_2'] = 2,
			['mask_1'] = 124,      ['mask_2'] = 25,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 0,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 324,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 130,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 0,  ['helmet_2'] = 0,
			['bproof_1'] = 40,     ['bproof_2'] = 0,
			['mask_1'] = 0,      ['mask_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	-- KAMIZELKI
	kadet2 = {
		male = {
			['bproof_1'] = 10, ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 10, ['bproof_2'] = 4
		}
	},
	oficer2 = {
		male = {
			['bproof_1'] = 17, ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 17, ['bproof_2'] = 0
		}
	},
	sierzant2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		}
	},
	porucznik2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 1
		}
	},
	kapitan2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	},	
	aiad2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	},	
	swat2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	},	
	swm2 = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 7,  ['bproof_2'] = 4
		}
	}
}