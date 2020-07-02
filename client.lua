Config = {}

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
-------------------------------------
local lista_bandana = {}
local lista_bandana_f = {}
--------------------------------
local lista_paskinabron = {}
local lista_paskinabron_f = {}
-------------------------------
local lista_paski = {}
local lista_paski_f = {}
---------------------------------
local lista_klamry ={}
local lista_klamry_f = {}
----------------------------------
local lista_kabury ={}
local lista_kabury_f ={}
-------------------------
local lista_krawaty = {}
local lista_krawaty_f = {}
------------------------------
local lista_szelki ={}
local lista_szelki_f ={}
-------------------------
local lista_ostrogi = {}
local lista_ostrogi_f = {}

local lista_poncho = {}
local lista_poncho_f = {}


local lista_okulary = {}
local lista_okulary_f = {}

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
local fast = false
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
local   paskinabron = 1
local   paski = 1
local   klamry = 1
local   kabury = 1
local   krawat = 1
local 	szelki = 1
local 	ostrogi = 1
local 	poncho = 1
local 	okulary = 1
--------------------------------------------
local isSkinCreatorOpened = false

function ShowSkinCreator(enable , sex)
    local sex1 = sex
    SendNUIMessage({
        openSkinCreator = enable,
        sex = sex1,
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
        paskinabron = paskinabron,
        paski = paski,
        klamry = klamry,
        kabury = kabury,
        krawat = krawat,
		szelki = szelki,
		ostrogi = ostrogi,
		poncho = poncho,
		okulary = okulary,
    })
	SetNuiFocus(enable, enable)
end



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
                table.insert(lista_paskinabron, v.Hash)
            elseif v.category == "belts" then
                table.insert(lista_paski, v.Hash)
            elseif v.category == "beltbuckle" then
                table.insert(lista_klamry, v.Hash)
            elseif v.category == "offhand" then
                table.insert(lista_kabury, v.Hash)
            elseif v.category == "neckties" then
                table.insert(lista_krawaty, v.Hash)
			elseif v.category == "suspenders" then
                table.insert(lista_szelki, v.Hash)
			elseif v.category == "spurs" then
                table.insert(lista_ostrogi, v.Hash)
			elseif v.category == "ponchos" then
                table.insert(lista_poncho, v.Hash)
			elseif v.category == "eyewear" then
                table.insert(lista_okulary, v.Hash)
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
            elseif v.category == "belts" then
                table.insert(lista_paski_f, v.hash)
			elseif v.category == "gunbelts" then
                table.insert(lista_paskinabron_f, v.hash)
            elseif v.category == "beltbuckle" then
                table.insert(lista_klamry_f, v.hash)
            elseif v.category == "offhand" then
                table.insert(lista_kabury_f, v.hash)
            elseif v.category == "neckties" then
                table.insert(lista_krawaty_f, v.hash)
			elseif v.category == "suspenders" then
                table.insert(lista_szelki_f, v.hash)
			elseif v.category == "spurs" then
                table.insert(lista_ostrogi_f, v.hash)
			elseif v.category == "ponchos" then
                table.insert(lista_poncho_f, v.hash)
			elseif v.category == "eyewear" then
                table.insert(lista_okulary_f, v.hash)
            else end
        end
        adding2 = false
    end
end)

