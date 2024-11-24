local currentZones = {}
local currentBucket = nil
local Locations = {}

CreateThread(function()
    for k = 1, #Config.Zones do
        Locations[k] = PolyZone:Create(Config.Zones[k].zones, {
            minZ = Config.Zones[k].minz,
            maxZ = Config.Zones[k].maxz,
            debugGrid = Config.Debug,
            gridDivisions = 20,
        })

        Locations[k]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            local id = Config.Zones[k].zoneID

            if isPointInside then
                currentZones[k] = true
                if currentBucket ~= id then
                    currentBucket = id
                    if Config.Debug then print(id) end
                    TriggerServerEvent('phantom:switch', id)
                end
            else
                currentZones[k] = nil
                local stillInsideOtherZone = false
                for cachedzoneid, _ in pairs(currentZones) do
                    if cachedzoneid ~= k then
                        local cachedid = Config.Zones[cachedzoneid].zoneID
                        if currentBucket ~= cachedid then
                            currentBucket = cachedid
                            if Config.Debug then print(cachedid) end
                            TriggerServerEvent('phantom:switch', cachedid)
                        end
                        stillInsideOtherZone = true
                        break
                    end
                end
                if not stillInsideOtherZone then
                    currentBucket = nil
                    if Config.Debug then print("reset to 0") end
                    TriggerServerEvent('phantom:switch', 0)
                end
            end
        end)
    end
end)