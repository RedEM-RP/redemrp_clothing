local lista = {}
lista.hat = {} --hat
lista.hat_f = {}
----------------------------------------------------------------------------------------------------------------------------
lista.shirt = {} --shirt
lista.shirt_f = {}
--------------------------------------------------------------------------------------------------------------------------------------
lista.vest = {} --vest
lista.vest_f = {}
--------------------------------------------
lista.pants = {} --pants
lista.pants_f = {}
------------------------------------------
lista.mask = {} --mask
lista.mask_f = {}
------------------------------------------
lista.boots = {} --boots
lista.boots_f = {}
-----------------------------------------
lista.coat = {} --coats
lista.coat_f = {}
---------------------------------------
lista.rekawiczki = {}
lista.rekawiczki_f = {}
-------------------------------------
lista.bandana = {}
lista.bandana_f = {}
--------------------------------
lista.gunbelts = {}
lista.gunbelts_f = {}
-------------------------------
lista.belts = {}
lista.belts_f = {}
---------------------------------
lista.beltbuckle ={}
lista.beltbuckle_f = {}
----------------------------------
lista.offhand ={}
lista.offhand_f ={}
-------------------------
lista.neckties = {}
lista.neckties_f = {}
------------------------------
lista.suspenders ={}
lista.suspenders_f ={}
-------------------------
lista.spurs = {}
lista.spurs_f = {}
-------------------------
lista.poncho = {}
lista.poncho_f = {}
-------------------------
lista.eyewear = {}
lista.eyewear_f = {}
-------------------------
lista.skirt = {} --skirt





local femaletorsos = {}
local femalelegs = {}
local maletorsos = {}

local malelegs = {}


local legs = nil
local legs2 = nil
local torso = nil
local torso2 = nil

local adding2 = true
local adding = true

local glowna = lista_kapelusze
local sex_global = 1

local cam = nil
------------------------------------------
local ComponentNumber = {}
ComponentNumber.hat = 1
ComponentNumber.shirt = 1
ComponentNumber.vest = 1
ComponentNumber.coat = 1
ComponentNumber.pants = 1
ComponentNumber.skirt = 1
ComponentNumber.mask = 1
ComponentNumber.boots = 1
ComponentNumber.rekawiczki = 1
ComponentNumber.bandana = 1
ComponentNumber.gunbelts = 1
ComponentNumber.belts = 1
ComponentNumber.beltbuckle = 1
ComponentNumber.offhand = 1
ComponentNumber.neckties = 1
ComponentNumber.suspenders = 1
ComponentNumber.spurs = 1
ComponentNumber.poncho = 1
ComponentNumber.eyewear = 1
--------------------------------------------
local clothes_types = {"mask","hat","shirt","vest", "pants", "boots","rekawiczki","bandana","gunbelts", "belts","beltbuckle", "offhand","neckties","suspenders", "spurs","coat","poncho","eyewear","skirt"}
local isSkinCreatorOpened = false




function ShowSkinCreator(enable , sex)
    local sex1 = sex
    SendNUIMessage({
        openSkinCreator = enable,
        sex = sex1,
        kapelusz = ComponentNumber.hat,
        koszula = ComponentNumber.shirt,
        kamizelka = ComponentNumber.vest,
        plaszcz = ComponentNumber.coat,
        spodnie = ComponentNumber.pants,
        maska = ComponentNumber.mask,
        buty = ComponentNumber.boots,
        rekawiczki = ComponentNumber.rekawiczki,
        bandana = ComponentNumber.bandana,
        spodnica = ComponentNumber.skirt,
        paskinabron = ComponentNumber.gunbelts,
        paski = ComponentNumber.belts,
        klamry = ComponentNumber.beltbuckle,
        kabury = ComponentNumber.offhand,
        krawat = ComponentNumber.neckties,
        szelki = ComponentNumber.suspenders,
        ostrogi = ComponentNumber.spurs,
        poncho = ComponentNumber.poncho,
        okulary = ComponentNumber.eyewear,
    })
    SetNuiFocus(enable, enable)
end


