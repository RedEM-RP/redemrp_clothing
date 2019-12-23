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
print("ZA MALO PIENIEDZY")
TriggerClientEvent("redemrp_clothing:load2" , source)
TriggerClientEvent('redemrp_clothing:cancel', source)
end


end)
end)

RegisterServerEvent('redemrp_clothing:loadClothes')
AddEventHandler('redemrp_clothing:loadClothes', function()
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
	   else
	   ubrania = nil
     end
	 
     if ubrania ~= nil and skin ~= nil then
      TriggerClientEvent("redemrp_clothing:load", _source, skin, ubrania)
	  else
	 TriggerClientEvent("redemrp_clothing:load_def" , _source)
     end

            end)
        end)
    end)
end)


RegisterServerEvent('redemrp_clothing:sex_test')
AddEventHandler('redemrp_clothing:sex_test', function()
local _source = source
local skin = nil
TriggerEvent('redemrp:getPlayerFromId', source, function(user)
     local identifier = user.getIdentifier()
     local charid = user.getSessionVar("charid")

MySQL.Async.fetchAll('SELECT * FROM skins WHERE `identifier`=@identifier AND `charid`=@charid;', {identifier = identifier, charid = charid}, function(skins)
     if skins[1]then
        skin = skins[1].skin
              if skin ~= nil then
                    TriggerClientEvent("redemrp_clothing:sex", _source, skin)
               end
          end
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
