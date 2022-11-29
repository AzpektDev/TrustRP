resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

fx_version 'bodacious'
game 'gta5'
author 'elfeedoo#6093'
description 'arivi_hospital'
version '1.0.0'

this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods_1.xml'
data_file 'TIMECYCLEMOD_FILE' 'gusepe_timecycle_mods_1.xml'
data_file 'TIMECYCLEMOD_FILE' 'timecycle_mods_1.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/hospitaloskacenter/props.ytyp'

files {
  'gabz_timecycle_mods_1.xml',
  'gusepe_timecycle_mods_1.xml',
  'timecycle_mods_1.xml',
  'interiorproxies.meta'
}

client_script {
  'main.lua',
  'interiorproxies.meta'
}
client_script "api-ac_CJOUjcftOzFS.lua"
client_script "api-ac_PhLtMfCLHUqN.lua"
client_script "api-ac_xagvSDFblUVF.lua"
client_script "api-ac_cwbvUaxTboKa.lua"