Citizen.CreateThread(function()
    while adding do
        Citizen.Wait(0)
        --print("Dzieje sie")
        for i, v in ipairs(MaleComp) do
            if v.category == "hats" then
                table.insert(lista.hat, v.Hash)
            elseif v.category == "shirts" then
                table.insert(lista.shirt, v.Hash)
            elseif v.category == "vests" then
                table.insert(lista.vest, v.Hash)
            elseif v.category == "pants" then
                table.insert(lista.pants, v.Hash)
            elseif v.category == "masks" then
                table.insert(lista.mask, v.Hash)
            elseif v.category == "coats" then
                table.insert(lista.coat, v.Hash)
            elseif v.category == "boots" then
                table.insert(lista.boots, v.Hash)
            elseif v.category == "torsos" then
                table.insert(maletorsos, v.Hash)
            elseif v.category == "legs" then
                table.insert(malelegs, v.Hash)
            elseif v.category == "gloves" then
                table.insert(lista.rekawiczki, v.Hash)
            elseif v.category == "neckwear" then
                table.insert(lista.bandana, v.Hash)
            elseif v.category == "gunbelts" then
                table.insert(lista.gunbelts, v.Hash)
            elseif v.category == "belts" then
                table.insert(lista.belts, v.Hash)
            elseif v.category == "beltbuckle" then
                table.insert(lista.beltbuckle, v.Hash)
            elseif v.category == "offhand" then
                table.insert(lista.offhand, v.Hash)
            elseif v.category == "neckties" then
                table.insert(lista.neckties, v.Hash)
            elseif v.category == "suspenders" then
                table.insert(lista.suspenders, v.Hash)
            elseif v.category == "spurs" then
                table.insert(lista.spurs, v.Hash)
            elseif v.category == "ponchos" then
                table.insert(lista.poncho, v.Hash)
            elseif v.category == "eyewear" then
                table.insert(lista.eyewear, v.Hash)
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
                table.insert(lista.hat_f, v.Hash)
            elseif v.category == "shirts" then
                table.insert(lista.shirt_f, v.Hash)
            elseif v.category == "vests" then
                table.insert(lista.vest_f, v.Hash)
            elseif v.category == "pants" then
                table.insert(lista.pants_f, v.Hash)
            elseif v.category == "boots" then
                table.insert(lista.boots_f, v.Hash)
            elseif v.category == "masks" then
                table.insert(lista.mask_f, v.Hash)
            elseif v.category == "coats" then
                table.insert(lista.coat_f, v.Hash)
            elseif v.category == "skirts" then
                table.insert(lista.skirt, v.Hash)
            elseif v.category == "torsos" then
                table.insert(femaletorsos, v.Hash)
            elseif v.category == "legs" then
                table.insert(femalelegs, v.Hash)
            elseif v.category == "gloves" then
                table.insert(lista.rekawiczki_f, v.Hash)
            elseif v.category == "neckwear" then
                table.insert(lista.bandana_f, v.Hash)
            elseif v.category == "belts" then
                table.insert(lista.belts_f, v.Hash)
            elseif v.category == "gunbelts" then
                table.insert(lista.gunbelts_f, v.Hash)
            elseif v.category == "beltbuckle" then
                table.insert(lista.beltbuckle_f, v.Hash)
            elseif v.category == "offhand" then
                table.insert(lista.offhand_f, v.Hash)
            elseif v.category == "neckties" then
                table.insert(lista.neckties_f, v.Hash)
            elseif v.category == "suspenders" then
                table.insert(lista.suspenders_f, v.Hash)
            elseif v.category == "spurs" then
                table.insert(lista.spurs_f, v.Hash)
            elseif v.category == "ponchos" then
                table.insert(lista.poncho_f, v.Hash)
            elseif v.category == "eyewear" then
                table.insert(lista.eyewear_f, v.Hash)
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

        ComponentNumber.hat =  tonumber( _ubranie.hat)
        ComponentNumber.shirt =  tonumber( _ubranie.shirt)
        ComponentNumber.vest =  tonumber( _ubranie.vest)
        ComponentNumber.coat =  tonumber( _ubranie.coat)
        ComponentNumber.pants =  tonumber( _ubranie.pants)
        ComponentNumber.skirt =  tonumber( _ubranie.skirt)
        ComponentNumber.mask =  tonumber( _ubranie.mask)
        ComponentNumber.boots =  tonumber( _ubranie.boots)
        ComponentNumber.rekawiczki =  tonumber( _ubranie.rekawiczki)
        ComponentNumber.bandana =  tonumber( _ubranie.bandana)
        ComponentNumber.gunbelts =  tonumber( _ubranie.gunbelts)
        ComponentNumber.belts =  tonumber( _ubranie.belts)
        ComponentNumber.beltbuckle =  tonumber( _ubranie.beltbuckle)
        ComponentNumber.offhand =  tonumber( _ubranie.offhand)
        ComponentNumber.neckties =  tonumber( _ubranie.neckties)
        ComponentNumber.suspenders =  tonumber( _ubranie.suspenders)
        ComponentNumber.spurs =  tonumber( _ubranie.spurs)
        ComponentNumber.poncho =  tonumber( _ubranie.poncho)
        ComponentNumber.eyewear =  tonumber( _ubranie.eyewear)

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
        ComponentNumber.hat =  tonumber( _ubranie.hat)
        ComponentNumber.shirt =  tonumber( _ubranie.shirt)
        ComponentNumber.vest =  tonumber( _ubranie.vest)
        ComponentNumber.coat =  tonumber( _ubranie.coat)
        ComponentNumber.pants =  tonumber( _ubranie.pants)
        ComponentNumber.skirt =  tonumber( _ubranie.skirt)
        ComponentNumber.mask =  tonumber( _ubranie.mask)
        ComponentNumber.boots =  tonumber( _ubranie.boots)
        ComponentNumber.rekawiczki =  tonumber( _ubranie.rekawiczki)
        ComponentNumber.bandana =  tonumber( _ubranie.bandana)
        ComponentNumber.gunbelts =  tonumber( _ubranie.gunbelts)
        ComponentNumber.belts =  tonumber( _ubranie.belts)
        ComponentNumber.beltbuckle =  tonumber( _ubranie.beltbuckle)
        ComponentNumber.offhand =  tonumber( _ubranie.offhand)
        ComponentNumber.neckties =  tonumber( _ubranie.neckties)
        ComponentNumber.suspenders =  tonumber( _ubranie.suspenders)
        ComponentNumber.spurs =  tonumber( _ubranie.spurs)
        ComponentNumber.poncho =  tonumber( _ubranie.poncho)
        ComponentNumber.eyewear =  tonumber( _ubranie.eyewear)
    end
    ShowSkinCreator(true, sex)
    isSkinCreatorOpened = true
    camera(2.8,-0.15)
end)


