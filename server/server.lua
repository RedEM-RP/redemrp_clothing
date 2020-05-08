RegisterServerEvent('redemrp_clothing:Save')
AddEventHandler('redemrp_clothing:Save', function(ubrania, price, cb)
    local _ubrania = ubrania
    local _price = price
    local decode = json.decode(ubrania)
    print (_price)
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")
        local currentMoney = user.getMoney()
        print (currentMoney)
        if currentMoney >= _price then
            user.removeMoney(_price)
            TriggerEvent("redemrp_clothing:retrieveClothes", identifier, charid, function(call)

                    if call then

                        MySQL.Async.execute("UPDATE clothes SET `clothes`='" .. _ubrania .. "' WHERE `identifier`=@identifier AND `charid`=@charid", {identifier = identifier, charid = charid}, function(done)
                            end)
                    else

                        MySQL.Async.execute('INSERT INTO clothes (`identifier`, `charid`, `clothes`) VALUES (@identifier, @charid, @ubrania);',
                            {
                                identifier = identifier,
                                charid = charid,
                                ubrania = _ubrania
                            }, function(rowsChanged)
                            end)
                    end
            end)
        else
            TriggerClientEvent("redemrp_clothing:load2" , source)
            TriggerClientEvent("redemrp_notification:start",source, "You do not have money" , 2, "error")
        end


    end)
end)



RegisterServerEvent('redemrp_clothing:loadClothes')
AddEventHandler('redemrp_clothing:loadClothes', function(value)
    local _value = value
    local _source = source
    local skin = nil
    local ubrania = nil
    local ubranie2 = 0
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")

        MySQL.Async.fetchAll('SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(skins)
            if skins[1]then
                skin = skins[1].skin
            else
                skin = nil
            end



            MySQL.Async.fetchAll('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(ubrania)
                if ubrania[1] then
                    ubrania = ubrania[1].clothes
                    print(json.decode(ubrania ))
                else
                    local elementy = {
                        ["kapelusz"] = 1,
                        ["koszula"] = 1,
                        ["kamizelka"] = 1,
                        ["spodnie"] = 1,
                        ["maska"] = 1,
                        ["buty"] = 1,
                        ["spodnica"] = 1,
                        ["plaszcz"] = 1,
                        ["rekawiczki"] = 1,
                        ["bandana"] = 1,
                        ["holster"] = 1,
                        ["belt"] = 1,
                        ["spur"] = 1,
                        ["chap"] = 1,
                        ["poncho"] = 1,
                        ["beltbuckle"] = 1,
                        ["cloak"] = 1,
                        ["satchel"] = 1,
                        ["offhand"] = 1

                    }
                    local json = json.encode(elementy)
                    ubrania = json
                end

                if ubrania ~= nil and skin ~= nil then
                    if _value == 1 then
                        TriggerClientEvent("redemrp_clothing:load", _source, skin, ubrania)
                    elseif _value == 2 then
                        TriggerClientEvent("redemrp_clothing:sex", _source, skin, ubrania)
					elseif _value == 3 then
					 TriggerClientEvent("redemrp_clothes_remove:start", _source, skin, ubrania)
					
                    end
                else
                    TriggerClientEvent("redemrp_clothing:load_def" , _source)
                end

            end)
        end)
    end)
end)



AddEventHandler('redemrp_clothing:retrieveClothes', function(identifier, charid, callback)
    local Callback = callback
    MySQL.Async.fetchAll('SELECT * FROM clothes WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(ubrania)
        if ubrania[1] then
            Callback(ubrania[1])
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
end)       
