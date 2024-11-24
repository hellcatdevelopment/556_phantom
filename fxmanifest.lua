fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 "yes"

shared_scripts {
    "cfg.lua",
}

client_scripts {
    '@PolyZone/client.lua',
    "c/c.lua",
}

server_scripts {
    "s/s.lua",
}


