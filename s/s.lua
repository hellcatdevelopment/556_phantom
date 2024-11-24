
RegisterNetEvent('phantom:switch', function(id)
    local src = source
    SetPlayerRoutingBucket(src, tonumber(id))
end)