Config = {}

local ClothsPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil
local sell = false
local active = false

function SetupClothsPrompt()
    Citizen.CreateThread(function()
        local str = 'Clothes'
        ClothsPrompt = PromptRegisterBegin()
        PromptSetControlAction(ClothsPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ClothsPrompt, str)
        PromptSetEnabled(ClothsPrompt, false)
        PromptSetVisible(ClothsPrompt, false)
        PromptSetHoldMode(ClothsPrompt, true)
        PromptRegisterEnd(ClothsPrompt)
    end)
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
          if currentZone then
              if active == false then
                  PromptSetEnabled(ClothsPrompt, true)
                  PromptSetVisible(ClothsPrompt, true)
                  active = true
              end
              if PromptHasHoldModeCompleted(ClothsPrompt) then
                  PromptSetEnabled(ClothsPrompt, false)
                  PromptSetVisible(ClothsPrompt, false)
                  TriggerServerEvent("redemrp_clothing:loadClothes", 2, function(cb)
                  end)
                  active = false
    
          currentZone = nil
        end
          else
        Citizen.Wait(500)
      end
    end
end)


Citizen.CreateThread(function()
    SetupClothsPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false
  
        for k,v in pairs(Config.Zones) do
			if Vdist(coords, v) < 2 then
                isInMarker  = true
                currentZone = 'shop'
                lastZone    = 'shop'
            end
        end
  
        if isInMarker and not hasAlreadyEnteredMarker then
        hasAlreadyEnteredMarker = true
        TriggerEvent('redemrp_clothing:hasEnteredMarker', currentZone)
        end
    
        if not isInMarker and hasAlreadyEnteredMarker then
        hasAlreadyEnteredMarker = false
        TriggerEvent('redemrp_clothing:hasExitedMarker', lastZone)
        end
    end
  
end)

AddEventHandler('redemrp_clothing:hasEnteredMarker', function(zone)
    currentZone     = zone
end)
    
AddEventHandler('redemrp_clothing:hasExitedMarker', function(zone)
      if active == true then
          PromptSetEnabled(ClothsPrompt, false)
          PromptSetVisible(ClothsPrompt, false)
          active = false
      end
    currentZone = nil
end)

--[[To add clothes, copy the hash, paste it at the end of the list and add range in slider(_f means women Only MP components work)--]]

local lista_kapelusze = {} --hat
local lista_kapelusze_f = {}
----------------------------------------------------------------------------------------------------------------------------
local lista_koszula = {} --shirt
local lista_koszula_f = {}
--------------------------------------------------------------------------------------------------------------------------------------
local lista_kamizelka = {} --vest
local lista_kamizelka_f = {}
--------------------------------------------
local lista_spodnie = {} --pants
local lista_spodnie_f = {}
------------------------------------------
local lista_maska = {} --mask
local lista_maska_f = {}
------------------------------------------
local lista_buty = {} --boots
local lista_buty_f = {}
-----------------------------------------
local lista_plaszcz = {} --coats
local lista_plaszcz_f = {}
---------------------------------------
local lista_rekawiczki = {}
local lista_rekawiczki_f = {}

local lista_bandana = {}
local lista_bandana_f = {}
--local lista_rekawiczki_f = {}
------
----gunbelts/holsters
local list_holsters = {}
local list_holsters_f =  {}

-----belts
local list_belts = {}
local list_belts_f =  {}

local list_spurs = {}
local list_spurs_f = {}

local list_chaps = {}
local list_chaps_f = {}

local list_ponchos = {}
local list_ponchos_f = {}

local list_beltbuckles = {}
local list_beltbuckles_f = {}

local list_cloaks = {}
local list_cloaks_f = {}

local list_satchels = {}
local list_satchels_f = {}

local list_offhands = {}
local list_offhands_f = {}