RegisterNetEvent('redemrp_clothing:sex')
AddEventHandler('redemrp_clothing:sex', function(skin, ubranie)
    local _skin = json.decode(skin)
    local _ubranie = json.decode(ubranie)
    local sex = 1
    if tonumber(_skin.sex) == 1 then
        sex = 1
        sex_global = sex
         if tonumber(_skin.skincolor) == 1 then
                    torso = '0x' .. maletorsos[1]
                    legs = '0x' .. malelegs[1]
                elseif tonumber(_skin.skincolor) == 2 then
                    torso = '0x' .. maletorsos[10]
                    legs = '0x' .. malelegs[10]		
                elseif tonumber(_skin.skincolor) == 3 then
                    torso = '0x' .. maletorsos[3]
                    legs = '0x' .. malelegs[3]
                elseif tonumber(_skin.skincolor) == 4 then
                    torso = '0x' .. maletorsos[11]
                    legs = '0x' .. malelegs[11]
                elseif tonumber(_skin.skincolor) == 5 then
                    torso = '0x' .. maletorsos[8]
                    legs = '0x' .. malelegs[8]
                elseif tonumber(_skin.skincolor) == 6 then
                    torso = '0x' .. maletorsos[30]
                    legs = '0x' .. malelegs[30]
                else end
        kapelusz = tonumber( _ubranie.hat)
        koszula = tonumber(_ubranie.shirt)
        kamizelka = tonumber(_ubranie.vest)
        plaszcz =tonumber (_ubranie.coat)
        spodnie = tonumber(_ubranie.pants)
        maska = tonumber(_ubranie.mask)
        buty = tonumber(_ubranie.boots)
        rekawiczki = tonumber(_ubranie.rekawiczki)
        bandana = tonumber(_ubranie.bandana)
        paskinabron = tonumber(_ubranie.gunbelts)
        paski = tonumber(_ubranie.belts)
        klamry = tonumber(_ubranie.beltbuckle)
        kabury = tonumber(_ubranie.offhand)
        krawat = tonumber(_ubranie.neckties)
		szelki = tonumber(_ubranie.suspenders)
		ostrogi = tonumber(_ubranie.spurs)
		poncho = tonumber(_ubranie.poncho)
		okulary = tonumber(_ubranie.eyewear)
        print(kapelusz)
        print(koszula)
        print(kamizelka)
        print(spodnie)
    else
        sex = 2
        sex_global = sex
        if tonumber(_skin.skincolor) == 1 then
                    torso2 = '0x' .. femaletorsos[1]
                    legs2 = '0x' .. femalelegs[1]
                elseif tonumber(_skin.skincolor) == 2 then
                    torso2 = '0x' .. femaletorsos[10]
                    legs2 = '0x' .. femalelegs[10]
                elseif tonumber(_skin.skincolor) == 3 then
                    torso2 = '0x' .. femaletorsos[3]
                    legs2 = '0x' .. femalelegs[3]
                elseif tonumber(_skin.skincolor) == 4 then
                    torso2 = '0x' .. femaletorsos[11]
                    legs2 = '0x' .. femalelegs[11]
                elseif tonumber(_skin.skincolor) == 5 then
                    torso2 = '0x' .. femaletorsos[8]
                    legs2 = '0x' .. femalelegs[8]
                elseif tonumber(_skin.skincolor) == 6 then
                    torso2 = '0x' .. femaletorsos[30]
                    legs2 = '0x' .. femalelegs[30]
                else end
        kapelusz = tonumber( _ubranie.hat)
        koszula = tonumber(_ubranie.shirt)
        kamizelka = tonumber(_ubranie.vest)
        plaszcz =tonumber (_ubranie.coat)
        spodnie = tonumber(_ubranie.pants)
        spodnica = tonumber(_ubranie.skirt)
        maska = tonumber(_ubranie.mask)
        buty = tonumber(_ubranie.boots)
        rekawiczki = tonumber(_ubranie.rekawiczki)
        bandana = tonumber(_ubranie.bandana)
        paskinabron = tonumber(_ubranie.gunbelts)
        paski = tonumber(_ubranie.belts)
        klamry = tonumber(_ubranie.beltbuckle)
        kabury = tonumber(_ubranie.offhand)
        krawat = tonumber(_ubranie.neckties)
		szelki = tonumber(_ubranie.suspenders)
		ostrogi = tonumber(_ubranie.spurs)
		poncho = tonumber(_ubranie.poncho)
		okulary = tonumber(_ubranie.eyewear)
    end
    ShowSkinCreator(true, sex)
    isSkinCreatorOpened = true
    camera(2.8,-0.15)
	print(torso)
	print(legs)

end)

