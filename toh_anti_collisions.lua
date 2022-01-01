--создаем переменные для сервисов и группу, в которой будет отсутствовать коллизия
local PhysicsService = game:GetService("PhysicsService")
local PlayerGroup = PhysicsService:CreateCollisionGroup("p")
local Players = game:GetService("Players")

--устанавливаем значение для нашей группы
PhysicsService:CollisionGroupSetCollidable("p", "p", false)


--создаем функцию, в которой присоединяем игроков в группу
function DisableCollision(object)
	--в цикле для касающегося объекта
	for i, v in pairs(object:GetChildren()) do
		-- если это основная часть объекта, тогда 
		if v:IsA("BasePart") then
			--поместить в группу коллизий
			PhysicsService:SetPartCollisionGroup(v, "p")
		end
	end
end


-- когда добавляется игрок,
Players.PlayerAdded:Connect(function(player)
	--достаем персонажа
	player.CharacterAdded:Connect(function(character)
		--храним голову, скелет, и основную часть персонажа
		character:WaitForChild("Head")
		character:WaitForChild("Humanoid")
		character:WaitForChild("HumanoidRootPart")
		wait(0.2)
		--выполняем функцию для отмены коллизий для частей
		DisableCollision(character)
		--если есть персонаж, то и отключить коллизии для всего персонажа
		if player.Character then
			DisableCollision(player.Character)
		end
	end)
end)