local femaletorsos = {} 
local femalelegs = {}
local maletorsos = {}
local malelegs = {}
local legs = nil
local legs2 = nil
local torso = nil
local torso2 = nil
local lista_spodnica = {} --skirt 
local adding2 = true
local adding = true
local glowna = lista_kapelusze
local sex_global = 1
local cam = nil
------------------------------------------
	local 	kapelusz = 1
	local	koszula = 1
	local	kamizelka = 1
	local	plaszcz = 1
	local	spodnie = 1
	local	spodnica = 1
	local	maska = 1
	local	buty = 1
	local	rekawiczki = 1
    local	bandana = 1
    local	holster = 1
    local	belt = 1
    local   spur = 1 
    local   chap = 1
    local   poncho = 1
    local   beltbuckle = 1
    local   cloak = 1
    local   satchel = 1
    local   offhand = 1
--------------------------------------------	


Citizen.CreateThread(function()
    while adding do
        Citizen.Wait(0)
        --print("Dzieje sie")
        for i, v in ipairs(MaleComp) do
            if v.category == "hats" then
                table.insert(lista_kapelusze, v.Hash)
            elseif v.category == "shirts" then
                table.insert(lista_koszula, v.Hash)
            elseif v.category == "vests" then
                table.insert(lista_kamizelka, v.Hash)
            elseif v.category == "pants" then
                table.insert(lista_spodnie, v.Hash)
            elseif v.category == "masks" then
                table.insert(lista_maska, v.Hash)
            elseif v.category == "coats" then
                table.insert(lista_plaszcz, v.Hash)
            elseif v.category == "boots" then
                table.insert(lista_buty, v.Hash)
            elseif v.category == "torsos" then
                table.insert(maletorsos, v.Hash)
            elseif v.category == "legs" then
                table.insert(malelegs, v.Hash)
			elseif v.category == "gloves" then
                table.insert(lista_rekawiczki, v.Hash)
			elseif v.category == "neckwear" then
                table.insert(lista_bandana, v.Hash)
            elseif v.category == "gunbelts" then
                table.insert(list_holsters, v.Hash)
            elseif v.category == "belts" then
                table.insert(list_belts, v.Hash)
            elseif v.category == "spurs" then
                table.insert(list_spurs, v.Hash)
            elseif v.category == "chaps" then
                table.insert(list_chaps, v.Hash)
            elseif v.category == "ponchos" then
                table.insert(list_ponchos, v.Hash)
            elseif v.category == "beltbuckle" then
                table.insert(list_beltbuckles, v.Hash)
            elseif v.category == "cloaks" then
                table.insert(list_cloaks, v.Hash)
            elseif v.category == "satchels" then
                table.insert(list_satchels, v.Hash)
            elseif v.category == "offhand" then
                table.insert(list_offhands, v.Hash)
            end
        end
        adding = false
    end
end)


Citizen.CreateThread(function()
    while adding2 do
        Citizen.Wait(0)
        --print("Dzieje sie 2")
        for i, v in ipairs(FemaleComp) do
            if v.category == "hats" then
                table.insert(lista_kapelusze_f, v.hash)
            elseif v.category == "shirts" then
                table.insert(lista_koszula_f, v.hash)
            elseif v.category == "vests" then
                table.insert(lista_kamizelka_f, v.hash)
            elseif v.category == "pants" then
                table.insert(lista_spodnie_f, v.hash)
            elseif v.category == "boots" then
                table.insert(lista_buty_f, v.hash)
            elseif v.category == "masks" then
                table.insert(lista_maska_f, v.hash)
            elseif v.category == "coats" then
                table.insert(lista_plaszcz_f, v.hash)
            elseif v.category == "skirts" then
                table.insert(lista_spodnica, v.hash)
            elseif v.category == "torsos" then
                table.insert(femaletorsos, v.hash)
            elseif v.category == "legs" then
                table.insert(femalelegs, v.hash)
			elseif v.category == "gloves" then
                table.insert(lista_rekawiczki_f, v.hash)
			elseif v.category == "neckwear" then
                table.insert(lista_bandana_f, v.hash)
            elseif v.category == "gunbelts" then
                table.insert(list_holsters_f, v.hash)
            elseif v.category == "belts" then
                table.insert(list_belts_f, v.hash)
            elseif v.category == "spurs" then
                table.insert(list_spurs_f, v.hash)
            elseif v.category == "chaps" then
                table.insert(list_chaps_f, v.hash)
            elseif v.category == "ponchos" then
                table.insert(list_ponchos_f, v.hash)
            elseif v.category == "beltbuckle" then
                table.insert(list_beltbuckles_f, v.hash)
            elseif v.category == "cloaks" then
                table.insert(list_cloaks_f, v.hash)
            elseif v.category == "satchels" then
                table.insert(list_satchels_f, v.hash)
            elseif v.category == "offhand" then
                table.insert(list_offhands_f, v.hash)
            end
        end
        adding2 = false
    end
end)

