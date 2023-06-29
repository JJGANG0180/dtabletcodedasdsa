local open = false



RegisterKeyMapping("+tablet", "Tilgå politi-database", 'keyboard', Config.hotkey)
RegisterCommand(Config.command, function()
    print("Client register command called")
    TriggerServerEvent("d_tablet:CheckJob")
end, false)




function OpenUI()
    print("Client openUi function called")

    ExecuteCommand("e tablet2")

    SendNUIMessage({
        action = "open"
    })

    SetNuiFocus(true, true)
    open = true
end






RegisterNUICallback('escape', function(data, cb)
    ExecuteCommand('e stop')

    SetNuiFocus(false, false)
    open = false
    SendNUIMessage({
        action = "close"
    })
    cb('ok')
end)


RegisterNetEvent('d_tablet:OpenTablet')
AddEventHandler('d_tablet:OpenTablet', function()
    print("Client OpenUI triggervent claled")
    OpenUI()
end)