RegisterCommand("loadcloath", function(source, args)
    TriggerServerEvent("redemrp_clothing:loadClothes", 1, function(cb)
        end)
end)

RegisterNUICallback('exit', function()
    TriggerServerEvent("redemrp_skin:loadSkin")
    isSkinCreatorOpened = false
    ShowSkinCreator(false)
    destory()
end)

RegisterNUICallback('saveClothes', function(data, cb)
    SetNuiFocus(false, false)
    local ped = PlayerPedId()
	 local saveOutfit = false
    local json = json.encode(data)
    FreezeEntityPosition(ped, false)
    DisplayHud(true)
    DisplayRadar(true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    if data.name ~= nil and data.name ~= "" then
        saveOutfit = true
        TriggerServerEvent("redemrp_clothing:Save", json, saveOutfit , data.name, function(cb)
            if cb then
                print("DONE")
            else
                print("ERROR")
            end
        end)
    else

        TriggerServerEvent("redemrp_clothing:Save", json, saveOutfit ,function(cb)
            if cb then
                print("DONE")
            else
                print("ERROR")
            end
        end)
    end
    DestroyAllCams()
    isSkinCreatorOpened = false
    ShowSkinCreator(false)
	 TriggerServerEvent("redemrp_clothing:loadClothes", 3 )
end)



RegisterNUICallback('updateClothes', function(data, cb)
    TriggerEvent("redemrp_clothing:updateClothes" , data)
end)


RegisterNetEvent('redemrp_clothing:updateClothes')
AddEventHandler('redemrp_clothing:updateClothes', function(data)

        for v,k in pairs(clothes_types) do
            if ComponentNumber[k] ~=  tonumber(data[k]) and data[k] ~= nil then
                if sex_global == 1 then
                    glowna = lista[k]
                else
                    glowna = lista[k.."_f"]
                end
                ComponentNumber[k] = tonumber(data[k])
                if k == "coat" then
                    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0) -- Set target category, here the hash is for hats
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0) -- Set target category, here the hash is for hats
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                end
                zmiana(data[k])
                if k == "hat" then
                    camera(0.9,0.6)
                elseif k == "poncho" then
                    camera(1.5,0.4)
                elseif k == "shirt" then
                    camera(1.5,0.4)
                elseif k == "vest" then
                    camera(1.5,0.4)
                elseif k == "coat" then
                    camera(1.6,0.4)
                elseif k == "pants" then
                    camera(1.6,-0.4)
                elseif k == "gunbelts" then
                    camera(1.7,-0.3)
                elseif k == "belts" then
                    camera(1.7,-0.3)
                elseif k == "beltbuckle" then
                    camera(1.7,-0.3)
                elseif k == "offhand" then
                    camera(1.7,-0.3)
                elseif k == "neckties" then
                    camera(0.9,0.3)
                elseif k == "suspenders" then
                    camera(1.5,0.4)
                elseif k == "mask" then
                    camera(0.9,0.6)
                elseif k == "boots" then
                    camera(1.6,-0.6)
                elseif k == "rekawiczki" then
                    camera(1.6,-0.2)
                elseif k == "bandana" then
                    camera(0.9,0.6)
                elseif k == "spurs" then
                    camera(1.6,-0.6)
                elseif k == "skirt" then
                    camera(1.6,-0.4)
                end
            end
        end