RegisterCommand('dump', function(source, args)
    for key, value in pairs(list_satchels_f) do
        print(key, value)
    end
end)





RegisterNetEvent('redemrp_clothing:sex')
AddEventHandler('redemrp_clothing:sex', function(skin, ubranie)
    local _skin = json.decode(skin)
	local _ubranie = json.decode(ubranie)
    local sex = 1
    if _skin.sex == "male" then
        sex = 1
        sex_global = sex
        if tonumber(_skin.skin) == 1 then
            torso = '0x' .. maletorsos[6]
            legs = '0x' .. malelegs[5]
        elseif tonumber(_skin.skin) == 2 then
            torso = '0x' .. maletorsos[2]
            legs = '0x' .. malelegs[5]
        elseif tonumber(_skin.skin) == 3 then
            torso = '0x' .. maletorsos[4]
            legs = '0x' .. malelegs[1]
        elseif tonumber(_skin.skin) == 4 then
            torso = '0x' .. maletorsos[7]
            legs = '0x' .. malelegs[3]
        elseif tonumber(_skin.skin) == 5 then
            torso = '0x' .. maletorsos[5]
            legs = '0x' .. malelegs[4]
        elseif tonumber(_skin.skin) == 6 then
            torso = '0x' .. maletorsos[3]
            legs = '0x' .. malelegs[2]
        else end
		kapelusz = tonumber( _ubranie.kapelusz)
		koszula = tonumber(_ubranie.koszula)
		kamizelka = tonumber(_ubranie.kamizelka)
		plaszcz =tonumber (_ubranie.plaszcz)
		spodnie = tonumber(_ubranie.spodnie)
		maska = tonumber(_ubranie.maska)
		buty = tonumber(_ubranie.buty)
		rekawiczki = tonumber(_ubranie.rekawiczki)
        bandana = tonumber(_ubranie.bandana)
        holster = tonumber(_ubranie.holster)
        belt = tonumber(_ubranie.belt)
        spur = tonumber(_ubranie.spur)
        chap = tonumber(_ubranie.chap)
        poncho = tonumber(_ubranie.poncho)
        beltbuckle = tonumber(_ubranie.beltbuckle)
        cloak = tonumber(_ubranie.cloak)
        satchel = tonumber(_ubranie.satchel)
        offhand = tonumber(_ubranie.offhand)
    else
        sex = 2
        sex_global = sex
        if tonumber(_skin.skin) == 1 then
            torso2 = '0x' .. femaletorsos[6]
            legs2 = '0x' .. femalelegs[1]
        elseif tonumber(_skin.skin) == 2 then
            torso2 = '0x' .. femaletorsos[3]
            legs2 = '0x' .. femalelegs[2]
        elseif tonumber(_skin.skin) == 3 then
            torso2 = '0x' .. femaletorsos[2]
            legs2 = '0x' .. femalelegs[3]
        elseif tonumber(_skin.skin) == 4 then
            torso2 = '0x' .. femaletorsos[4]
            legs2 = '0x' .. femalelegs[5]
        elseif tonumber(_skin.skin) == 5 then
            torso2 = '0x' .. femaletorsos[8]
            legs2 = '0x' .. femalelegs[6]
        elseif tonumber(_skin.skin) == 6 then
            torso2 = '0x' .. femaletorsos[9]
            legs2 = '0x' .. femalelegs[8]
        else end
		kapelusz = tonumber( _ubranie.kapelusz)
		koszula = tonumber(_ubranie.koszula)
		kamizelka = tonumber(_ubranie.kamizelka)
		plaszcz =tonumber (_ubranie.plaszcz)
		spodnie = tonumber(_ubranie.spodnie)
		spodnica = tonumber(_ubranie.spodnica)
		maska = tonumber(_ubranie.maska)
		buty = tonumber(_ubranie.buty)
		rekawiczki = tonumber(_ubranie.rekawiczki)
        bandana = tonumber(_ubranie.bandana)
        holster = tonumber(_ubranie.holster)
        belt = tonumber(_ubranie.belt)
        spur = tonumber(_ubranie.spur)
        chap = tonumber(_ubranie.chap)
        poncho = tonumber(_ubranie.poncho)
        beltbuckle = tonumber(_ubranie.beltbuckle)
        cloak = tonumber(_ubranie.cloak)
        offhand = tonumber(_ubranie.offhand)
 end
    startUI(sex)
    SetNuiFocus(true, true)
    camera(3.1,-0.15)	

end)

