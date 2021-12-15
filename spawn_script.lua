--создадим переменную, которая будет хранить наш парт
local car_spawn_1 = game.Workspace.car_spawn_1

--Spawn
--создадим функцию
function car_spawn()
	--в цикле будем проверять наличие наших машин с именем "Car"
	for _, object in pairs(game.Workspace:GetChildren()) do
		--проверка на работу цикла
		print(object.Name)
		--если наша машина на момент касания парта есть, уничтожить ее методом Destroy()
		if(object.Name == "Car") then
			object:Destroy()
		end
	end
	
	
	
	
	
	--в цикле будем проверять все машины из ServerStorage 
	for _, object in pairs(game.ServerStorage:GetChildren()) do
		--создадим переменную которая сделает клона машины
		local car = object:Clone()
		--расположим клона на сцене
		car.Parent = game.Workspace
		car:MakeJoints()
	end
	
	
	
end
--соединим парт и функцию
car_spawn_1.Touched:Connect(car_spawn)
