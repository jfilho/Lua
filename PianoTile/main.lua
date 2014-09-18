-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local numColumns = 4
local numRows = 3
local marginBottom = 2
local marginLeft = 3
local tileW = display.contentWidth / numColumns - marginLeft
local tileH = display.contentHeight / numRows - marginBottom

local function createTile(posX,posY,isBlack)
	local tile = display.newRect(posX,posY,tileW,tileH)
	tile.anchorX = 0
	tile.anchorY = 0

	if (isBlack > 0) then
		tile:setFillColor(0)
	end

	return tile
end

function moveGroup(target)
	local group = target
	group.y = group.y + 7

	if (group.y >= display.contentHeight) then
		display.remove(group)
		Runtime:removeEventListener("enterFrame",group)

		group = createGroup(- tileH - marginBottom)
	end
end

local tile = createTile(1,1,0)
-- local tile2 = createTile(tile.x + tileW + marginLeft,1,1)
-- local tile3 = createTile(tile2.x + tileW + marginLeft,1,0)
-- local tile4 = createTile(tile3.x + tileW + marginLeft,1,0)

function createGroup(posY)
	local tileGroup = display.newGroup()
	tileGroup:insert(tile)
	tileGroup[1].y = 100



	tileGroup.enterFrame = moveGroup
	-- Runtime:addEventListener("enterFrame",tileGroup)
	return tileGroup
end



local group = createGroup(0)
tile.y = 300
-- Runtime:addEventListener("enterFrame",group)
-- local group2 = createGroup(group.y - tileH - marginBottom)
-- local group3 = createGroup(group2.y - tileH - marginBottom)
-- local group4 = createGroup(group3.y - tileH - marginBottom)

-- Runtime:addEventListener("enterFrame",group3)
-- Runtime:addEventListener("enterFrame",group4)
-- local group2 = createGroup()
-- local group3 = createGroup()
-- group2.y = group.y + tileH + marginBottom
-- group3.y = group2.y + tileH + marginBottom

-- group3[1]:toBack()