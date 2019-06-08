tabletdisplayed = false
stringarr = ""
maxPlayers = 32

RegisterNetEvent('ShowTablet')
AddEventHandler("ShowTablet", function(playersstr)
    SendNUIMessage({
      type = "tabletui",
      display = true,
	  playerliststring = playersstr
    })
end)
RegisterNetEvent('HideTablet')
AddEventHandler("HideTablet", function()
    SendNUIMessage({
      type = "tabletui",
      hide = true
    })
end)
RegisterNetEvent('SendPlayerList')
AddEventHandler("SendPlayerList", function(playersstr)
    SendNUIMessage({
	  type = nil,
      display = nil,
	  playerliststring = playersstr
    })
end)

function getPlayers()
    local players = {}
    for i=0,maxPlayers-1 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustReleased(0, 166) then
				local onlinePlayers = getPlayers()
				for _, i in ipairs(onlinePlayers) do
				local pnames = GetPlayerName(i)
					stringarr = stringarr .. pnames .. ","
				end
				TriggerEvent("ShowTablet",stringarr)
				SetNuiFocus(true, true)
		end
	end
end)

RegisterNUICallback('NUIFocusOff', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideTablet")
end)
RegisterNUICallback('SendPlayerList', function()
	stringarr = "Secondtime,"
	local onlinePlayers = getPlayers()
		for _, i in ipairs(onlinePlayers) do
		local pnames = GetPlayerName(i)
			stringarr = stringarr .. pnames .. ","
		end
		
	TriggerEvent("SendPlayerList",stringarr)
end)