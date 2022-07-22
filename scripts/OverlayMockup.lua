dofile ("SectionData.lua")
dofile ("Color.lua")

--Screen is 480 x 270 (16:9 aspect ratio)

console.clear()

local screenWidth = 240
local screenHeight = 160
local RIGHT_PAD = 240
local DOWN_PAD = 110
local yMax = screenHeight + DOWN_PAD
local numPokeDisplayColumns = 8
local pokeImageSize = 32
local partyPanelSize = pokeImageSize * 3 + 37
local countSectionXStart = screenWidth
local countSectionYStart = 0
local countSectionXMax = 240 + RIGHT_PAD - 1
local countStatsSectionXStart = 341
local countStatsSectionYStart = 225
local itemBagStartXCoord = partyPanelSize + 2
local itemBagXWidth = 240 - itemBagStartXCoord - 1
local itemBagStartYCoord = 163
client.SetGameExtraPadding(0, 0, RIGHT_PAD, DOWN_PAD)

local sectionName = "Postgame"
local sampleSection = sectionPokes[sectionName]

function drawPokemon(poke, col, row, library)
	local pokeFolder = "/pokemon"
	local size = pokeImageSize
	local extension = ".gif"
	if library == "bw" then
		pokeFolder = pokeFolder .. "-bw"
	end
	gui.drawImage("../images" .. pokeFolder .. "/" .. poke .. extension, col, row, size, size)
end

--this function duplicates RuSa's emboss effect for text
function drawText(x, y, message, forecolor, backcolor, fontsize)
	gui.drawText(x + 1, y, message, backcolor, nil, fontsize, "Pokemon RuSa")
	gui.drawText(x, y + 1, message, backcolor, nil, fontsize, "Pokemon RuSa")
	gui.drawText(x + 1, y + 1, message, backcolor, nil, fontsize, "Pokemon RuSa")
	gui.drawText(x, y, message, forecolor, nil, fontsize, "Pokemon RuSa")
end

function drawRoundedCorners(x1, y1, x2, y2, color)
	color = "black" or color
	
	--UPPER LEFT
	gui.drawPixel(x1, y1, color)
	gui.drawPixel(x1 + 1, y1, color)
	gui.drawPixel(x1, y1 + 1, color)
	
	--UPPER RIGHT
	gui.drawPixel(x2, y1, color)
	gui.drawPixel(x2 - 1, y1, color)
	gui.drawPixel(x2, y1 + 1, color)
	
	--LOWER LEFT
	gui.drawPixel(x1, y2, color)
	gui.drawPixel(x1 + 1, y2, color)
	gui.drawPixel(x1, y2 - 1, color)
	
	--LOWER_RIGHT
	gui.drawPixel(x2, y2, color)
	gui.drawPixel(x2 - 1, y2, color)
	gui.drawPixel(x2, y2 - 1, color)
end

