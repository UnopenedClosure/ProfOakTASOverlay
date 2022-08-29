dofile ("SectionData.lua")
dofile ("Color.lua")
dofile ("Memory.lua")
dofile ("Data.lua")
dofile ("Utils.lua")

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

local sectionName, sectionPokes

function getSectionPokesByName(secName)
	for i, section in pairs(sectionData) do
		if section["sectionName"] == secName then
			return section["sectionPokes"]
		end
	end
	return nil
end

local pstats = 0x3004360
sectionCount = 0

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
	
	--TODO incorporate these into the for loop
	startX = {2, 46, 90, 2, 46, 90}
	startY = {171, 171, 171, 215, 215, 215}
	
	for i = 1, 6, 1 do		
		gui.drawRectangle(startX[i], startY[i] + 1, pokeImageSize + 9, pokeImageSize + 8, Color.PARTY_SLOT_OUTER_BORDER)
		gui.drawRectangle(startX[i] + 1, startY[i], pokeImageSize + 7, pokeImageSize + 10, Color.PARTY_SLOT_OUTER_BORDER)
		gui.drawRectangle(startX[i] + 2, startY[i] + 2, pokeImageSize + 5, pokeImageSize + 6, Color.PARTY_SLOT_BACKGROUND_TOP, Color.PARTY_SLOT_BACKGROUND_TOP)
		gui.drawRectangle(startX[i] + 2, startY[i] + 27, pokeImageSize + 4, 12, Color.PARTY_SLOT_BACKGROUND_BOTTOM, Color.PARTY_SLOT_BACKGROUND_BOTTOM)
		gui.drawLine(startX[i] + 2, startY[i] + 2, startX[i] + 2, startY[i] + 27, Color.PARTY_SLOT_BACKGROUND_BOTTOM)
		gui.drawLine(startX[i] + 2, startY[i] + 2, startX[i] + pokeImageSize + 6, startY[i] + 2, Color.PARTY_SLOT_BACKGROUND_BOTTOM)
		gui.drawLine(startX[i] + pokeImageSize + 7, startY[i] + 3, startX[i] + pokeImageSize + 7, startY[i] + pokeImageSize + 8, Color.PARTY_SLOT_BACKGROUND_RIGHT_BORDER) 
			
		if emu.framecount() >= 9826 then
			local start = pstats + 100 * (i - 1)
			local personality = Memory.readdword(start)
			local magicword = bit.bxor(personality, Memory.readdword(start + 4))
			local growthoffset = (TableData.growth[(personality % 24) + 1] - 1) * 12
			local growth = bit.bxor(Memory.readdword(start + 32 + growthoffset), magicword)
			
			drawPokemon(Utils.getbits(growth, 0, 16), startX[i], startY[i] - 4)
			local itemIndex = Utils.getbits(growth, 16, 16)
			local xOffset = 0
			local yOffset = 0
			if itemIndex > 0 then
				xOffset = itemXOffset[itemIndex] or xOffset
				yOffset = itemYOffset[itemIndex] or yOffset
				itemStartX = startX[i] + xOffset + 14
				itemStartY = startY[i] + yOffset + 16
				gui.drawImage("../images/items/" .. itemIndex .. ".png", itemStartX, itemStartY)
			end
		end
	end
end

function drawItemBag()
	drawItemBagBackground()
	drawItemBagContents()
