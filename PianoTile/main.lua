-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here



display.setStatusBar(display.HiddenStatusBar)
local marginW = 2
local tileWSize = display.contentWidth / 4 - marginW
local tileHSize = display.contentHeight / 3

print(display.contentWidth)
print(tileWSize)

local function createTile(positionX,positionY,isBlack)
	local tile = display.newRect(positionX,positionY,tileWSize,tileHSize)
	tile.anchorX = 0
	if (isBlack > 0) then
		tile:setFillColor(0)
	else
		tile:setFillColor(1,5,5)
	end

	return tile
end

local numTiles = 0
local function moveTiles(target)
	local tileGroup = target
	tileGroup.y = tileGroup.y + 3

	if (tileGroup.y - tileHSize > display.contentHeight) then
		numTiles = numTiles - 1
		Runtime:removeEventListener("enterFrame",tileGroup)
		tileGroup:remove()
	elseif (tileGroup.y > tileHSize and numTiles < 3) then
		newGroup = createTileGroup()
		numTiles = numTiles + 1
		Runtime:addEventListener("enterFrame",newGroup)
	end

end

function createTileGroup()
	local tile1 = createTile(2,-tileHSize-10,0)
	local tile2 = createTile(tileWSize+marginW+4,-tileHSize-10,0)
	local tile3 = createTile(tileWSize*2+marginW+8,-tileHSize-10,0)
	local tile4 = createTile(tileWSize*3+marginW+12,-tileHSize-10,0)

	local group = display.newGroup()
	group:insert(tile1)
	group:insert(tile2)
	group:insert(tile3)
	group:insert(tile4)
	group.enterFrame = moveTiles

	Runtime:addEventListener("enterFrame",group)
	return group
end


-- createTileGroup()
numTiles = numTiles + 1



-- local tile3 = createTile(tileWSize*2+marginW+1,100,0)
-- local tile4 = createTile(tileWSize*3+3,100,0)
