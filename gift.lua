-- переменная для блока
local gift = script.Parent
--переменная для игрока
local Players = game:GetService('Players')
--переменная для InsertService
local InsertService = game:GetService('InsertService')
--логическая переменная
local action = false





--создаем функцию которая принимает объект
function give_a_gift (object)
	--переменная которая хранит нашего игрока
	local Player = Players:GetPlayerFromCharacter(object.Parent)
	--условие где мы проверяем наличие нашего игрока и логическаую переменную
	if Player and not action then
		--переменная которая хранит скелет
		local Humanoid = object.Parent:FindFirstChildOfClass('Humanoid')
		--если мы коснулись, тогда
		if Humanoid then
			--логическая переменная активна
			action = true
			--переменная с id-номером 
			local gear = 92628074
			-- переменная которая хранит рюкзак игрока
			local Backpack = Player:WaitForChild('Backpack')
			--загружаем вещь из AvatarShop
			local NewGear = InsertService:LoadAsset(gear)
			--переменная которая хранит вещь
			local Tool = NewGear:FindFirstChildOfClass('Tool')
			--если вещь присутствует, тогда
			if Tool then
				--кладем ее в рюкзак
				Tool.Parent = Backpack
			end
			--уничтожаем подарок
			gift:Destroy()
		end
	end
end
--соединяем функцию и парт
gift.Touched:Connect(give_a_gift)