RegisterCommand("loadcloath", function(source, args)
    TriggerServerEvent("redemrp_clothing:loadClothes", 1, function(cb)
        end)
end)

RegisterNUICallback('exit', function()
    TriggerEvent("redemrp_skin:FastLoad")
    isSkinCreatorOpened = false
    ShowSkinCreator(false)
    destory()
end)
RegisterNUICallback('saveClothes', function(data, cb)
    SetNuiFocus(false, false)

    local ped = PlayerPedId()
    FreezeEntityPosition(ped, false)
    DisplayHud(true)
    DisplayRadar(true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    local saveOutfit = false
    local price = Config.Price
    local json = json.encode(data)
    if data.name ~= nil and data.name ~= "" then
        saveOutfit = true
        TriggerServerEvent("redemrp_clothing:Save", json, price, saveOutfit , data.name, function(cb)
            if cb then
                print("DONE")
            else
                print("ERROR")
            end
        end)
    else

        TriggerServerEvent("redemrp_clothing:Save", json, price, saveOutfit ,function(cb)
            if cb then
                print("DONE")
            else
                print("ERROR")
            end
        end)
    end


    --	print("tak2")
    DestroyAllCams()
    isSkinCreatorOpened = false
    ShowSkinCreator(false)
	 TriggerServerEvent("redemrp_clothing:loadClothes", 3, function(cb)
        end)
end)


RegisterNetEvent('redemrp_clothing:load2')
AddEventHandler('redemrp_clothing:load2', function()
    TriggerServerEvent("redemrp_clothing:loadClothes", 1, function(cb)
        end)
    fast = true
end)




RegisterNUICallback('updateClothes', function(data, cb)
    TriggerEvent("redemrp_clothing:updateClothes" , data)
end)

RegisterNetEvent('redemrp_clothing:updateClothes')
AddEventHandler('redemrp_clothing:updateClothes', function(data)
    if sex_global == 1 then
        glowna = lista_kapelusze
    else
        glowna = lista_kapelusze_f
    end
    if kapelusz ~= tonumber(data.hat) and data.hat ~= nil then
        kapelusz = tonumber(data.hat)
        zmiana(data.hat)
        camera(0.9,0.6)
    end
	 if sex_global == 1 then
        glowna = lista_okulary
    else
        glowna = lista_okulary_f
	end
	if okulary ~= tonumber(data.eyewear) and data.eyewear ~= nil then
        okulary = tonumber(data.eyewear)
        zmiana(data.eyewear)
        camera(0.9,0.6)
    end
    if sex_global == 1 then
        glowna = lista_poncho
    else
        glowna = lista_poncho_f
    end
    if poncho ~= tonumber(data.poncho) and data.poncho ~= nil then
        poncho = tonumber(data.poncho)
        zmiana(data.poncho)
        camera(1.5,0.4)
    end
	
	 if sex_global == 1 then
        glowna = lista_koszula
    else
        glowna = lista_koszula_f
    end
    if koszula ~= tonumber(data.shirt) and data.shirt ~= nil then
        koszula = tonumber(data.shirt)
        zmiana(data.shirt)
        camera(1.5,0.4)
    end
    if sex_global == 1 then
        glowna = lista_kamizelka
    else
        glowna = lista_kamizelka_f
    end
    if kamizelka ~= tonumber(data.vest)  and data.vest ~= nil then
        kamizelka = tonumber(data.vest)
        zmiana(data.vest)
        camera(1.5,0.4)
    end
    if sex_global == 1 then
        glowna = lista_plaszcz
    else
        glowna = lista_plaszcz_f
    end
    if plaszcz ~= tonumber(data.coat)  and data.coat ~= nil then
        plaszcz = tonumber(data.coat)
		Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
        zmiana(data.coat)
        camera(1.6,0.4)

    end
    if sex_global == 1 then
        glowna = lista_spodnie
    else
        glowna = lista_spodnie_f
    end
    if spodnie ~= tonumber(data.pants) and data.pants ~= nil  then
        spodnie = tonumber(data.pants)
        zmiana(data.pants)
        camera(1.6,-0.4)

    end
    if sex_global == 1 then
        glowna = lista_paskinabron
    else
        glowna = lista_paskinabron_f
    end
    if paskinabron ~= tonumber(data.gunbelts) and data.gunbelts ~= nil  then
        paskinabron = tonumber(data.gunbelts)
        zmiana(data.gunbelts)
         camera(1.7,-0.3)

    end
    if sex_global == 1 then
        glowna = lista_paski
    else
        glowna = lista_paski_f
    end
    if paski ~= tonumber(data.belts) and data.belts ~= nil  then
        paski = tonumber(data.belts)
        zmiana(data.belts)
         camera(1.7,-0.3)

    end
    if sex_global == 1 then
        glowna = lista_klamry
    else
        glowna = lista_klamry_f
    end
    if klamry ~= tonumber(data.beltbuckle) and data.beltbuckle ~= nil  then
        klamry = tonumber(data.beltbuckle)
        zmiana(data.beltbuckle)
        camera(1.7,-0.3)

    end
    if sex_global == 1 then
        glowna = lista_kabury
    else
        glowna = lista_kabury_f
    end
    if kabury ~= tonumber(data.offhand) and data.offhand ~= nil  then
        kabury = tonumber(data.offhand)
        zmiana(data.offhand)
        camera(1.7,-0.3)

    end

    if sex_global == 1 then
        glowna = lista_krawaty
    else
        glowna = lista_krawaty_f
    end
    if krawat ~= tonumber(data.neckties) and data.neckties ~= nil  then
        krawat = tonumber(data.neckties)
        zmiana(data.neckties)
        camera(0.9,0.3)

    end
	 if sex_global == 1 then
        glowna = lista_szelki
    else
        glowna = lista_szelki_f
    end
    if szelki ~= tonumber(data.suspenders) and data.suspenders ~= nil  then
        szelki = tonumber(data.suspenders)
        zmiana(data.suspenders)
        camera(1.5,0.4)

    end
    if sex_global == 1 then
        glowna = lista_maska
    else
        glowna = lista_maska_f
    end
    if maska ~= tonumber(data.mask) and data.mask ~= nil then
        maska = tonumber(data.mask)
        zmiana(data.mask)
        camera(0.9,0.6)
    end
    if sex_global == 1 then
        glowna = lista_buty
    else
        glowna = lista_buty_f
    end
    if buty ~= tonumber(data.boots)  and data.boots ~= nil then
        buty = tonumber(data.boots)
        zmiana(data.boots)
        camera(1.6,-0.6)
    end
    if sex_global == 1 then
        glowna = lista_rekawiczki
    else
        glowna = lista_rekawiczki_f
    end
    if rekawiczki ~= tonumber(data.rekawiczki)  and data.rekawiczki ~= nil then
        rekawiczki = tonumber(data.rekawiczki)
        zmiana(data.rekawiczki)
        camera(1.6,-0.2)
    end
    if sex_global == 1 then
        glowna = lista_bandana
    else
        glowna = lista_bandana_f
    end
    if bandana ~= tonumber(data.bandana)  and data.bandana ~= nil then
        bandana = tonumber(data.bandana)
        zmiana(data.bandana)
        camera(0.9,0.6)
    end
	 if sex_global == 1 then
        glowna = lista_ostrogi
    else
        glowna = lista_ostrogi_f
    end
    if ostrogi ~= tonumber(data.spurs)  and data.spurs ~= nil then
        ostrogi = tonumber(data.spurs)
        zmiana(data.spurs)
       camera(1.6,-0.6)
    end
    if sex_global == 2 then
        glowna = lista_spodnica

        if spodnica ~= tonumber(data.skirt)  and data.skirt ~= nil then
            spodnica = tonumber(data.skirt)
            zmiana(data.skirt)
            camera(1.6,-0.4)
        end
    end

end)





function zmiana(wartosc)
    local wartosc2 = tonumber(wartosc)
	print(wartosc2)
    local hash = ("0x" .. glowna[wartosc2])
	print(hash)
    --print(glowna[wartosc2])
		
   if glowna == lista_koszula_f  then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),false,true,true)		
    end	
    if glowna == lista_spodnie_f and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs2),false,true,true)


    elseif glowna == lista_spodnie and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs),false,true,true)


    elseif glowna == lista_koszula and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso),false,true,true)


    elseif glowna == lista_koszula_f and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),false,true,true)


    elseif (glowna == lista_maska_f or glowna == lista_maska) and wartosc2 == 1 then

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_rekawiczki or glowna == lista_rekawiczki_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_bandana or glowna == lista_bandana_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_kapelusze_f or glowna == lista_kapelusze) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0) -- Set target category, here the hash is for hats


    elseif glowna == lista_spodnica and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_plaszcz_f or glowna == lista_plaszcz) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_kamizelka_f or glowna == lista_kamizelka) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_paskinabron or glowna == lista_paskinabron_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_paski or glowna == lista_paski_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_klamry_f or glowna == lista_klamry) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_kabury or glowna == lista_kabury_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista_krawaty or glowna == lista_krawaty_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0) -- Set target category, here the hash is for hats

		
	elseif (glowna == lista_bandana_f or glowna == lista_szelki) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0) -- Set target category, here the hash is for hats

		
	elseif (glowna == lista_ostrogi or glowna == lista_ostrogi_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0) -- Set target category, here the hash is for hats
		
		
	elseif (glowna == lista_poncho or glowna == lista_poncho_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0) -- Set target category, here the hash is for hats
		
		
	elseif (glowna == lista_okulary or glowna == lista_okulary_f) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5E47CA6, 0) -- Set target category, here the hash is for hats



    else

        Citizen.InvokeNative(0xD3A7B003ED343FD9 , PlayerPedId(),  tonumber(hash), false, true, true)

    end

			Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
			Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
			Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)	
