-- Simple 911 Command (With Location & Blip) -- 
  -- Made By Chezza and modified by krcenov --
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

--Cop01SFY,		Cop01SMY,		CopCutscene,	FIBSec01,		FIBSec01SMM,	KarenDanielsCutscene,	Michelle,		MichelleCutscene,	Sheriff01SFY,	Sheriff01SMY,	SWAT01SMY
--368603149,	1581098148,		-1699520669,	1558115333,		2072724299,		1269774364		,		-1080659212,	1890499016     ,	1096929346, 	-1320879687,	-1920001264

local copskins = Set { "368603149", "1581098148", "-1699520669", "1558115333", "2072724299", "1269774364", "-1080659212", "1890499016s", "1096929346", "-1320879687", "-1920001264s" }
displayTime = 300 -- Refreshes Blips every 5 Minutes by Default --  

-- Code --

blip = nil
blips = {}


Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/911', 'Submits a 911 call to the Emergency Services!', {
    { name="Report", help="Enter the incident/report here!" }
})
end)

RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, x, y, z)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
	local model = GetEntityModel(ped) .. ""
	if copskins[model] then
		blip = AddBlipForCoord(x, y, z)
		SetBlipSprite(blip, 66)
		SetBlipScale(blip, 1.0)
		SetBlipColour(blip, 3)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('911 Call - ' .. name)
		EndTextCommandSetBlipName(blip)
		table.insert(blips, blip)
		Wait(displayTime * 1000)
		for i, blip in pairs(blips) do 
			RemoveBlip(blip)
		end
	end
end)
RegisterNetEvent('chatMessageforplayers')
AddEventHandler('chatMessageforplayers', function(playername, location, msg)
    local ped = GetPlayerPed(PlayerId())
	local model = GetEntityModel(ped) .. ""
	if copskins[model] then
		TriggerEvent('chatMessage', '', {255,255,255}, '^*^4911 | Caller ID: ^r' .. playername .. '^*^4 | Location: ^r' .. location .. '^*^4 | Report: ^r' .. msg)
	end
end)

-- Command -- 

RegisterCommand('911', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
	local model = GetEntityModel(ped)
	local modelstr = model .. ""
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Please enter your ^1report/issue.')
    else
		TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Call sent.')
        TriggerServerEvent('911', location, msg, x, y, z, name)
    end
end)

