local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fs-supports:setCall', function(target)
    TriggerClientEvent('fs-supports:setCall', tonumber(target))
end)

RegisterNetEvent('fs-supports:stopCall', function(target)
  TriggerClientEvent('fs-supports:stopCall', tonumber(target))
end)

lib.callback.register('fs-supports:checkPermission', function(source)
  return  QBCore.Functions.GetPermission(source)['admin']
end)