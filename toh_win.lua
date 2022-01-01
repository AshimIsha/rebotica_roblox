
--переменные для сервисов и значений, которые влияютт на время
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DoorMessage = ReplicatedStorage:WaitForChild("DoorMessage")
local TimerSpeed = ReplicatedStorage:WaitForChild("TimerSpeed")
local MultiplierVisible = ReplicatedStorage:WaitForChild("MultiplierVisible")
local Multiplies = ReplicatedStorage:WaitForChild("Multiplies")
local Minutes = ReplicatedStorage:WaitForChild("Minutes")
local Seconds = ReplicatedStorage:WaitForChild("Seconds")


--список победителей
local Winners = {}

--функция, которая принимает объект в качетсве аргумента, сабатывает при касании блока
script.Parent.Touched:Connect(function(hit)
	--если не персонаж, то выходим из функции
	if not hit.Parent:FindFirstChild("Humanoid") then return end
	--создаем переменную для персонажа
	local Player = game.Players:GetPlayerFromCharacter(hit.Parent)
	--если нет персонажа, выходим из функции
	if not Player then return end
	--если уже есть победитель, то выходим из функции
	if table.find(Winners, Player.UserId) then return end
	--добавляем победителя
	table.insert(Winners, Player.UserId)
	--ускоряем время
	TimerSpeed.Value = TimerSpeed.Value / 2 
	--показываем сообщение о победителе
	DoorMessage:FireAllClients(Player) 
	--показываем ускорение времени
	MultiplierVisible.Value = true -- Makes the "x2" visible
	Multiplies.Value = Multiplies.Value * 2 -- Shows the "x2" text
	
	--если время закончилось, то чистим победителей
	if Minutes.Value == 0 and Seconds.Value == 0 then
		Winners = {}
	end
end)