function startUI(sex)
    local sex1 = sex
    SendNUIMessage({
        type = "ui",
        display = true,
        sex3 = sex1,
		kapelusz = kapelusz,
		koszula = koszula,
		kamizelka = kamizelka,
		plaszcz = plaszcz,
		spodnie = spodnie,
		maska = maska,
		buty = buty,
		rekawiczki = rekawiczki,
		bandana = bandana,
        spodnica = spodnica,
        holster = holster,
        belt = belt,
        spur = spur,
        chap = chap,
        poncho = poncho,
        beltbuckle = beltbuckle,
        cloak = cloak,
        satchel = satchel,
        offhand = offhand
    })
end

function hideUI()
    SendNUIMessage({
        type = "ui",
        display = false

    })
end
-- Blacha20199

-- if Config.EnableCommand then
-- RegisterCommand('clothing', function(source, args)
--     TriggerServerEvent("redemrp_clothing:loadClothes", 2, function(cb)
--         end)
-- end)
-- else end



RegisterNUICallback('heading', function(heading)
    local playerPed = PlayerPedId()
    local _heading = heading/1 -- yes :1 xD
    print(_heading)
    SetEntityHeading(playerPed, _heading)
end)

RegisterNUICallback('Save', function(data, cb)
    SetNuiFocus(false, false)
    destory()
    local elementy = {
        ["kapelusz"] = data.kapelusz,
        ["koszula"] = data.koszula,
        ["kamizelka"] = data.kamizelka,
        ["spodnie"] = data.spodnie,
        ["maska"] = data.maska,
        ["buty"] = data.buty,
        ["spodnica"] = data.spodnica,
        ["plaszcz"] = data.plaszcz,
		["rekawiczki"] = data.rekawiczki,
        ["bandana"] = data.bandana,
        ["holster"] = data.holster,
        ["belt"] = data.belt,
        ["spur"] = data.spur,
        ["chap"] = data.chap,
        ["poncho"] = data.poncho,
        ["beltbuckle"] = data.beltbuckle,
        ["cloak"] = data.cloak,
        ["satchel"] = data.satchel,
        ["offhand"] = data.offhand,



    }
    --print("tak1")
    print(tonumber(elementy.kapelusz)) -- INCOMING
    local price = Config.Price
    local json = json.encode(elementy)
    TriggerServerEvent("redemrp_clothing:Save", json, price, function(cb)
        if cb then
            print("DONE")
        else
            print("ERROR")
        end
    end)
    --	print("tak2")
end)