end


RegisterNetEvent('redemrp_clothing:load')
AddEventHandler('redemrp_clothing:load', function(skin, ubranie , target)
Citizen.CreateThread(function()
	local _target 
	 local _skin  
    local _ubranie 
	local _t = target
	if _t ~= nil then
	_target = _t
	 _skin = skin
     _ubranie = ubranie
	else
	_target = PlayerPedId()
	_skin = json.decode(skin)
    _ubranie = json.decode(ubranie)
	end
   
    local sex = 1
    local hash = nil
    local wartosc = 1
    --print (_skin.sex)
    print(tonumber(_skin.sex))
    if tonumber(_skin.sex) == 1 then
        sex = 1
    else
        sex = 2
    end
    if sex == 1 then

            SetEntityAlpha(_target, 0)
            glowna = lista_maska
            wartosc = tonumber(_ubranie.mask)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło5")
            end
            glowna = lista_kapelusze
            wartosc = tonumber(_ubranie.hat)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end
            glowna = lista_koszula
            wartosc = tonumber(_ubranie.shirt)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło2")
            end
            glowna = lista_kamizelka
            wartosc = tonumber(_ubranie.vest)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło3")
            end
            glowna = lista_spodnie
            wartosc = tonumber(_ubranie.pants)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło4")
            end
            glowna = lista_buty
            wartosc = tonumber(_ubranie.boots)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_rekawiczki
            wartosc = tonumber(_ubranie.rekawiczki)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_bandana
            wartosc = tonumber(_ubranie.bandana)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_paskinabron
            wartosc = tonumber(_ubranie.gunbelts)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_paski
            wartosc = tonumber(_ubranie.belts)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_klamry
            wartosc = tonumber(_ubranie.beltbuckle)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_kabury
            wartosc = tonumber(_ubranie.offhand)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
		
            glowna = lista_krawaty
            wartosc = tonumber(_ubranie.neckties)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_szelki
            wartosc = tonumber(_ubranie.suspenders)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_ostrogi
            wartosc = tonumber(_ubranie.spurs)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_plaszcz
            wartosc = tonumber(_ubranie.coat)
            if wartosc > 1 then		
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end	
			 glowna = lista_poncho
            wartosc = tonumber(_ubranie.poncho)
			if wartosc == nil then
				wartosc = 1
			end
            if wartosc > 1 then		
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end
			
			glowna = lista_okulary
            wartosc = tonumber(_ubranie.eyewear)
			if wartosc == nil then
				wartosc = 1
			end
            if wartosc > 1 then		
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end
        SetEntityAlpha(_target, 255)	
		Citizen.InvokeNative(0x704C908E9C405136, _target)
		Citizen.InvokeNative(0xAAB86462966168CE, _target, 1)
		Citizen.InvokeNative(0xCC8CA3E88256E58F, _target, 0, 1, 1, 1, 0) -- Actually remove the component
		 TriggerServerEvent('redemrp_respawn:TestStatus')
		if _t ~= nil then
		 TriggerEvent('redemrp_identity:removeLoadingScreen')
		end
    else
			Citizen.InvokeNative(0xD3A7B003ED343FD9, _target,0x10F5497A,true,true,true) -- PANTS
            Citizen.InvokeNative(0xD3A7B003ED343FD9, _target,0x14511493,true,true,true) -- COAT

            SetEntityAlpha(_target, 0)
            glowna = lista_maska_f
            wartosc = tonumber(_ubranie.mask)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło5")
            end
            glowna = lista_kapelusze_f
            wartosc = tonumber(_ubranie.hat)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end
            glowna = lista_koszula_f
            wartosc = tonumber(_ubranie.shirt)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło2")
            end
            glowna = lista_kamizelka_f
            wartosc = tonumber(_ubranie.vest)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło3")
            end
            glowna = lista_spodnie_f
            wartosc = tonumber(_ubranie.pants)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło4")
            end
            glowna = lista_buty_f
            wartosc = tonumber(_ubranie.boots)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_spodnica
            wartosc = tonumber(_ubranie.skirt)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło7")
            end
            glowna = lista_rekawiczki_f
            wartosc = tonumber(_ubranie.rekawiczki)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_bandana_f
            wartosc = tonumber(_ubranie.bandana)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_paskinabron_f	
            wartosc = tonumber(_ubranie.gunbelts)
			print(wartosc)
			print(glowna[wartosc])
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_paski_f
            wartosc = tonumber(_ubranie.belts)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end

            glowna = lista_klamry_f
            wartosc = tonumber(_ubranie.beltbuckle)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_kabury_f
            wartosc = tonumber(_ubranie.offhand)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end

            glowna = lista_krawaty_f
            wartosc = tonumber(_ubranie.neckties)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_szelki_f
            wartosc = tonumber(_ubranie.suspenders)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_ostrogi_f
            wartosc = tonumber(_ubranie.spurs)
            if wartosc > 1 then
                --print(wartosc)
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło6")
            end
            glowna = lista_plaszcz_f
            wartosc = tonumber(_ubranie.coat)
            if wartosc > 1 then	
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end
		 glowna = lista_poncho_f
            wartosc = tonumber(_ubranie.poncho)
			if wartosc == nil then
				wartosc = 1
			end
            if wartosc > 1 then		
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end
			
			glowna = lista_okulary_f
            wartosc = tonumber(_ubranie.eyewear)
			if wartosc == nil then
				wartosc = 1
			end
            if wartosc > 1 then		
                hash = ("0x" .. glowna[wartosc])
                ladowanie(hash, _target)
                --print("poszło1")
            end
        SetEntityAlpha(_target, 255)
		Citizen.InvokeNative(0x704C908E9C405136, _target)
		Citizen.InvokeNative(0xAAB86462966168CE, _target, 1)
		Citizen.InvokeNative(0xCC8CA3E88256E58F, _target, 0, 1, 1, 1, 0) -- Actually remove the component
		 TriggerServerEvent('redemrp_respawn:TestStatus')
        fast = false	
		print("test o tak")
		if _t ~= nil then
		 TriggerEvent('redemrp_identity:removeLoadingScreen')
		end
    end
	end)
end)

