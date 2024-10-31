--[[ ===================================================== ]]--
--[[            MH Trow Props Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

fx_version 'cerulean'
game 'gta5'

author "MaDHouSe"
description 'MH Trow Props'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua',
}

client_scripts {
	'client/main.lua',
}

server_scripts {
	"server/main.lua",
	"server/update.lua"
}
