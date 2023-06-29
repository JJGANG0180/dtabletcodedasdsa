local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterNetEvent('d_tablet:CheckJob')
AddEventHandler('d_tablet:CheckJob', function()
        print("Server CheckJob called")
        for job = 1, #Config.jobs do
            if Config.framework == "vrp" then
                print("Server framework er vrp")
                print(vRP.getUserId({source}))
                print(Config.jobs[job])
                if not vRP.hasGroup({vRP.getUserId({source}), Config.jobs[job]}) then
                    print("Server OpenTablet triggered fordi han har ranken")
                    TriggerClientEvent("d_tablet:OpenTablet", source)
                else 
                    print("Server OpenTablet ikke triggered fordi ik han har ranken")
                    return false
                end 
            elseif string.lower(Config.framework) == "esx" then
                if ESX.GetPlayerFromId(source).getJob().name == Config.jobs[job] then 
                    print("Server OpenTablet triggered fordi han har ranken")
                    TriggerClientEvent("d_tablet:OpenTablet", source)
                else
                    print("Server OpenTablet ikke triggered fordi ik han har ranken")
                    return false
                end
            elseif string.lower(Config.framework) == "qbcore" then
                if QBCore.Functions.GetPlayerData().job.name == Config.jobs[job] then
                    print("Server OpenTablet triggered fordi han har ranken")
                    TriggerClientEvent("d_tablet:OpenTablet", source)
                else
                    print("Server OpenTablet ikke triggered fordi ik han har ranken")
                    return false
                end
            else
                print("Server Framework ukendt")
                return false
            end
        end
end)