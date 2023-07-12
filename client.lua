local connectedId = "None"
local QBCore = exports['qb-core']:GetCoreObject()
lib.registerContext({
    id = 'supports_menu',
    title = 'Support & Assist System',
    options = { 
      {
        title = 'Current Session',
        description = 'Connected to id: ' .. connectedId,
        icon = 'circle-info',
      },
      {
        title = 'Connect to Session',
        description = 'Connect to player support session',
        onSelect = function(args)
            local input = lib.inputDialog('ID', {
                { type = 'input', label = 'ID', placeholder = 'ID' },
            })
            if not input then return end
            exports['pma-voice']:addPlayerToCall("12341234")
            QBCore.Functions.Notify('Terhubung dengan channel support assist...', 'primary', 7500)
            TriggerServerEvent("fs-supports:setCall", input[1])
            connectedId = input[1]
        end,
      },
      {
        title = 'Close Session',
        description = 'Close the current session',
        icon = 'power-off',
        onSelect = function()
            exports['pma-voice']:removePlayerFromCall("12341234")
            QBCore.Functions.Notify('Support assist session berakhir', 'primary', 7500)
            TriggerServerEvent("fs-supports:stopCall", connectedId)
			connectedId = "None"
        end,
      },
    }
})

RegisterNetEvent('fs-supports:setCall', function()
  exports['pma-voice']:addPlayerToCall("12341234")
  QBCore.Functions.Notify('Anda sekarang terhubung dengan staff admin', 'primary', 7500)
end)

RegisterNetEvent('fs-supports:stopCall', function()
  exports['pma-voice']:removePlayerFromCall("12341234")
  QBCore.Functions.Notify('Support assist session berakhir', 'primary', 7500)
end)

RegisterCommand('support', function()
  lib.callback('fs-supports:checkPermission', false, function(cb)
      if not cb then QBCore.Functions.Notify('Not have access', 'error', 7500) return end
      lib.showContext('supports_menu')
  end)
end)