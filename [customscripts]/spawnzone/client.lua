function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

local table
local lastvalid
local ready = false
local peacetime = 0
local priority = false
local canbeclicked = true
local defaultskins = Set { "-1404353274" }
incircle = false
local x, y, z = -75.22,-819.04,326 --Dome Location

--Spawn Locations
local Spawn1Coords = vector3(-840, -149, 20)
local Spawn1Name = "Portola Drive Metro Station"
local Spawn1Heading = 32.00

local Spawn2Coords = vector3(-1354, -467, 15)
local Spawn2Name = "Del Perro Metro Station"
local Spawn2Heading = 117.00

local Spawn3Coords = vector3(-1078, -2714, -7.41)
local Spawn3Name = "LSIA Terminal 4 Metro Station"
local Spawn3Heading = 232.00

local Spawn4Coords = vector3(-495, -676, 12)
local Spawn4Name = "Little Seoul Metro Station"
local Spawn4Heading = 185.00

local Spawn5Coords = vector3(-291, -327, 10)
local Spawn5Name = "Burton Metro Station"
local Spawn5Heading = 278.00

local Spawn6Coords = vector3(-876, -2308, -12)
local Spawn6Name = "LSIA Parking Metro Station"
local Spawn6Heading = 249.00

local Spawn7Coords = vector3(-213, -1030, 30)
local Spawn7Name = "Pillbox South Metro Station"
local Spawn7Heading = 65.00

local Spawn8Coords = vector3(287, -1206, 39)
local Spawn8Name = "Strawberry Metro Station"
local Spawn8Heading = 173.00

local Spawn9Coords = vector3(111, -1723, 30)
local Spawn9Name = "Davis Metro Station"
local Spawn9Heading = 137.00

--End Spawn Locations

-- Debug Gang
RegisterNUICallback('Spawn1', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn1Coords)
	SetEntityHeading(PlayerPedId(), Spawn1Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn1Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn2', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn2Coords)
	SetEntityHeading(PlayerPedId(), Spawn2Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn2Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn3', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn3Coords)
	SetEntityHeading(PlayerPedId(), Spawn3Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn3Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn4', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn4Coords)
	SetEntityHeading(PlayerPedId(), Spawn4Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn4Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn5', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn5Coords)
	SetEntityHeading(PlayerPedId(), Spawn5Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn5Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn6', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn6Coords)
	SetEntityHeading(PlayerPedId(), Spawn6Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn6Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn7', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn7Coords)
	SetEntityHeading(PlayerPedId(), Spawn7Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn7Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn8', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn8Coords)
	SetEntityHeading(PlayerPedId(), Spawn8Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn8Name ..'.'}})--LOL
end)

RegisterNUICallback('Spawn9', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
	DoScreenFadeOut(4000)
	Citizen.Wait(4000)
	SetEntityCoords(PlayerPedId(), Spawn9Coords)
	SetEntityHeading(PlayerPedId(), Spawn9Heading)
	DoScreenFadeIn(4000)
	TriggerEvent('chat:addMessage', {args = {'You have just arrived to '.. Spawn9Name ..'.'}})--LOL
end)

RegisterNUICallback('NUIFocusOff', function()
	canbeclicked = true
    SetNuiFocus(false, false)
	TriggerEvent("HideSpawnMenu")
end)

RegisterNetEvent('ShowSpawnMenu')
AddEventHandler("ShowSpawnMenu", function(playersstr)
    SendNUIMessage({
      type = "shop",
      display = true,
	  Spawn1Name = Spawn1Name,
	  Spawn2Name = Spawn2Name,
	  Spawn3Name = Spawn3Name,
	  Spawn4Name = Spawn4Name,
	  Spawn5Name = Spawn5Name,
	  Spawn6Name = Spawn6Name,
	  Spawn7Name = Spawn7Name,
	  Spawn8Name = Spawn8Name,
	  Spawn9Name = Spawn9Name
    })
end)

RegisterNetEvent('HideSpawnMenu')
AddEventHandler("HideSpawnMenu", function()
    SendNUIMessage({
      type = "shop",
      hide = true
    })
end)

function DrawText3D(x,y,z, text, scl) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	vec = GetGameplayCamCoords()
    local px,py,pz= vec.x,vec.y,vec.z
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(7)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if (ready) then
			local pos = GetEntityCoords(GetPlayerPed(-1), true)
			DrawMarker(1, x+(table.radius/2), y, z-1.0, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.5001, 168, 104, 40, 255, 0, 0, 0, 0)
			if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x+(table.radius/2), y, z) < 15.0)then
				DrawText3D(x+(table.radius/2),y,z+0.25, "~r~Press E to select spawn!", 1.5)
				if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x+(table.radius/2), y, z) < 1.0)then
					incircle = true
				elseif(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x+(table.radius/2), y, z) > 1.0)then
					incircle = false
				end
			end
			if IsControlJustReleased(0, 38) then
				if (incircle) then
					local name = GetPlayerName(PlayerId())
					local ped = GetPlayerPed(PlayerId())
					local model = GetEntityModel(ped) .. ""
					if (not defaultskins[model] and canbeclicked == true) then
						canbeclicked = false
						TriggerEvent("ShowSpawnMenu")
						SetNuiFocus(true, true)
					elseif (canbeclicked == false) then
					else
						TriggerEvent('chat:addMessage', {args = {'You are still in the default skin!'}})
					end
				end
			end
		end
	end