function drawParty()
	gui.drawRectangle(0,160, partyPanelSize, DOWN_PAD - 1, Color.PARTY_OUTER_BORDER, Color.PARTY_OUTER_BORDER)
	
	gui.drawLine(0, 164, partyPanelSize, 164, Color.PARTY_MIDDLE_BORDER)
	gui.drawLine(0, 160 + DOWN_PAD - 5, partyPanelSize, 160 + DOWN_PAD - 5, Color.PARTY_MIDDLE_BORDER)
	
	gui.drawRectangle(0, 165, partyPanelSize, 2, Color.PARTY_INNER_BORDER, Color.PARTY_INNER_BORDER)
	gui.drawRectangle(0, yMax - 8, partyPanelSize, 2, Color.PARTY_INNER_BORDER, Color.PARTY_INNER_BORDER)
	
	for y=168, yMax - 9, 1 do
		if y % 2 == 0 then
			gui.drawLine(0, y, partyPanelSize, y, Color.PARTY_BACKGROUND_STRIPE_2)
		else
			gui.drawLine(0, y, partyPanelSize, y, Color.PARTY_BACKGROUND_STRIPE_1)
		end
	end
	
	partyData = {289, 288, 288, 288, 288, 288}
	partyItems = {68, 110, 2, 187, 69, 22}--rare candy, nugget, ultra ball, kings rock, pp up, super potion
	startX = {2, 46, 90, 2, 46, 90}
	startY = {171, 171, 171, 215, 215, 215}
	itemXOffset = {2, 5, 3, 1, 5, 4}
	itemYOffset = {0, 4, 2, 0, 0, 0}
	
	for i = 1, 6, 1 do		
		gui.drawRectangle(startX[i], startY[i] + 1, pokeImageSize + 9, pokeImageSize + 8, Color.PARTY_SLOT_OUTER_BORDER)
		gui.drawRectangle(startX[i] + 1, startY[i], pokeImageSize + 7, pokeImageSize + 10, Color.PARTY_SLOT_OUTER_BORDER)
		gui.drawRectangle(startX[i] + 2, startY[i] + 2, pokeImageSize + 5, pokeImageSize + 6, Color.PARTY_SLOT_BACKGROUND_TOP, Color.PARTY_SLOT_BACKGROUND_TOP)
		gui.drawRectangle(startX[i] + 2, startY[i] + 27, pokeImageSize + 4, 12, Color.PARTY_SLOT_BACKGROUND_BOTTOM, Color.PARTY_SLOT_BACKGROUND_BOTTOM)
		gui.drawLine(startX[i] + 2, startY[i] + 2, startX[i] + 2, startY[i] + 27, Color.PARTY_SLOT_BACKGROUND_BOTTOM)
		gui.drawLine(startX[i] + 2, startY[i] + 2, startX[i] + pokeImageSize + 6, startY[i] + 2, Color.PARTY_SLOT_BACKGROUND_BOTTOM)
		gui.drawLine(startX[i] + pokeImageSize + 7, startY[i] + 3, startX[i] + pokeImageSize + 7, startY[i] + pokeImageSize + 8, Color.PARTY_SLOT_BACKGROUND_RIGHT_BORDER) 
		
		drawPokemon(partyData[i], startX[i], startY[i] - 4)
		itemStartX = startX[i] + itemXOffset[i] + 15
		itemStartY = startY[i] + itemYOffset[i] + 17
		gui.drawImage("../images/items/" .. partyItems[i] .. ".png", itemStartX, itemStartY)
	end
	
end

function drawItemBag()
	drawItemBagBackground()
	drawItemBagContents()
end