function ladowanie(hash, target)
		local _target = target
		Citizen.InvokeNative(0xD3A7B003ED343FD9 , _target,   tonumber(hash), false, true, true)
end

local headingss = 334.00
RegisterNUICallback('heading', function(data)
    local playerPed = PlayerPedId()
    headingss = headingss + data.value
    SetEntityHeading(playerPed, headingss)
end)
RegisterNUICallback('defcam', function(data)
 camera(2.8,-0.15)
end)

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
    local add = 2.0
    if zoom == 0.9 then
        add = 1.0
    else
        add = 3.0
    end
    SetEntityHeading(playerPed, 334.00)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, coords.z + camOffset, 300.00,0.00,0.00, 40.00, false, 0)
    PointCamAtCoord(cam, posToLook.x-add, posToLook.y, coords.z + camOffset)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    DisplayHud(false)
    DisplayRadar(false)
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

Citizen.CreateThread(function()
	Wait(0)
	for k,v in pairs(Config.Zones) do
		local blip = N_0x554d9d53f696d002(1664425300, v)
		SetBlipSprite(blip, Config.BlipSprite, 1)
		SetBlipScale(blip, Config.BlipScale)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.BlipName)
	end
end)

local Outfits_tab = {}
RegisterNetEvent('redemrp_clothing:OpenOutfits')
AddEventHandler('redemrp_clothing:OpenOutfits', function()
    TriggerServerEvent('redemrp_clothing:getOutfits')
end)

