ESX = nil
pdCount = 0
lsmsCount = 0
taxiCount = 0
mecCount = 0
Firstname = "Belirsiz"
Lastname = "Belirsiz"
-- firstOriginal = "Belirsiz"
-- lastOriginal = "Belirsiz"
handcuffed = false
dead = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10) -- Give some time to ESX to load. Ruqen#9999 made this btw.
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

function isPed(checkType)
    local checkType = string.lower(checkType)
    local pass = false

    if checkType == "cid" then
        ESX.TriggerServerCallback("isPed:getIdentifier", function(cid)
            pass = cid
        end)
    end

    if checkType == "myJob" then
        pass = ESX.PlayerData.job
    end

    if checkType == "policecount" then
        pass = pdCount
    end

    if checkType == "emscount" then
        pass = lsmsCount
    end

    if checkType == "taxicount" then
        pass = taxiCount
    end

    if checkType == "meccount" then
        pass = mecCount
    end

    if checkType == "mybank" then
        ESX.TriggerServerCallback("isPed:getBank", function(bankAcc)
            pass = bankAcc
        end)
    end
    
    if checkType == "mycash" then
        ESX.TriggerServerCallback("isPed:getCash", function(cash)
            pass = cash
        end)
    end

    if checkType == "firstname" then
        pass = Firstname
    end

    if checkType == "lastname" then
        pass = Lastname
    end

    if checkType == "fullname" then
        pass = Firstname .. " " .. Lastname
    end

    if checkType == "handcuffed" then
        if handcuffed then
            pass = true
        else
            pass = false
        end
    end

    if checkType == "dead" then
        pass = dead
    end

    if checkType == "available" then
        if not dead and not handcuffed then
            pass = true
        else
            pass = false
        end
    end

    return pass
end

RegisterNetEvent("updateNameClient")
AddEventHandler("updateNameClient", function(firstname, lastname)
    Firstname = firstname
    Lastname = lastname
end)

RegisterNetEvent("updateCuffStatus")
AddEventHandler("updateCuffStatus", function(bool)
    handcuffed = bool
end)

RegisterNetEvent("updateDeathStatus")
AddEventHandler("updateDeathStatus", function(bool)
    dead = bool
end)
