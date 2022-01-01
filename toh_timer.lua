--создаем переменную для ReplicatedStorage
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--создаем переменные для значений, которые участвуют в подсчете времени
local MultiplierVisible = ReplicatedStorage:WaitForChild("MultiplierVisible")
local Multiplies = ReplicatedStorage:WaitForChild("Multiplies")
local TimerTag = ReplicatedStorage:WaitForChild("TimerTag")
local Minutes = ReplicatedStorage:WaitForChild("Minutes")
local Seconds = ReplicatedStorage:WaitForChild("Seconds")
--создаем переменные для textLabel "Timer", "Multiplier"
local Timer = script.Parent:WaitForChild("Timer")
local Multiplier = script.Parent:WaitForChild("Multiplier")
--переменные для цвета 
local Red = Color3.new(0.986007, 0, 0.027039)
local Green = Color3.new(0.155673, 1, 0.0251316)
local White = Color3.new(1, 1, 1)




--создадим функцию, которая будет менять цвета в зависимости от значения минут
Minutes.Changed:Connect(function()
	if Minutes.Value == 0 then
		Timer.TextColor3 = Red
	else
		Timer.TextColor3 = White
	end
end)



--создадим функцию, которая будет менять цвета в зависимости от значения секунд
Seconds.Changed:Connect(function()
	if MultiplierVisible.Value == true then
		Multiplier.Visible = true
		Timer.TextColor3 = Green
	else
		Multiplier.Visible = false
		Timer.TextColor3 = White
	end
--здесь отображаем информацию о том, во сколько раз умножилось время
	Multiplier.Text = "x"..Multiplies.Value
	Timer.Text = TimerTag.Value
end)
