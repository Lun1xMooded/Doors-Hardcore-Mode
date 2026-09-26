-- Ожидаем полную загрузку игры перед проверкой
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Целевой ID плейса
local targetPlaceId = 110258689672367

-- Проверка ID плейса
if game.PlaceId == targetPlaceId then
    print("Script successfully loaded for this place!")
    
    -- Скачиваем и сразу запускаем скрипт с GitHub
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lun1xMooded/Doors-Hardcore-Mode/refs/heads/main/hotelminushardcorescript.lua"))()
    
else
    -- Если ID не совпал, выполняем код с уведомлением
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Bricks"):WaitForChild("Caption")
    local errorMessage = "You are not in the correct place to run this script!"

    if fireclientsignal then
        fireclientsignal(remote.OnClientEvent, errorMessage, true)
    elseif firesignal then
        firesignal(remote.OnClientEvent, errorMessage, true)
    else
        -- Альтернативный вариант для простых экзекуторов
        remote:Fire(errorMessage, true)
    end
end
