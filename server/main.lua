


  

ESX.RegisterUsableItem('lean', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('lean', 1)
	TriggerClientEvent('lean_anim', source)
	Wait(5000)
	TriggerClientEvent('lean_drink', source)
end)

ESX.RegisterUsableItem('cup', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local checksyrup = xPlayer.getInventoryItem('cough_syrup').count >= 1

	if checksyrup then 
	xPlayer.removeInventoryItem('cough_syrup', 1)
	xPlayer.removeInventoryItem('cup', 1)
	xPlayer.showNotification('U made ~g~Lean~s~.')
	xPlayer.addInventoryItem('lean', 1)
else
	TriggerClientEvent('esx:showNotification', _source, '~r~U dont have Cough Syrup')
	end
end)




ESX.RegisterUsableItem('narcan', function(source)
	TriggerClientEvent('lean_sober', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('narcan', 1)
end)





ESX.RegisterUsableItem('cough_syrup', function(source)
	TriggerClientEvent('coughsyrup', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('coughsyrup', 1)
end)