RegisterNetEvent('redemrp_clothing:putInTable')
AddEventHandler('redemrp_clothing:putInTable', function(outfit)
    Outfits_tab = {}
    for i, k in pairs(outfit) do
        print(outfit[i].name)
        table.insert(Outfits_tab, {name = outfit[i].name})
    end
	 Outfits()
end)

MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)
function Outfits()
    local elements_outfits = {}

    if Outfits_tab ~= nil then
        for j, z in pairs(Outfits_tab) do
            table.insert (elements_outfits , {label = Outfits_tab[j].name, value = Outfits_tab[j].name , desc =  "Wybierz strój" })
        end
    end


    MenuData.CloseAll()


    MenuData.Open(

        'default', GetCurrentResourceName(), 'outfits_menu',

        {

            title    = 'Outfits',

            subtext    = 'Choose your outfit',

            align    = 'top-left',

            elements = elements_outfits,

        },

        function(data, menu)
            OutfitsManage(data.current.value)
        end,

        function(data, menu)

            menu.close()


        end

    )

end
local elements_outfits_manage = {
    {label = "Ustaw", value = "SetOutfits" , desc =  "Dress your outfit" },
    {label = "Usuń", value = "DeleteOutfit" , desc =  "Take off your outfit" },



}
function OutfitsManage(outfit)

    MenuData.CloseAll()
    MenuData.Open(
        'default', GetCurrentResourceName(), 'outfits_menu_manage',

        {

            title    = 'Outfits',

            subtext    = 'Actions',

            align    = 'top-left',

            elements = elements_outfits_manage,

        },

        function(data, menu)
            menu.close()
            TriggerServerEvent('redemrp_clothing:'..data.current.value , outfit)
        end,

        function(data, menu)

            Outfits()


        end

    )

end

local active = false
local target
Citizen.CreateThread(function()
    while true do
        Wait(1)
        local canwait = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Zones) do
            local dist =  Vdist(coords, v)
            if dist < 2 then
                if dist  < 20 then
                    canwait = false
                end
                if not active then
                    active = true
                    target = k
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.Shoptext, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                end
                if IsControlJustReleased(0, Config.OpenKey) then
                    TriggerServerEvent("redemrp_clothing:loadClothes", 2, function(cb)
                        end)
                end
            else
                if active and k == target then
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", " ", Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
					active = false
                end
            end
        end
        if canwait then
            Wait(1000)
        end
    end
end)