end)



function zmiana(wartosc)
    local wartosc2 = tonumber(wartosc)
    local hash = ("0x" .. glowna[wartosc2])

    if glowna == lista["shirt_f"]  then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),false,true,true)
    end
    if glowna == lista["pants_f"] and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs2),false,true,true)


    elseif glowna == lista["pants"] and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(legs),false,true,true)


    elseif glowna == lista["shirt"] and wartosc2 <= 1  then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso),false,true,true)


    elseif glowna == lista["shirt_f"] and wartosc2 <= 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0) -- Set target category, here the hash is for hats
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),tonumber(torso2),false,true,true)


    elseif (glowna == lista["mask_f"] or glowna == lista["mask"]) and wartosc2 == 1 then

        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["rekawiczki"] or glowna == lista["rekawiczki_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["bandana"] or glowna == lista["bandana_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["hat"] or glowna == lista["hat_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0) -- Set target category, here the hash is for hats


    elseif glowna == lista["skirt"] and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["coat"] or glowna == lista["coat_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["vest_f"] or glowna == lista["vest"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["gunbelts"] or glowna == lista["gunbelts_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["belts"] or glowna == lista["belts_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["beltbuckle"] or glowna == lista["beltbuckle_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["offhand"] or glowna == lista["offhand_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["neckties"] or glowna == lista["neckties_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["suspenders"] or glowna == lista["suspenders_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["spurs"] or glowna == lista["spurs_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["poncho"] or glowna == lista["poncho_f"]) and wartosc2 == 1 then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0) -- Set target category, here the hash is for hats


    elseif (glowna == lista["eyewear"] or glowna == lista["eyewear_f"]) and wartosc2 == 1 then
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
        local test = false
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
        SetEntityAlpha(_target, 0)
        while test == false do
            for v,k in pairs(clothes_types) do
				Wait(1)
                if tonumber(_skin.sex) == 1 then
                    glowna = lista[k]
                else
                    glowna = lista[k.."_f"]
                end
                local wartosc = tonumber(_ubranie[k])
                if wartosc > 1 then
                    local hash = ("0x" .. glowna[wartosc])
                    Citizen.InvokeNative(0xD3A7B003ED343FD9 , _target, tonumber(hash), false, true, true)
                end
            end
			
            Citizen.InvokeNative(0x704C908E9C405136, _target)
            Citizen.InvokeNative(0xAAB86462966168CE, _target, 1)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, _target, 0, 1, 1, 1, 0)
            Wait(500)
            test = Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, _target)
			
        end
		
        SetEntityAlpha(_target, 255)
        if _t ~= nil then
            TriggerEvent('redemrp_identity:removeLoadingScreen')
        end
		
    end)
end)




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



