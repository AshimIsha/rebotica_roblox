--создадим переменную, которая будет хранить наш парт
local car_spawn_1 = game.Workspace.car_spawn_1

local ch_1 = game.Workspace.checkpoint_1
local ch_2 = game.Workspace.checkpoint_2
local ch_3 = game.Workspace.checkpoint_3





--Checkpoints


--функция вывода сообщения о победителе
function get_winer(player_name)
	--создаем переменную для сообщения
	local message = Instance.new("Message")
	message.Text = player_name .. "is winner!"
	--перемещаем текст на сцену
	message.Parent = game.Workspace
	--ждем 3 секунды
	wait(3)
	--удаляем сообщение
	message:Destroy()
end


--Создаем функции которые будут срабатывать при проезде через них
function ch_1_hit(object)
	--проверка необходимых условий для правильной работы функции
	if object ~= nil and object.Parent ~= nil and object.Parent:FindFirstChild("Humanoid") then
		print("check_done")
		-- если еще не проехали эту точку тогда
		if not ch_1:FindFirstChild(object.Parent.Name) then
			--закрепляем за игроком информацию о том, что он проехал
			local player_tag = Instance.new("StringValue")
			player_tag.Parent = ch_1
			player_tag.Name = object.Parent.Name
		end
		--если 3й(последний чекпоинт пройден, тогда вывести сообщение о победителе)
		if ch_3:FindFirstChild(object.Parent.Name) then
			get_winer(object.Parent.Name)
		end
	end
end

function ch_2_hit(object)
	if object ~= nil and object.Parent ~= nil and object.Parent:FindFirstChild("Humanoid") then
		print("check_done")
		-- если еще не проехали эту точку, но проехал первый чекпоинт, тогда
		if not ch_2:FindFirstChild(object.Parent.Name) and ch_1:FindFirstChild(object.Parent.Name) then
			--закрепляем за игроком информацию о том, что он проехал
			local player_tag = Instance.new("StringValue")
			player_tag.Parent = ch_2
			player_tag.Name = object.Parent.Name
		end
	end
end

function ch_3_hit(object)
	if object ~= nil and object.Parent ~= nil and object.Parent:FindFirstChild("Humanoid") then
		print("check_done")
		---- если еще не проехали эту точку, но проехал второй чекпоинт, тогда
		if not ch_3:FindFirstChild(object.Parent.Name) and ch_2:FindFirstChild(object.Parent.Name) then
			--закрепляем за игроком информацию о том, что он проехал
			local player_tag = Instance.new("StringValue")
			player_tag.Parent = ch_3
			player_tag.Name = object.Parent.Name
		end
	end
end







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


ch_1.Touched:Connect(ch_1_hit)
ch_2.Touched:Connect(ch_2_hit)
ch_3.Touched:Connect(ch_3_hit)
