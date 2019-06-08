-- Simple 911 Command (With Location & Blip) -- 
		-- Made By Chezza --

displayLocation = true  -- By Changing this to 'false' it will make it so your location is not displayed in chat --
blips = true -- By Changing this to 'false' it will disable 911 call blips meaning your location will not be shown on the map --
disableChatCalls = false -- By Chaning this to 'false' it will make it so 911 call are displayed in chat (Recommended to have Discord Webhook setup if enabling this) --
webhookurl = 'Insert Webhook URL Here' -- Add your discord webhook url here, if you do not want this leave it blank (More info on FiveM post) --

-- Code --

RegisterServerEvent('911')
AddEventHandler('911', function(location, msg, x, y, z, name)

	local playername = GetPlayerName(source)
		if displayLocation == false then
			if disableChatCalls == false then
				TriggerClientEvent('chatMessageforplayers', -1, playername, location, msg)
				sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Report: **' .. msg)  
			else
				sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Report: **' .. msg)  
			end
		else
			if disableChatCalls == false then
				TriggerClientEvent('chatMessageforplayers', -1, playername, location, msg, model)
				sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Location: **' .. location .. '** | Report: **' .. msg)
			else
				sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Location: **' .. location .. '** | Report: **' .. msg)
			end
			if blips == true then
				TriggerClientEvent('911:setBlip', -1, name, x, y, z)
			end
		end
end)

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

	