end)

function DrawTxt(text, x, y, scale, opacity)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, opacity)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(config.aopdisplay.x / x, config.aopdisplay.y / y)
end

function InitializeAOP(zone, isready)
	local playerPed = GetPlayerPed(-1)
	table = zone
	lastvalid = zone.location
	if (isready) then
		if (IsPedInAnyVehicle(playerPed, true)) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
			SetEntityAsMissionEntity(vehicle, false, false)
			DeleteEntity(vehicle)
		end
		SetEntityCoords(playerPed, table.location.x, table.location.y, table.location.z, 0, 0, 0, false)
		ready = true
	end
end

Citizen.CreateThread(function()
	while true do
		if (ready) then
			local playerPed = GetPlayerPed(-1)
			local plyCoords = GetEntityCoords(playerPed, false)
			local x = (plyCoords.x - table.location.x)^2 
			local y = (plyCoords.y - table.location.y)^2 
			local z = (plyCoords.z - table.location.z)^2
			local b = x + y + z
			local location = vector3(table.location.x, table.location.y, table.location.z)
			if #(plyCoords - location) < (table.radius)then
				if #(plyCoords - location) < (table.radius)- 1.5 then
					lastvalid = plyCoords
				end
			elseif #(plyCoords - location) - (table.radius) < 10 then
				local vehicle
				if (IsPedInAnyVehicle(playerPed, true)) then
					vehicle = GetVehiclePedIsIn(playerPed, false)
				end
				local validnotfound = true
				local index = 0
				if (vehicle) then
					SetEntityCoordsNoOffset(vehicle, lastvalid.x + index, lastvalid.y + index, lastvalid.z, 0, 0, 1)
				else 
					SetEntityCoords(playerPed, lastvalid.x + index, lastvalid.y + index, lastvalid.z, 0, 0, 0, false)
				end
			else
			
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		if (ready) then
			local playerPed = GetPlayerPed(-1)
			local plyCoords = GetEntityCoords(playerPed, false)
			local location = vector3(table.location.x, table.location.y, table.location.z)
			if (#(plyCoords - location) > (table.radius) - (table.radius / 150) - table.visabilitydistance) then
				DrawMarker(28, table.location.x, table.location.y, table.location.z, 0, 0, 0, 0, 0, 0, table.radius + 0.0, table.radius + 0.0, table.radius + 0.0, table.color.r, table.color.g, table.color.b, table.color.a, 0, 0, 0, 0)
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	TriggerServerEvent("Start:SERVER")
	return
end)

RegisterNetEvent("INITIALISEAZONE")
AddEventHandler("INITIALISEAZONE", function(zone, a)
	InitializeAOP(zone, a)
end)

RegisterNetEvent("SETCLIENTSTATUS")
AddEventHandler("SETCLIENTSTATUS", function(status)
	ready = status
end)