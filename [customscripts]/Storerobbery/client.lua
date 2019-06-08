RegisterNetEvent('ShowTimerRobbery')
AddEventHandler("ShowTimerRobbery", function(message)
TriggerServerEvent("SyncAd", "store", "The 24/7 at Sandy Shores is getting robbed!")
    SendNUIMessage({
      type = "robui",
      display = true,
      newText = message
    })
end)
RegisterNetEvent('HideTimerRobbery')
AddEventHandler("HideTimerRobbery", function()
    SendNUIMessage({
      type = "robui",
      display = false
    })
end)

--[[AD CONSTRUCTOR]]
function ad(_id, _pic1, _pic2, _sender, _subject, _hidden)
	if _hidden == nil then _hidden = false end
	if _subject == nil then _subject = 'Advertisement' end

	return {
		id = _id,
		pic1 = _pic1,
		pic2 = _pic2,
		sender = _sender,
		subject = _subject,
		hidden = _hidden
	}
end

--[[TABLE OF ADS]]
local ads = {
--  ad ('What you'll type in chat', 'CHAR_FLOYD', 'ImageName', 'Ad Title', 'Ad Subtitle'),
	ad('bank', 'CHAR_BANK_FLEECA', 'CHAR_BANK_FLEECA', 'Fleeca Bank'),
	ad('traffic', 'CHAR_FLOYD', 'WAZE', 'Waze Advisory', 'Notification'),
	ad('dealership', 'CHAR_CARSITE', 'CHAR_CARSITE', 'Legendary Motors'),
	ad('lsc', 'CHAR_LS_CUSTOMS', 'CHAR_LS_CUSTOMS', 'LS Customs'),
	ad('ammunation', 'CHAR_AMMUNATION', 'CHAR_AMMUNATION', 'Ammunation'),
	ad('taxi', 'CHAR_FLOYD', 'CAB', 'Taxi'),
	ad('uber', 'CHAR_FLOYD', 'UBER', 'Uber', 'Phone Notification'),
	ad('chp', 'CHAR_FLOYD', 'CHP', 'CHP Advisory', 'Phone Alert'),
	ad('store', 'CHAR_FLOYD', '247', '24/7 Shop'),
	ad('onlyadmin', 'CHAR_FLOYD', 'ADMIN', 'Administration', nil, true)
}
local function findAdById(id)
	local output 
	for _, item in ipairs(ads) do 
		if item.id == id then output = item end 
	end 
	return output
end

--[[EVENT TO SHOW ALL ADS]]
RegisterNetEvent('ShowAds')
AddEventHandler('ShowAds', function()
	local index = 0
	local outstring = '^7'
	for _, item in ipairs(ads) do
		if item.hidden ~= true then
			index = index + 1
			if index == 1 then outstring = outstring..item.id else outstring = outstring..' / '..item.id end
		end
	end
	TriggerEvent('chatMessage', 'SYSTEM', {0,0,0}, 'Available ads: <'..outstring..'>')
end)

--[[EVENT TO DISPLAY AN AD TO THE PLAYER]]
RegisterNetEvent('DisplayAd')
AddEventHandler('DisplayAd',function(adtype, inputText)
	local ad = findAdById(adtype)

	if ad == nil then
		TriggerEvent('chatMessage', 'SYSTEM', {0,0,0}, 'Invalid type of ad')
		TriggerEvent('ShowAds')
		return
	end

	SetNotificationTextEntry('STRING');
	AddTextComponentString(inputText);
	SetNotificationMessage(ad.pic1, ad.pic2, true, 4, ad.sender, ad.subject);
	DrawNotification(false, true);
end)

incircle = false
local x, y, z = 1961.59,3749.02,32.34

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
		if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) < 6.0)then
			DrawText3D(x,y,z+0.25, "~r~Type /robstore to start robbing this store!", 1.5)
			DrawMarker(1, x, y, z-1.0, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.5001, 168, 104, 40, 255, 0, 0, 0, 0)
			if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) < 1.0)then
				incircle = true
			elseif(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, x, y, z) > 1.0)then
				incircle = false
			end
		elseif ( timershowed == true ) then
		TriggerEvent("HideTimerRobbery")
		timershowed = false
		end
	end
end)

RegisterCommand('robstore', function(source, args)
        if ( incircle == true ) then
			local weaponStealeableList = 
			{
				2578778090
				,1737195953
				,1317494643
				,2508868239
				,1141786504
				,2227010557
				,453432689
				,1593441988
				,584646201
				,2578377531
				,324215364
				,736523883
				,4024951519
				,3220176749
				,2210333304
				,2937143193
				,2634544996
				,2144741730
				,487013001
				,2017895192
				,3800352039
				,2640438543
				,911657153
				,100416529
				,205991906
				,856002082
				,2726580491
				,2982836145
				,1752584910
				,1119849093
				,2481070269
				,741814745
				,615608432
				,3218215474
				,4192643659
				,1627465347
				,3231910285
				,3523564046
				,2132975508
				,2460120199
				,137902532
				,2828843422
				,984333226
				,3342088282
				,1672152130
				,2874559379
				,171789620
				,3696079510
				,3638508604
				,4191993645
				,1834241177
				,3713923289
				,3675956304
				,738733437
				,3756226112
				,3249783761
				,4019527611
				,1649403952
				,317205821
				,3441901897
				,125959754
				,3173288789
				,3125143736
				,2484171525
				,419712736
			}
			haveWeapon = false
			for i=1, #weaponStealeableList do
				if GetCurrentPedWeapon(GetPlayerPed(-1), weaponStealeableList[i], false) then
				   haveWeapon = true
				end
			end
			if haveWeapon == true then
				 TriggerEvent('chat:addMessage', {
					args = { 'You are robbing this store!' }
				})
				TriggerEvent("ShowTimerRobbery","Robbing store!")
				timershowed = true
			elseif ( haveWeapon == false ) then
			TriggerEvent('chat:addMessage', {
					args = { 'Can not rob store, no weapon in hand!' }
				})
			end
        elseif ( incircle == false ) then
           TriggerEvent('chat:addMessage', {
            args = { 'Cant rob store, not in the correct location!' }
        })
    	  end
end)