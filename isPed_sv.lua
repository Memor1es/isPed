ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("isPed:getIdentifier", function(source, cb)
    local src = source
    local ply = ESX.GetPlayerFromId(src)

    if ply then
        local cid = ply.getIdentifier()
        
        cb(cid)
    end
end)

ESX.RegisterServerCallback("isPed:getBank", function(source, cb)
    local src = source
    local ply = ESX.GetPlayerFromId(src)

    if ply then
        local bank = ply.getAccount('bank').money

        cb(bank)
    end
end)

ESX.RegisterServerCallback("isPed:getCash", function()
    local src = source
    local ply = ESX.GetPlayerFromId(src)

    if ply then
        local cash = ply.getMoney()

        cb(cash)
    end
end)