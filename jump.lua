--создаем переменную для нашего парта
local jump_1 = script.Parent

--создаем переменную для силы прыжка
local boost = 120

--создаем функцию, в аргумантах передаем объект, называемый part
function make_jump(part)
	--создаем переменную, где у объекта ищем саму модельку игрока
	local hero = part.Parent:FindFirstChild("Humanoid")
	--если это моделька игрока, то
	if hero then
		--создаем переменную, которая хранит силу прыжка до взаимодействия с самим партом
		local current_power = hero.JumpPower
		--если текущая сила меньше переменной буст, тогда
		if current_power < boost then
			--делаем силу прыжка равной бусту, ждем 1 секунду и возвращаем обратно
			hero.JumpPower = boost
			wait(1)
			hero.JumpPower = current_power
			
		end
	end
end


--соединяем парт и функцию
jump_1.Touched:Connect(make_jump)