--TODO since a sixth bag slot won't fit, restore the thicker upper and lower borders?
function drawItemBagBackground()
	local y = 0
	while (y + itemBagStartYCoord) < yMax + 1 do
		if y % 4 == 1 or y % 4 == 2 then
			gui.drawLine(itemBagStartXCoord, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth, itemBagStartYCoord + y - 2, Color.ITEM_BAG_STRIPE_1)
			if y > 1 and (y + itemBagStartYCoord) < yMax - 1 then
				if y == 2 or (y + itemBagStartYCoord) == yMax - 2 then
					gui.drawLine(itemBagStartXCoord + 4, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth - 4, itemBagStartYCoord + y - 2, Color.ITEM_BAG_SHADOW_1)
				elseif y == 3 or (y + itemBagStartYCoord) == yMax - 3 then
					gui.drawLine(itemBagStartXCoord + 3, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth - 3, itemBagStartYCoord + y - 2, Color.ITEM_BAG_SHADOW_1)
				else
					gui.drawLine(itemBagStartXCoord + 2, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth - 2, itemBagStartYCoord + y - 2, Color.ITEM_BAG_SHADOW_1)
				end
			end
		else
			gui.drawLine(itemBagStartXCoord, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth, itemBagStartYCoord + y - 2, Color.ITEM_BAG_STRIPE_2)
			if y > 2 and (y + itemBagStartYCoord) < yMax - 2 then
				if y == 2 or (y + itemBagStartYCoord) == yMax - 2 then
					gui.drawLine(itemBagStartXCoord + 4, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth - 4, itemBagStartYCoord + y - 2, Color.ITEM_BAG_SHADOW_2)
				elseif y == 3 or (y + itemBagStartYCoord) == yMax - 3 then
					gui.drawLine(itemBagStartXCoord + 3, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth - 3, itemBagStartYCoord + y - 2, Color.ITEM_BAG_SHADOW_2)
				else
					gui.drawLine(itemBagStartXCoord + 2, itemBagStartYCoord + y - 2, itemBagStartXCoord + itemBagXWidth - 2, itemBagStartYCoord + y - 2, Color.ITEM_BAG_SHADOW_2)
				end
			end
		end
		y = y + 1
	end

	for a = itemBagStartYCoord + 4, yMax - 8, 1 do
		gui.drawLine(itemBagStartXCoord + 6, a, itemBagStartXCoord + itemBagXWidth - 6, a, Color.ITEM_BAG_INNER_BORDER)
	end
	
	for a = itemBagStartYCoord + 7, yMax - 11, 1 do
		gui.drawLine(itemBagStartXCoord + 8, a, itemBagStartXCoord + itemBagXWidth - 8, a, Color.ITEM_BAG_BACKGROUND)
	end

	gui.drawLine(itemBagStartXCoord + 5, itemBagStartYCoord + 2, itemBagStartXCoord + itemBagXWidth - 5, itemBagStartYCoord + 2, Color.ITEM_BAG_OUTER_BORDER)
	gui.drawLine(itemBagStartXCoord + 5, yMax - 6, itemBagStartXCoord + itemBagXWidth - 5, yMax - 6, Color.ITEM_BAG_OUTER_BORDER)
	gui.drawLine(itemBagStartXCoord + 4, itemBagStartYCoord + 3, itemBagStartXCoord + 4, yMax - 7, Color.ITEM_BAG_OUTER_BORDER)
	gui.drawLine(itemBagStartXCoord + itemBagXWidth - 4, itemBagStartYCoord + 3, itemBagStartXCoord + itemBagXWidth - 4, yMax - 7, Color.ITEM_BAG_OUTER_BORDER)
	gui.drawPixel(itemBagStartXCoord + 5, itemBagStartYCoord + 3, Color.ITEM_BAG_OUTER_BORDER)
	gui.drawPixel(itemBagStartXCoord + 5, yMax - 7, Color.ITEM_BAG_OUTER_BORDER)
	gui.drawPixel(itemBagStartXCoord + itemBagXWidth - 5, itemBagStartYCoord + 3, Color.ITEM_BAG_OUTER_BORDER)
	gui.drawPixel(itemBagStartXCoord + itemBagXWidth - 5, yMax - 7, Color.ITEM_BAG_OUTER_BORDER)
	
	gui.drawLine(itemBagStartXCoord + 6, itemBagStartYCoord + 3, itemBagStartXCoord + itemBagXWidth - 6, itemBagStartYCoord + 3, Color.ITEM_BAG_MIDDLE_BORDER)
	gui.drawLine(itemBagStartXCoord + 6, yMax - 7, itemBagStartXCoord + itemBagXWidth - 6, yMax - 7, Color.ITEM_BAG_MIDDLE_BORDER)
	gui.drawLine(itemBagStartXCoord + 5, itemBagStartYCoord + 4, itemBagStartXCoord + 5, yMax - 8, Color.ITEM_BAG_MIDDLE_BORDER)
	gui.drawLine(itemBagStartXCoord + itemBagXWidth - 5, itemBagStartYCoord + 4, itemBagStartXCoord + itemBagXWidth - 5, yMax - 8, Color.ITEM_BAG_MIDDLE_BORDER)
	gui.drawPixel(itemBagStartXCoord + 6, itemBagStartYCoord + 4, Color.ITEM_BAG_MIDDLE_BORDER)
	gui.drawPixel(itemBagStartXCoord + 6, yMax - 8, Color.ITEM_BAG_MIDDLE_BORDER)
	gui.drawPixel(itemBagStartXCoord + itemBagXWidth - 6, itemBagStartYCoord + 4, Color.ITEM_BAG_MIDDLE_BORDER)
	gui.drawPixel(itemBagStartXCoord + itemBagXWidth - 6, yMax - 8, Color.ITEM_BAG_MIDDLE_BORDER)
	
	drawRoundedCorners(itemBagStartXCoord, itemBagStartYCoord - 2, itemBagStartXCoord + itemBagXWidth, yMax - 2)
end

