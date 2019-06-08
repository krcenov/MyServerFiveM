RegisterNetEvent("tutorial:spawn")
AddEventHandler("tutorial:spawn", function()
    DoScreenFadeOut(1000)
  	-- Here is where you set where you want to player to spawn after they complete the tutorial
    SetEntityCoords(GetPlayerPed(-1), tonumber("-75.00"), tonumber("-819.00"), tonumber("326.00"), 1, 0, 0, 1)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)   
end)





