display.setStatusBar(display.HiddenStatusBar)

local numColumns, numRows, marginBottom, marginLeft = 4 , 3 , 2 , 3
local height = display.contentHeight
local tileW = display.contentWidth / numColumns - marginLeft
local tileH = height / numRows - marginBottom

local function createTile(isBlack)
	local tile = display.newRect(1,0,tileW,tileH)
	tile.anchorX = 0
	tile.anchorY = 0

	if (isBlack > 0) then
		tile:setFillColor(0)
	end

	return tile
end


local tPrevious = system.getTimer()
function moveGroup(target)
	local group = target
	local tDelta = ( system.getTimer() - tPrevious ) * 0.0001
	local posY = group.y + tDelta
	local diff = posY - height

	group:translate( group.x , tDelta)

	if (diff > 0) then
		display.remove(group)
		Runtime:removeEventListener("enterFrame",group)

		local posGroup = - tileH - marginBottom
		if (diff > 1) then
			posGroup = posGroup + diff
		end

		group = createGroup(posGroup)
	end
end

function createGroup(posY)
	-- Faz o sort da posição da tecla preta
	local posBlackTile = math.random(1,4)

	local group = display.newGroup()
	local posLastTile , isFirst = 1 , true

	for j = 1, 4 do
		local isBlack = 0
		if ( j == posBlackTile ) then
			isBlack = 1
		end

		local tile = createTile(isBlack)
		if ( isFirst == true ) then
			tile.x = 1
			isFirst = false
		else
			tile.x = posLastTile + tileW + marginLeft
		end

		posLastTile = tile.x
		group:insert(tile)
	end

	group.y = posY
	group.enterFrame = moveGroup
	Runtime:addEventListener("enterFrame",group)
	return group
end

-- Cria os grupos
local posGroup = - tileH - marginBottom
for j = 0, 3, 1 do
	createGroup(j * posGroup)
end