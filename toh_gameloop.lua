--переменные сервисов
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

-- переменные из ServerStorage
local StagesFolder = ServerStorage:WaitForChild("Stages")
local Stages = StagesFolder:GetChildren()

-- переменные из Workspace
local Storage = game.Workspace:WaitForChild("Storage")
local Lobby = Storage:WaitForChild("Lobby")
local End = Storage:WaitForChild("End")
local SpawnsModel = Lobby:WaitForChild("Spawns")
local Spawns = SpawnsModel:GetChildren()



-- переменные для таймера
local TimerSpeed = ReplicatedStorage:WaitForChild("TimerSpeed")
local Minutes = ReplicatedStorage:WaitForChild("Minutes")
local Seconds = ReplicatedStorage:WaitForChild("Seconds")
local TimerTag = ReplicatedStorage:WaitForChild("TimerTag")
local MultiplierVisible = ReplicatedStorage:WaitForChild("MultiplierVisible")
local Multiplies = ReplicatedStorage:WaitForChild("Multiplies")


--переменная для башни
local Tower = game.Workspace:WaitForChild("Tower")

--переменные для рандомного спавна и уровней
local RandomSpawn

local Floor1
local Floor2
local Floor3
local Floor4
local Floor5

--логическая переменная для определения конца строительства башни
debounce = false

--функция создания башни
function NewTower()
	--в процессе строительства
	debounce = true
	--ставим первый уровень
	Floor1 = Stages[math.random(1, #Stages)]:Clone()
	Floor1.Parent = Tower
	Floor1.PrimaryPart = Floor1:FindFirstChild("Center")
	Floor1:SetPrimaryPartCFrame(Floor1.Center.CFrame)
	local Floor1Height = Floor1.Height.Value
	wait()
	--ставим второй уровень
	Floor2 = Stages[math.random(1, #Stages)]:Clone()
	Floor2.Parent = Tower
	Floor2.PrimaryPart = Floor2:FindFirstChild("Center")
	--распологаем его над первым уровнем
	Floor2:SetPrimaryPartCFrame(Floor1.Center.CFrame + Vector3.new(0, Floor1Height, 0))
	--распологаем его над первым уровнемразворачиваем на 180 градусов
	Floor2:SetPrimaryPartCFrame(Floor2.Center.CFrame * CFrame.Angles(0, math.rad(180), 0))
	local Floor2Height = Floor2.Height.Value
	wait()
	Floor3 = Stages[math.random(1, #Stages)]:Clone()
	Floor3.Parent = Tower
	Floor3.PrimaryPart = Floor3:FindFirstChild("Center")
	Floor3:SetPrimaryPartCFrame(Floor2.Center.CFrame + Vector3.new(0, Floor2Height, 0))
	Floor3:SetPrimaryPartCFrame(Floor3.Center.CFrame * CFrame.Angles(0, math.rad(180), 0))
	local Floor3Height = Floor3.Height.Value
	wait()
	Floor4 = Stages[math.random(1, #Stages)]:Clone()
	Floor4.Parent = Tower
	Floor4.PrimaryPart = Floor4:FindFirstChild("Center")
	Floor4:SetPrimaryPartCFrame(Floor3.Center.CFrame + Vector3.new(0, Floor3Height, 0))
	Floor4:SetPrimaryPartCFrame(Floor4.Center.CFrame * CFrame.Angles(0, math.rad(180), 0))
	local Floor4Height = Floor4.Height.Value
	wait()
	Floor5 = Stages[math.random(1, #Stages)]:Clone()
	Floor5.Parent = Tower
	Floor5.PrimaryPart = Floor5:FindFirstChild("Center")
	Floor5:SetPrimaryPartCFrame(Floor4.Center.CFrame + Vector3.new(0, Floor4Height, 0))
	Floor5:SetPrimaryPartCFrame(Floor5.Center.CFrame * CFrame.Angles(0, math.rad(180), 0))
	local Floor5Height = Floor5.Height.Value
	wait()
	--ставим финишную модель 
	End.PrimaryPart = End:WaitForChild("Center")
	End:SetPrimaryPartCFrame(Floor5.Center.CFrame + Vector3.new(0, Floor5Height), 0)
	End:SetPrimaryPartCFrame(End.Center.CFrame * CFrame.Angles(0, math.rad(180), 0))
	debounce = false
	
	


	
end

--устанавливаем время
Minutes.Value = 1
Seconds.Value = 0
--скорость таймера
TimerSpeed.Value = 1
--умножение времени невидно
MultiplierVisible.Value = false
Multiplies.Value = 1

--запускаем процесс строительства башни
debounce = true
NewTower()


--gameloop
while true do
	--Работа часов 
	if Minutes and Seconds and TimerSpeed and Tower and Stages then
		repeat
			if Seconds.Value <= 9 then
				TimerTag.Value = tostring(Minutes.Value)..":0"..tostring(Seconds.Value)
			else
				TimerTag.Value = tostring(Minutes.Value)..":"..tostring(Seconds.Value)
			end
			if Seconds.Value <= 0 then
				Minutes.Value = Minutes.Value - 1
				Seconds.Value = 59
			else
				Seconds.Value = Seconds.Value - 1
			end
			wait(TimerSpeed.Value)
		until Minutes.Value <= 0 and Seconds.Value <= 0
		if Minutes.Value <= 0 and Seconds.Value <= 0 then
			TimerTag.Value = "0:00"
		end
		wait(TimerSpeed.Value)
		--Действия по окончанию таймера
		for i, v in pairs(Players:GetChildren()) do
			if v.Character:FindFirstChild("Win") then
				v.Character.Win:Destroy()
			end
			if v:FindFirstChild("Backpack") then
				v.Backpack:ClearAllChildren()
			end
		end
		--очищаем башню
		Tower:ClearAllChildren()
		--выставляем время
		Minutes.Value = 5
		Seconds.Value = 0
		TimerSpeed.Value = 1
		MultiplierVisible.Value = false
		Multiplies.Value = 1

		wait()
		--строим башню
		NewTower()
		--спаун всех игроков по окончанию времени
		for i, v in pairs(Players:GetChildren()) do
			local character = v.Character
			local location = Spawns[math.random(1, #Spawns)]
			local teleportLocation = CFrame.new(location.CFrame.X, location.CFrame.Y + 5, location.CFrame.Z)
			character:SetPrimaryPartCFrame(teleportLocation)
		end
	
	end
end
