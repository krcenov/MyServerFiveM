incircle = false
local x, y, z = -220.33,-1166.66,23
RegisterNUICallback('obey9fcoupebuy', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideShop")
	TriggerEvent('chat:addMessage', {args = {'Bought a OBEY 9F Coupe'}})
end)
RegisterNUICallback('NUIFocusOff', function()
    SetNuiFocus(false, false)
	TriggerEvent("HideShop")
end)
RegisterNetEvent('ShowShop')
AddEventHandler("ShowShop", function(playersstr)
    SendNUIMessage({
      type = "shop",
      display = true
    })
end)
RegisterNetEvent('HideShop')
AddEventHandler("HideShop", function()
    SendNUIMessage({
      type = "shop",
      hide = true
    })
end)
function DrawText3D(x,y,z, text, scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
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
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		DrawMarker(1, x, y, z-1.0, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.5001, 168, 104, 40, 255, 0, 0, 0, 0)
		if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) < 10.0)then
			DrawText3D(x,y,z+0.25, "~r~Click E to interract with car shop!", 1.5)
			if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) < 1.0)then
				incircle = true
			elseif(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) > 1.0)then
				incircle = false
			end
		end
		if IsControlJustReleased(0, 38) then
			if (incircle) then
				TriggerEvent("ShowShop")
				TriggerEvent('chat:addMessage', {args = {'Opening Shop Menu!'}})
				SetNuiFocus(true, true)
			end
		end
	end
end)