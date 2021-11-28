--создаем переменную, которая хранит телепорт КУДА мы будем перелетать
local teleport_1 = game.Workspace.teleport_2
--сщздаем функцию action, которая принимает объект в качестве аргумента  
local function action(touchPart)
	--проверяем на необходимые условия: наличие объекта, модельки и логической переменной is_teleporting, которая должна равняться false
	if touchPart and touchPart.Parent and touchPart.Parent.Humanoid and touchPart.Parent.is_teleporting.Value == false then
		--создаем переменную для персонажа
		local Character = touchPart.Parent
		--создаем переменную для хранения координат КУДА хотим переместиться
		local teleportLocation = CFrame.new(teleport_1.CFrame.X, teleport_1.CFrame.Y + 5, teleport_1.CFrame.Z)
		Character:SetPrimaryPartCFrame(teleportLocation)
		--создаем переменную для логической переменной и меняем ее через 3 секунды после телепортации, чтобы повторно телепортироваться 
		local teleportingValue = Character.is_teleporting
		teleportingValue.Value = true
		wait(3)
		teleportingValue.Value = false
	end
end

--соединяем парт и функцию
script.Parent.Touched:Connect(action)