RegisterNUICallback('Camera', function()
camera(3.1,-0.15)
end)


RegisterNUICallback('komponent', function(component)
    if sex_global == 1 then
        if component == "kapelusz" then
            glowna = lista_kapelusze
			camera(1.5,0.4)
        elseif component == "koszula" then
            glowna = lista_koszula
			 camera(1.8,0.1)
        elseif component == "kamizelka" then
            glowna = lista_kamizelka
			camera(1.8,0.1)
        elseif component == "spodnie" then
            glowna = lista_spodnie
			camera(2.2,-0.3)
        elseif component == "maska" then
            glowna = lista_maska
			camera(1.5,0.4)
        elseif component == "buty" then
            glowna = lista_buty
			camera(1.8,-0.6)
        elseif component == "plaszcz" then
            glowna = lista_plaszcz
			camera(2.5,0.1)
		elseif component == "rekawiczki" then
            glowna = lista_rekawiczki
			camera(1.8,-0.3)
		elseif component == "bandana" then
            glowna = lista_bandana
            camera(1.5,0.4)
        elseif component == "holster" then
            glowna = list_holsters
            camera(2.2,-0.3)
        elseif component == "belt" then
            glowna = list_belts
            camera(2.2,-0.3)
        elseif component == "spur" then
            glowna = list_spurs
            camera(1.8,-0.6)
        elseif component == "chap" then
            glowna = list_chaps
            camera(2.2,-0.3)
        elseif component == "poncho" then
            glowna = list_ponchos
            camera(1.8,0.1)
        elseif component == "beltbuckle" then
            glowna = list_beltbuckles
            camera(2.2,-0.3)
        elseif component == "cloak" then
            glowna = list_cloaks
            camera(1.8,0.1)
        elseif component == "satchel" then
            glowna = list_satchels
            camera(1.5,0.4)
        elseif component == "offhand" then
            glowna = list_offhands
            camera(2.2,-0.3)
        end

    elseif sex_global == 2 then
        if component == "kapelusz" then
            glowna = lista_kapelusze_f
			camera(1.5,0.4)
        elseif component == "koszula" then
            glowna = lista_koszula_f
			 camera(1.8,0.1)
        elseif component == "kamizelka" then
            glowna = lista_kamizelka_f
			camera(1.8,0.1)
        elseif component == "spodnie" then
            glowna = lista_spodnie_f
			camera(2.2,-0.3)
        elseif component == "maska" then
            glowna = lista_maska_f
			camera(1.5,0.4)
        elseif component == "buty" then
            glowna = lista_buty_f
			camera(1.8,-0.6)
        elseif component == "spodnica" then
            glowna = lista_spodnica
			camera(2.2,-0.3)
        elseif component == "plaszcz" then
            glowna = lista_plaszcz_f
				camera(2.5,0.1)
		elseif component == "rekawiczki" then
            glowna = lista_rekawiczki_f
			camera(1.8,-0.3)
		elseif component == "bandana" then
            glowna = lista_bandana_f
            camera(1.5,0.4)
        elseif component == "holster" then
            glowna = list_holsters_f
            camera(2.2,-0.3)
        elseif component == "belt" then
            glowna = list_belts_f
            camera(2.2,-0.3)
        elseif component == "spur" then
            glowna = list_spurs_f
            camera(1.8,-0.6)
        elseif component == "chap" then
            glowna = list_chaps_f
            camera(2.2,-0.3)
        elseif component == "poncho" then
            glowna = list_ponchos_f
            camera(1.8,0.1)
        elseif component == "beltbuckle" then
            glowna = list_beltbuckles_f
            camera(2.2,-0.3)
        elseif component == "cloak" then
            glowna = list_cloaks_f
            camera(1.8,0.1)
        elseif component == "satchel" then
            glowna = list_satchels_f
            camera(1.5,0.4)
        elseif component == "offhand" then
            glowna = list_offhands_f
            camera(2.2,-0.3)
        end
    end
    --print(component)
end)

