fx_version 'adamant'

game 'gta5'
description 'ESX lean'
version '1.10.5'
lua54 'yes'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended'
}