end

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
	
	for a = itemBagStartYCoord + 12, yMax - 16, 1 do
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
	local ballIDs = {}
	local ballQuantities = {}
	local totalCount = 0
	while totalCount < 5 and Memory.readword(0x2025D34 + (4 * totalCount)) > 0 do
		ballIDs[totalCount + 1] = Memory.readword(0x2025D34 + (4 * totalCount))
		ballQuantities[totalCount + 1] = Memory.readword(0x2025D36 + (4 * totalCount))
		totalCount = totalCount + 1
	end
	local itemIDs = {}
	local itemQuantities = {}
	local itemCount = 0
	while itemCount < 5 and totalCount < 5 and Memory.readword(0x2025C94 + (4 * itemCount)) > 0 do
		itemIDs[itemCount + 1] = Memory.readword(0x2025C94 + (4 * itemCount))
		itemQuantities[itemCount + 1] = Memory.readword(0x2025C96 + (4 * itemCount))
		itemCount = itemCount + 1
		totalCount = totalCount + 1
	end
	
	for i = 1, totalCount do
		if i <= itemCount then 
			drawText(itemBagStartXCoord + 6, itemBagStartYCoord + (16 * i) - 3, ItemData[itemIDs[i] + 1], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			if itemQuantities[i] == 1 then
				drawText(itemBagStartXCoord + itemBagXWidth - 16, itemBagStartYCoord + (16 * i) - 3, itemQuantities[i], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			elseif itemQuantities[i] < 10 then
				drawText(itemBagStartXCoord + itemBagXWidth - 15, itemBagStartYCoord + (16 * i) - 3, itemQuantities[i], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			else
				drawText(itemBagStartXCoord + itemBagXWidth - 21, itemBagStartYCoord + (16 * i) - 3, itemQuantities[i], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			end
		else
			drawText(itemBagStartXCoord + 6, itemBagStartYCoord + (16 * i) - 3, ItemData[ballIDs[i - itemCount] + 1], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			if ballQuantities[i - itemCount] == 1 then
				drawText(itemBagStartXCoord + itemBagXWidth - 16, itemBagStartYCoord + (16 * i) - 3, ballQuantities[i - itemCount], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			elseif ballQuantities[i - itemCount] < 10 then
				drawText(itemBagStartXCoord + itemBagXWidth - 15, itemBagStartYCoord + (16 * i) - 3, ballQuantities[i - itemCount], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			else
				drawText(itemBagStartXCoord + itemBagXWidth - 21, itemBagStartYCoord + (16 * i) - 3, ballQuantities[i - itemCount], Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
			end
		end
		drawText(itemBagStartXCoord + itemBagXWidth - 27, itemBagStartYCoord + (16 * i) - 3, "x", Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	end
	
	gui.drawLine(itemBagStartXCoord + 7, itemBagStartYCoord + (16 * itemCount) + 11, itemBagStartXCoord + itemBagXWidth - 7, itemBagStartYCoord + (16 * itemCount) + 11, Color.ITEM_BAG_DIVIDER)
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
	sectionCount = 0
	for num, poke in ipairs(sectionPokes) do
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
		
		local natDexNo = (NatDexLookup[poke] or poke) - 1
		local index = math.floor(natDexNo / 8)
		local mask = bit.lshift(1, natDexNo % 8)-- 1 << bit
		local indexVal = Memory.readbyte(0x2024ECC + index)
		if bit.band(indexVal, mask) > 0 then
			drawPokemon(poke, col, row)
			sectionCount = sectionCount + 1
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
	if sectionCount < 10 then
		drawText(countStatsSectionXStart + 83, countStatsSectionYStart + 5, sectionCount .. "/" .. table.getn(sectionPokes), Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	else
		drawText(countStatsSectionXStart + 77, countStatsSectionYStart + 5, sectionCount .. "/" .. table.getn(sectionPokes), Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	end
	local overallCount = 0
	local overallTargetCount = 0
	local matchedSectionYet = false
	for i, secData in ipairs(sectionData) do
		local secName = secData["sectionName"]
		local secPokes = secData["sectionPokes"]
		if not matchedSectionYet then
			if secName == sectionName then
				matchedSectionYet = true
				overallCount = overallCount + sectionCount
			else
				overallCount = overallCount + table.getn(secPokes)
			end
		end
		overallTargetCount = overallTargetCount + table.getn(secPokes)
	end
	if overallCount < 10 then
		drawText(countStatsSectionXStart + 77, countStatsSectionYStart + 18, overallCount .. "/" .. overallTargetCount, Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	elseif overallCount < 100 then
		drawText(countStatsSectionXStart + 71, countStatsSectionYStart + 18, overallCount .. "/" .. overallTargetCount, Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	else
		drawText(countStatsSectionXStart + 65, countStatsSectionYStart + 18, overallCount .. "/" .. overallTargetCount, Color.TEXT_COLOR, Color.TEXT_EMBOSS, 12)
	end
end

while true do
	collectgarbage()
	--TODO don't start reading party and items until we get the Mudkip
	badgeCount = 0
	for badge = 1, 8 do
		byteOffset = 0x2026954 + math.floor((0x800 + badge + 6) / 8)
		bitOffset = (0x800 + badge + 6) % 8
		flagByte = Memory.readword(byteOffset)
		flag = bit.lshift(1, bitOffset)
		badgeCount = badgeCount + bit.rshift(bit.band(flagByte, flag), bitOffset)
	end
	if badgeCount < 8 then
		if badgeCount == 4 then--prevents a problem with lack of Pre-Badge 5
			badgeCount = 5
		end
		sectionName = "Pre-Badge " .. (badgeCount + 1)
	end--TODO add logic for after 8 badges
	sectionPokes = getSectionPokesByName(sectionName)
	
	drawCountSection()
	drawParty()
	drawItemBag()--TODO remove the placeholder logic

	emu.frameadvance()
end