RegisterNUICallback('zmiana', function(wartosc)
    local wartosc2 = tonumber(wartosc)
    local hash = ("0x" .. glowna[wartosc2])
    print(hash)
    --print(glowna[wartosc2])
    if glowna == lista_spodnie_f and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs2),true,true,true)

    elseif glowna == lista_spodnie and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs),true,true,true)

    elseif glowna == lista_koszula and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso),true,true,true)

    elseif glowna == lista_koszula_f and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),true,true,true)

    elseif (glowna == lista_maska_f or glowna == lista_maska) and wartosc2 == 1 then

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for hats
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
		
	elseif (glowna == lista_rekawiczki or glowna == lista_rekawiczki_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0) -- Set target category, here the hash is for hats
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
		
	elseif (glowna == lista_bandana or glowna == lista_bandana_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0) -- Set target category, here the hash is for hats
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component
    elseif (glowna == list_holsters or glowna == list_holsters_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB9E2FA01, 0) -- holsters
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

    elseif (glowna == list_belts or glowna == list_belts_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0) -- belts
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

    elseif (glowna == list_beltbuckles or glowna == list_beltbuckles_f) and wartosc2 == 1 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0) -- beltsbuckles
            --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

    elseif (glowna == list_spurs or glowna == list_spurs_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0) -- SPURS
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

    elseif (glowna == list_chaps or glowna == list_chaps_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0) -- chaps
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
    
    elseif (glowna == list_ponchos or glowna == list_ponchos_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0) -- ponchos
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

    elseif (glowna == list_cloaks or glowna == list_cloaks_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0) -- cloaks
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
    elseif (glowna == list_satchels or glowna == list_satchels_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0) -- satchels
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

    elseif (glowna == list_offhands or glowna == list_offhands_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0) -- holsters left
        --  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		
    elseif (glowna == lista_kapelusze_f or glowna == lista_kapelusze) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0) -- Set target category, here the hash is for hats
        --   Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    elseif glowna == lista_spodnica and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0) -- Set target category, here the hash is for hats
        -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    elseif (glowna == lista_plaszcz_f or glowna == lista_plaszcz) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0) -- Set target category, here the hash is for hats
        -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    elseif (glowna == lista_kamizelka_f or glowna == lista_kamizelka) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0) -- Set target category, here the hash is for hats
        -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component

    else

        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  tonumber(hash), true, true, true)
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0) -- Actually remove the component



    if glowna == lista_buty then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs),true,true,true)
    elseif glowna == lista_spodnie_f or lista_buty_f then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs2),true,true,true)
    elseif glowna == lista_koszula  then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso),true,true,true)
    elseif glowna == lista_koszula_f  then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),true,true,true)
    end
end)


RegisterNetEvent('redemrp_clothing:load2')
AddEventHandler('redemrp_clothing:load2', function()
    TriggerServerEvent("redemrp_clothing:loadClothes", 1, function(cb)
        end)
end)
RegisterNetEvent('redemrp_clothing:load_def')
AddEventHandler('redemrp_clothing:load_def', function()
    TriggerServerEvent("redemrp_skin:loadSkin", function(cb)
        end)
end)

RegisterCommand("loadcloath", function(source, args)
    TriggerServerEvent("redemrp_clothing:loadClothes", 1, function(cb)
        end)
end)