--TODO the x used for the item bag is different from the lower-case x?
--TODO something weird about how 0 is printed? might be one pixel too far to the left
function drawItemBagContents()
	drawText(itemBagStartXCoord + 6, itemBagStartYCoord + 8, "SUPER POTION", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 27, itemBagStartYCoord + 8, "x", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 16, itemBagStartYCoord + 8, "1", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)

	drawText(itemBagStartXCoord + 6, itemBagStartYCoord + 24, "RARE CANDY", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 27, itemBagStartYCoord + 24, "x63", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)

	drawText(itemBagStartXCoord + 6, itemBagStartYCoord + 40, "PP UP", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 27, itemBagStartYCoord + 40, "x20", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)

	drawText(itemBagStartXCoord + 6, itemBagStartYCoord + 56, "POK@ BALL", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 27, itemBagStartYCoord + 56, "x37", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)

	drawText(itemBagStartXCoord + 6, itemBagStartYCoord + 72, "PREMIER BALL", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 27, itemBagStartYCoord + 72, "x", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 15, itemBagStartYCoord + 72, "2", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)

	--can't quite fit a sixth item slot
	--[[drawText(itemBagStartXCoord + 6, itemBagStartYCoord + 88, "GREAT BALL",	Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 27, itemBagStartYCoord + 88, "x", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(itemBagStartXCoord + itemBagXWidth - 15, itemBagStartYCoord + 88, "2", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)--]]
end

function drawCountSection()
	drawCountSectionBackground()
	drawSectionPokes()	
	drawCountStatsSection()
end

function drawCountSectionBackground()
	gui.drawRectangle(countSectionXStart, countSectionYStart, RIGHT_PAD - 1, yMax - 1, "black", Color.COUNT_SECTION_OUTER_BORDER)
	drawRoundedCorners(countSectionXStart + 1, countSectionYStart + 1, countSectionXMax - 1, yMax - 2)  
	gui.drawRectangle(countSectionXStart + 3, countSectionYStart + 5, RIGHT_PAD - 7, yMax - 11, Color.COUNT_SECTION_INNER_BORDER, Color.COUNT_SECTION_BACKGROUND)
	gui.drawRectangle(countSectionXStart + 2, countSectionYStart + 4, RIGHT_PAD - 5, yMax - 9, Color.COUNT_SECTION_MIDDLE_BORDER)
	gui.drawLine(countSectionXStart + 3, countSectionYStart + 3, countSectionXMax - 3, 	countSectionYStart + 3, Color.COUNT_SECTION_MIDDLE_BORDER)
	gui.drawLine(countSectionXStart + 4, countSectionYStart + 2, countSectionXMax - 4, 	countSectionYStart + 2, Color.COUNT_SECTION_MIDDLE_BORDER)
	gui.drawLine(countSectionXStart + 3, yMax - 4, countSectionXMax - 3, yMax - 4, Color.COUNT_SECTION_MIDDLE_BORDER)
	gui.drawLine(countSectionXStart + 4, yMax - 3, countSectionXMax - 4, yMax - 3, Color.COUNT_SECTION_MIDDLE_BORDER)
end

function drawSectionPokes()
	for num, poke in ipairs(sampleSection) do
		local col = 240 + (((num - 1) % numPokeDisplayColumns) * (pokeImageSize - 3))
		if num % numPokeDisplayColumns == 1 then
			col = col + 2
		end
		local row = (math.floor(((num - 1) / numPokeDisplayColumns)) * pokeImageSize) + 3
		if math.floor((num - 1) / numPokeDisplayColumns) >= 5 then
			row = row - 1
		end
		if math.floor((num - 1) / numPokeDisplayColumns) >= 6 then
			row = row - 1
		end
		if num == 7 or num == 8 or num == 13 or num == 17 or num==37 or num == 53 then 
			drawPokemon(poke, col, row)
		else
			drawPokemon(poke, col, row, "bw")
		end
	end
end

function drawCountStatsSection()
	gui.drawRectangle(countStatsSectionXStart, countStatsSectionYStart + 2, RIGHT_PAD - 126, 32, Color.COUNT_STATS_SECTION_OUTER_BORDER)
	gui.drawRectangle(countStatsSectionXStart + 1, countStatsSectionYStart + 1, RIGHT_PAD - 128, 34, Color.COUNT_STATS_SECTION_OUTER_BORDER)
	gui.drawRectangle(countStatsSectionXStart + 2, countStatsSectionYStart, RIGHT_PAD - 130, 36, Color.COUNT_STATS_SECTION_OUTER_BORDER)
	gui.drawRectangle(countStatsSectionXStart + 2, countStatsSectionYStart + 2, RIGHT_PAD - 130, 32, Color.COUNT_STATS_SECTION_INNER_BORDER)
	gui.drawRectangle(countStatsSectionXStart + 3, countStatsSectionYStart + 3, RIGHT_PAD - 132, 30, Color.COUNT_STATS_SECTION_INNER_BORDER, Color.COUNT_STATS_SECTION_BACKGROUND)
	
	drawText(countStatsSectionXStart + 5, countStatsSectionYStart + 5, sectionName .. ":", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(countStatsSectionXStart + 5, countStatsSectionYStart + 18, "Overall:", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(countStatsSectionXStart + 83, countStatsSectionYStart + 5, "5/" .. table.getn(sampleSection), Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	drawText(countStatsSectionXStart + 65, countStatsSectionYStart + 18, "107/202", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
end

while true do
	collectgarbage()
	drawCountSection()
	drawParty()
	drawItemBag()
	emu.frameadvance()
end