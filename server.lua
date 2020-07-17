RegisterServerEvent('redemrp_clothing:Save')
AddEventHandler('redemrp_clothing:Save', function(clothing, saveOutfit , name, cb)
    local _clothing = clothing
    local _name = name
    local decode = json.decode(clothing)
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")
        local currentMoney = user.getMoney()
        print (currentMoney)
        TriggerEvent("redemrp_clothing:retrieveClothes", identifier, charid, function(call)

                if call then

                    MySQL.Async.execute("UPDATE clothes SET `clothes`='" .. _clothing .. "' WHERE `identifier`=@identifier AND `charid`=@charid", {identifier = identifier, charid = charid}, function(done)
                        end)
                else

                    MySQL.Async.execute('INSERT INTO clothes (`identifier`, `charid`, `clothes`) VALUES (@identifier, @charid, @clothing);',
                        {
                            identifier = identifier,
                            charid = charid,
                            clothing = _clothing
                        }, function(rowsChanged)
                        end)
                end
        end)
        if saveOutfit then
            TriggerEvent("redemrp_clothing:retrieveOutfits", identifier, charid, _name, function(call)

                    if call then

                        MySQL.Async.execute("UPDATE outfits SET `clothes`='" .. _clothing .. "' WHERE `identifier`=@identifier AND `charid`=@charid AND `name`=@name", {identifier = identifier, charid = charid , name = name}, function(done)
                            end)
                    else

                        MySQL.Async.execute('INSERT INTO outfits (`identifier`, `charid`, `clothes`, `name`) VALUES (@identifier, @charid, @clothing , @name);',
                            {
                                identifier = identifier,
                                charid = charid,
                                clothing = _clothing,
                                name = _name
                            }, function(rowsChanged)
                            end)
                    end
            end)
        end


    end)
end)



RegisterServerEvent('redemrp_clothing:loadClothes')
AddEventHandler('redemrp_clothing:loadClothes', function(value)
    local _value = value
    local _source = source
    local skin = nil
    local clothing = nil
    local clothing2 = 0
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")

        MySQL.Async.fetchAll('SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(skins)
            if skins[1]then
                skin = skins[1].skin
            else
                skin = nil
            end

            MySQL.Async.fetchAll('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(clothing)
                if clothing[1] then
                    clothing = clothing[1].clothes
                else
                    local elementy = {
                        ["hat"] = 1,
                        ["shirt"] = 1,
                        ["vest"] = 1,
                        ["pants"] = 1,
                        ["mask"] = 1,
                        ["boots"] =1,
                        ["skirt"] = 1,
                        ["coat"] = 1,
                        ["gloves"] = 1,
                        ["bandana"] = 1,
                        ["gunbelts"] =1,
                        ["belts"] = 1,
                        ["beltbuckle"] = 1,
                        ["offhand"] = 1,
                        ["neckties"] = 1,
                        ["suspenders"] = 1,
                        ["spurs"] = 1,
                        ["poncho"] = 1,
                        ["eyewear"] = 1,



                    }
                    local json = json.encode(elementy)
                    clothing = json
                end
                if clothing ~= nil and skin ~= nil then
                    if _value == 1 then
                        TriggerClientEvent("redemrp_clothing:load", _source, skin, clothing)
                    elseif _value == 2 then
                        TriggerClientEvent("redemrp_clothing:sex", _source, skin, clothing)
                    elseif _value == 3 then
                        TriggerClientEvent("redemrp_clothes_remove:start", _source, skin, clothing)

                    end
                else
                    TriggerClientEvent("redemrp_clothing:load_def" , _source)
                end

            end)
        end)
    end)
end)
RegisterServerEvent('redemrp_clothing:SetOutfits')
AddEventHandler('redemrp_clothing:SetOutfits', function(name)
    local _source = source
    local _name = name
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")
        TriggerEvent('redemrp_clothing:retrieveOutfits',identifier, charid,_name, function(call)
            if call then
                print(call)
                MySQL.Async.execute("UPDATE clothes SET `clothes`='" .. call .. "' WHERE `identifier`=@identifier AND `charid`=@charid", {identifier = identifier, charid = charid}, function(done)
                    end)
                TriggerClientEvent("redemrp_skin:FastLoad" , _source)
            end
        end)
    end)
end)
RegisterServerEvent('redemrp_clothing:DeleteOutfit')
AddEventHandler('redemrp_clothing:DeleteOutfit', function(name)
    local _source = source
    local _name = name
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")
        MySQL.Async.fetchAll('DELETE FROM outfits  WHERE `identifier`=@identifier AND `charid`=@charid AND`name`=@name;', {identifier = identifier, charid = charid,  name = _name}, function(result)
            end)
    end)
end)

RegisterServerEvent('redemrp_clothing:getOutfits')
AddEventHandler('redemrp_clothing:getOutfits', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")
        TriggerEvent('redemrp_db:getOutfits',identifier, charid, function(call)
            if call then
                TriggerClientEvent('redemrp_clothing:putInTable', _source, call)
            end
        end)
    end)
end)

AddEventHandler('redemrp_db:getOutfits', function(identifier,charid,callback)
    local Callback = callback
    MySQL.Async.fetchAll('SELECT * FROM outfits WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(outfits)
        if outfits[1] then
            Callback(outfits)
        else
            Callback(false)
        end
    end)
end)

AddEventHandler('redemrp_clothing:retrieveClothes', function(identifier, charid, callback)
    local Callback = callback
    MySQL.Async.fetchAll('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(clothing)
        if clothing[1] then
            Callback(clothing[1])
        else
            Callback(false)
        end
    end)
end)

AddEventHandler('redemrp_clothing:retrieveOutfits', function(identifier, charid, name, callback)
    local Callback = callback
    MySQL.Async.fetchAll('SELECT * FROM outfits WHERE `identifier`=@identifier AND `charid`=@charid AND `name`=@name;', {identifier = identifier, charid = charid, name = name}, function(clothing)
        if clothing[1] then
            Callback(clothing[1]["clothes"])
        else
            Callback(false)
        end
    end)
end)


RegisterServerEvent("redemrp_clothing:deleteClothes")
AddEventHandler("redemrp_clothing:deleteClothes", function(charid, Callback)
    local _source = source
    local id
    for k,v in ipairs(GetPlayerIdentifiers(_source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            id = v
            break
        end
    end

    local Callback = callback
    MySQL.Async.fetchAll('DELETE FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = id, charid = charid}, function(result)
        if result then
        else
        end
    end)
    MySQL.Async.fetchAll('DELETE FROM outfits WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = id, charid = charid}, function(result)
        if result then
        else
        end
    end)
end)