RegisterNetEvent('redemrp_clothing:load')
AddEventHandler('redemrp_clothing:load', function(skin, ubranie)
    local _skin = json.decode(skin)
    print(json.decode(ubranie))
    local _ubranie = json.decode(ubranie)
    local sex = 1
    local hash = nil
    local wartosc = 1
    --print (_skin.sex)

    if _skin.sex == "male" then
        sex = 1
    else
        sex = 2
    end

    if sex == 1 then
	for i = 1 , 3 do
	SetEntityAlpha(PlayerPedId(), 0)
	 Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0)
	  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
	  
	  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0)
	   Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
	   
	   Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) 
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		
		 Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) 
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB9E2FA01, 0)   ---holsters
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0)   ---belts
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0)   ---spurs
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0)   ---chaps
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0)   ---onchos
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0)   ---beltbuckles
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0)   ---cloaks
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0)   ---sat
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0)   --offhand
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		
		  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0)
			Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)	
			
			Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0)
			Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)	
			
			Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0)
			Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)		 				
        Wait(600)
        glowna = lista_maska
        wartosc = tonumber(_ubranie.maska)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło5")
        end
        Wait(600)
        glowna = lista_kapelusze
        wartosc = tonumber(_ubranie.kapelusz)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło1")
        end
        Wait(600)
        glowna = lista_koszula
        wartosc = tonumber(_ubranie.koszula)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło2")
        end
        Wait(600)
        glowna = lista_kamizelka
        wartosc = tonumber(_ubranie.kamizelka)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło3")
        end
        Wait(300)
        glowna = lista_spodnie
        wartosc = tonumber(_ubranie.spodnie)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło4")
        end
        Wait(300)
        glowna = lista_buty
        wartosc = tonumber(_ubranie.buty)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
		
		 Wait(300)
        glowna = lista_rekawiczki
        wartosc = tonumber(_ubranie.rekawiczki)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
		 Wait(300)
        glowna = lista_bandana
        wartosc = tonumber(_ubranie.bandana)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
		 Wait(300)
		  glowna = lista_plaszcz
          wartosc = tonumber(_ubranie.plaszcz)
		  if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło1")
        end
        Wait(300)
        glowna = list_holsters
        wartosc = tonumber(_ubranie.holster)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_belts
        wartosc = tonumber(_ubranie.belt)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_spurs
        wartosc = tonumber(_ubranie.spur)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_chaps
        wartosc = tonumber(_ubranie.chap)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_ponchos
        wartosc = tonumber(_ubranie.poncho)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_beltbuckles
        wartosc = tonumber(_ubranie.beltbuckle)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_cloaks
        wartosc = tonumber(_ubranie.cloak)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_satchels
        wartosc = tonumber(_ubranie.satchel)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_offhands
        wartosc = tonumber(_ubranie.offhand)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        end
        for i=51, 255, 51 do
            Wait(1)
            SetEntityAlpha(PlayerPedId(), i)
        end
	else

