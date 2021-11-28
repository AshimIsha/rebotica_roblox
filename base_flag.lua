--создаем переменную для блока основания флага
team = script.Parent 

--создаем функцию, где передаем объект в качестве параметра
function onTouch(hit) 
	--создаем переменную, которая хранит нашего героя
	local user = game.Players:GetPlayerFromCharacter(hit.Parent) 
	--создадим условие, если объект- наш персонаж, тогда
	if user then 
		--цвет основания становится цветом команды, которая захватила флаг
		team.BrickColor = user.TeamColor 
		
	end 
end 
--соединяем парт и функцию
script.Parent.Touched:connect(onTouch) 
