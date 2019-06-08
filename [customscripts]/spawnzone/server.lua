zone = {
            cmd                 = "ss", -- You use this as the argument for the AOP change. (usage: /aop [cmd]) CMD CANNOT BE "list", "start", "stop", "peacetime", or "priority".
            location            = {x = -75.22, y = -819.04, z = 326.18},
            color               = {r = 255, g = 0, b = 0, a = 100}, -- Red (0-255), Blue (0-255), Green (0-255), Transparancy (0-255)
            visabilitydistance  = 100, -- You will see the zone's boundaries when you are this far away from the boundaries.
            radius              = 10 -- The zone's radius.
        }
local currentzone = zone
RegisterNetEvent("Start:SERVER")
AddEventHandler("Start:SERVER", function()
	TriggerClientEvent('SETCLIENTSTATUS', -1, true)
    TriggerClientEvent('INITIALISEAZONE', source, currentzone)
end)