for i = 1 , 3 do
SetEntityAlpha(PlayerPedId(), 0)
	 Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0)
	  Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
	  
	  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0)
	   Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
	   
	   Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) 
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		
		 Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) 
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB9E2FA01, 0)   ---holsters
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0)   ---belts
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0)   ---spurs
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0)   ---chaps
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0)   ---onchos
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0)   ---beltbuckles
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0)   ---cloaks
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0)   ---sat
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0)   --offhand
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		
		
		
		  Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0)
			Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)	
			
			Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0)
			Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)	
			
			Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0)
			Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)		 			
        Wait(300)
        glowna = lista_maska_f
        wartosc = tonumber(_ubranie.maska)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło5")
        end

        glowna = lista_kapelusze_f
        wartosc = tonumber(_ubranie.kapelusz)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło1")
        end
        Wait(300)
        glowna = lista_koszula_f
        wartosc = tonumber(_ubranie.koszula)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło2")
        end
        Wait(300)
        glowna = lista_kamizelka_f
        wartosc = tonumber(_ubranie.kamizelka)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło3")
        end
        Wait(300)
        glowna = lista_plaszcz_f
        wartosc = tonumber(_ubranie.plaszcz)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło5")
        end
        Wait(300)
        glowna = lista_spodnie_f
        wartosc = tonumber(_ubranie.spodnie)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło4")
        end
        Wait(300)
        glowna = lista_buty_f
        wartosc = tonumber(_ubranie.buty)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = lista_spodnica
        wartosc = tonumber(_ubranie.spodnica)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło7")
        end
		 Wait(300)
        glowna = lista_rekawiczki_f
        wartosc = tonumber(_ubranie.rekawiczki)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
		 Wait(300)
        glowna = lista_bandana_f
        wartosc = tonumber(_ubranie.bandana)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_holsters_f
        wartosc = tonumber(_ubranie.holster)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_belts_f
        wartosc = tonumber(_ubranie.belt)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_spurs_f
        wartosc = tonumber(_ubranie.spur)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_chaps_f
        wartosc = tonumber(_ubranie.chap)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_ponchos_f
        wartosc = tonumber(_ubranie.poncho)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_beltbuckles_f
        wartosc = tonumber(_ubranie.beltbuckle)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_cloaks_f
        wartosc = tonumber(_ubranie.cloak)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_satchels_f
        wartosc = tonumber(_ubranie.satchel)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
        Wait(300)
        glowna = list_offhands_f
        wartosc = tonumber(_ubranie.offhand)
        if wartosc > 1 then
            --print(wartosc)
            hash = ("0x" .. glowna[wartosc])
            ladowanie(hash)
            --print("poszło6")
        end
    end
    for i=51, 255, 51 do
        Wait(1)
        SetEntityAlpha(PlayerPedId(), i)
    end
end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------

function ladowanie(hash)
    Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  tonumber(hash), true, true, true)
    --print("poszło13")
    --print(hash)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 10);
	DisplayText(str, x, y)
end

function destory()
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    DisplayHud(true)
    DisplayRadar(true)
	DestroyAllCams(true)
end

function camera(zoom, offset)
DestroyAllCams(true)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local heading = 45.0
    local zoomOffset = zoom
    local camOffset = offset
    local angle = heading * math.pi / 180.0
    local theta = {
        x = math.cos(angle),
        y = math.sin(angle)
    }
    print(theta.x)
    local pos = {
        x = coords.x + (zoomOffset * theta.x),
        y = coords.y + (zoomOffset * theta.y)
    }
    print(pos.x)
    local angleToLook = heading - 140.0
    if angleToLook > 360 then
        angleToLook = angleToLook - 360
    elseif angleToLook < 0 then
        angleToLook = angleToLook + 360
    end
    print(angleToLook)
    angleToLook = angleToLook * math.pi / 180.0
    local thetaToLook = {
        x = math.cos(angleToLook),
        y = math.sin(angleToLook)
    }
    print(thetaToLook.x)
    local posToLook = {
        x = coords.x + (zoomOffset * thetaToLook.x),
        y = coords.y + (zoomOffset * thetaToLook.y)
    }
    print(posToLook.x)

    SetEntityHeading(playerPed, 334.00)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x-0.6, pos.y, coords.z + camOffset, 300.00,0.00,0.00, 40.00, false, 0)
    PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    DisplayHud(false)
    DisplayRadar(false)
end

Citizen.CreateThread(function()
	Wait(0)
	for k,v in pairs(Config.Zones) do
		local blip = N_0x554d9d53f696d002(1664425300, v)
		SetBlipSprite(blip, 1496995379, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.BlipName)
	end
end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 	Wait(0)
-- 		local playerPed = PlayerPedId()
-- 		local coords = GetEntityCoords(playerPed)
-- 	for k,v in pairs(Config.Zones) do
-- 			if Vdist(coords, v) < 2 then
-- 				DrawTxt(Config.Shoptext, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
-- 				if IsControlJustReleased(0, Config.OpenKey) then
-- 					TriggerServerEvent("redemrp_clothing:loadClothes", 2, function(cb)
-- 					end)
-- 				end
-- 			end
-- 		end
-- 	end
-- end)

