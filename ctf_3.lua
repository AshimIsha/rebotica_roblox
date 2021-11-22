--локальные переменные для окраски и изменения материала элементов карты, с которыми мы не взаимодействуем
local base_1 = game.Workspace.Base_1

local neon_1 = game.Workspace.neon_1
local neon_2 = game.Workspace.neon_2
local neon_3 = game.Workspace.neon_3
local neon_4 = game.Workspace.neon_4

local center_1 = game.Workspace.Center_1

local line_1 = game.Workspace.line_1
local line_2 = game.Workspace.line_2

local wall_1 = game.Workspace.wall_1
local wall_2 = game.Workspace.wall_2
local wall_3 = game.Workspace.wall_3
local wall_4 = game.Workspace.wall_4

--создадим списки цветов для каждой неоновой стены на основе
local colors_neon_1 = {331,221,331,221}
local colors_neon_2 = {221,331,221,331}
local colors_neon_3 = {42,330,44,221}
local colors_neon_4 = {11,331,221,328}

--зададим вечернее время игры
game.Lighting.ClockTime = 22

--создадим функицю, меняющую материал на неон
function change_to_neon(part)
	part.Material = Enum.Material.Neon
end
--создадим функицю, меняющую материал на гранит
function change_to_granite(part)
	part.Material = Enum.Material.Granite
end
--создадим функцию, меняющую цвет, тут будет уже 2 аргумента, парт и номер цвета
function change_color(part,color)
	part.BrickColor = BrickColor.new(color)
end
--создадим функцию, котороая будет поочередности менять цвет на протяжении всей игру у элементов neon_1,2,3,4
function multi_change_color(part, color)
	wait(0.5)
	part.BrickColor = BrickColor.new(color)

end
--меняем материал и цвет у основной площадки, подводных линий и стен, вставляя парт как аргумент функции
change_to_neon(line_1)
change_to_neon(line_2)

change_to_neon(neon_1)
change_to_neon(neon_2)
change_to_neon(neon_3)
change_to_neon(neon_4)

change_to_granite(base_1)

change_to_granite(wall_1)
change_to_granite(wall_2)
change_to_granite(wall_3)
change_to_granite(wall_4)
change_to_granite(center_1)

change_color(line_1, 232)
change_color(line_2, 232)

change_color(base_1,232)

change_color(wall_1,232)
change_color(wall_2,232)
change_color(wall_3,232)
change_color(wall_4,232)

change_color(center_1, 232)

--запустим бесконечный цикл, чтобы цвета стенок менялись на протяжении всей игры
while true do
--запустим цикл меняющий цвета самих стенок
	for i=1, 4 do
--4 потому что у нас в списке для 1 стены 4 цвета
		multi_change_color(neon_1, colors_neon_1[i])
		multi_change_color(neon_2, colors_neon_2[i])
		multi_change_color(neon_3, colors_neon_3[i])
		multi_change_color(neon_4, colors_neon_4[i])

	end
end
